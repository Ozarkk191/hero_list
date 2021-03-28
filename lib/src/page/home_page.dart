import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hore_list/bloc/hero_bloc.dart';
// import 'package:hore_list/models/hero_model.dart';
import 'package:hore_list/models/hero_status_model.dart';
import 'package:hore_list/src/page/hero_detail.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<HeroBloc>().add(HeroEvent.fetchHero);
    return Scaffold(
      backgroundColor: Color(0xff111111),
      body: Container(
        child: BlocBuilder<HeroBloc, HeroState>(builder: (context, state) {
          if (state is HeroInitial) {
            return _loadingUI(context);
          } else if (state is HeroLoadedState) {
            return _heroListUI(context, state);
          } else {
            return _errorUI();
          }
        }),
      ),
    );
  }

  Widget _heroListUI(BuildContext context, HeroLoadedState state) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: state.heroList,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    List<HeroStatusModel> list = snapshot.data;
                    List<HeroStatusModel> _agiList = <HeroStatusModel>[];
                    List<HeroStatusModel> _strList = <HeroStatusModel>[];
                    List<HeroStatusModel> _intList = <HeroStatusModel>[];
                    _agiList = list
                        .where((element) => element.primaryAttr == "agi")
                        .toList();
                    _strList = list
                        .where((element) => element.primaryAttr == "str")
                        .toList();
                    _intList = list
                        .where((element) => element.primaryAttr == "int")
                        .toList();
                    return SafeArea(
                      child: Column(
                        children: [
                          SizedBox(height: 60),
                          _header(context, 'Agility'),
                          _body(context, _agiList),
                          _header(context, 'Intelligence'),
                          _body(context, _intList),
                          _header(context, 'Strength'),
                          _body(context, _strList),
                        ],
                      ),
                    );
                  } else {
                    return _loadingUI(context);
                  }
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Color(0xff222222),
            child: Row(
              children: [
                Image.network(
                  'https://image.flaticon.com/icons/png/512/588/588267.png',
                  width: 40,
                ),
                Text(
                  'HERO DOTA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _body(BuildContext context, List<HeroStatusModel> list) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: GridView.count(
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 7,
        children: List.generate(list.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroDetail(hero: list[index]),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(1),
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    imageUrl: 'https://api.opendota.com${list[index].img}',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Container _header(BuildContext context, String title) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: EdgeInsets.only(left: 20),
      color: Color(0xff222222),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Center _errorUI() {
    return Center(
      child: Text('ERROR'),
    );
  }

  Widget _loadingUI(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
