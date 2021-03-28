import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hore_list/models/hero_status_model.dart';

class HeroDetail extends StatelessWidget {
  final HeroStatusModel hero;

  const HeroDetail({Key key, @required this.hero}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Color(0xff222222),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        width: 40,
                        imageUrl: 'https://api.opendota.com${hero.icon}',
                      ),
                      Text(
                        '${hero.localizedName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                  imageUrl: 'https://api.opendota.com${hero.img}',
                ),
                SizedBox(height: 2),
                _bigHeadSkill(
                  title1: 'ATTRIBUTE',
                  title2: 'ATTACK TYPE',
                  title3: 'ROLE',
                ),
                SizedBox(height: 2),
                Container(
                  height: hero.roles.length == 1
                      ? 25
                      : (18 * hero.roles.length).toDouble(),
                  color: Color(0xff222222),
                  child: Row(
                    children: [
                      _headSkill(
                        title: hero.primaryAttr == "agi"
                            ? 'Agility'
                            : hero.primaryAttr == "int"
                                ? 'Intelligence'
                                : 'Strength',
                        fontSize: 14,
                        color: Color(0xff222222),
                      ),
                      Container(
                        color: Colors.white,
                        width: 2,
                        height: hero.roles.length == 1
                            ? 25
                            : (18 * hero.roles.length).toDouble(),
                      ),
                      _headSkill(
                        title: '${hero.attackType}',
                        fontSize: 14,
                        color: Color(0xff222222),
                      ),
                      Container(
                        color: Colors.white,
                        width: 2,
                        height: hero.roles.length == 1
                            ? 25
                            : (18 * hero.roles.length).toDouble(),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          color: Color(0xff222222),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: hero.roles.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                '${hero.roles[index]}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2),
                _bigHeadSkill(
                  title1: 'BASE HEALTH',
                  title2: 'BASE HEALTH REGEN',
                  title3: 'BASE MANA',
                ),
                SizedBox(height: 2),
                _heroSkill(
                  heroSkill1: hero.baseHealth,
                  heroSkill2: hero.baseHealthRegen,
                  heroSkill3: hero.baseMana,
                ),
                SizedBox(height: 2),
                _bigHeadSkill(
                  title1: 'BASE MANA REGEN',
                  title2: 'BASE ARMOR',
                  title3: 'BASE MR',
                ),
                SizedBox(height: 2),
                _heroSkill(
                  heroSkill1: hero.baseManaRegen,
                  heroSkill2: hero.baseArmor,
                  heroSkill3: hero.baseMr,
                ),
                SizedBox(height: 2),
                _bigHeadSkill(
                  title1: 'BASE ATTACK MIN',
                  title2: 'BASE ATTACK MAX',
                  title3: 'ATTACK RANGE',
                ),
                SizedBox(height: 2),
                _heroSkill(
                  heroSkill1: hero.baseAttackMin,
                  heroSkill2: hero.baseAttackMax,
                  heroSkill3: hero.attackRate,
                ),
                SizedBox(height: 2),
                _bigHeadSkill(
                  title1: 'BASE STRENGTH',
                  title2: 'BASE AGILITY',
                  title3: 'BASE INTELLIGENCE',
                ),
                SizedBox(height: 2),
                _heroSkill(
                  heroSkill1: hero.baseStr,
                  heroSkill2: hero.baseAgi,
                  heroSkill3: hero.baseInt,
                ),
                SizedBox(height: 2),
                _bigHeadSkill(
                  title1: 'STRENGTH GAIN',
                  title2: 'AGILITY GAIN',
                  title3: 'INTELLIGENCE GAIN',
                ),
                SizedBox(height: 2),
                _heroSkill(
                  heroSkill1: hero.strGain,
                  heroSkill2: hero.agiGain,
                  heroSkill3: hero.intGain,
                ),
                SizedBox(height: 2),
                _bigHeadSkill(
                  title1: 'PROJECTILE SPEED',
                  title2: 'ATTACK RATE',
                  title3: 'MOVE SPEED',
                ),
                SizedBox(height: 2),
                _heroSkill(
                  heroSkill1: hero.projectileSpeed,
                  heroSkill2: hero.attackRate,
                  heroSkill3: hero.moveSpeed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _heroSkill({dynamic heroSkill1, dynamic heroSkill2, dynamic heroSkill3}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _headSkill(
          title: heroSkill1 == null ? '-' : '$heroSkill1',
          color: Color(0xff222222),
        ),
        SizedBox(width: 2),
        _headSkill(
          title: heroSkill2 == null ? '-' : '$heroSkill2',
          color: Color(0xff222222),
        ),
        SizedBox(width: 2),
        _headSkill(
          title: heroSkill3 == null ? '-' : '$heroSkill3',
          color: Color(0xff222222),
        ),
      ],
    );
  }

  Row _bigHeadSkill({String title1, String title2, String title3}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _headSkill(title: '$title1', fontSize: 10),
        SizedBox(width: 2),
        _headSkill(title: '$title2', fontSize: 10),
        SizedBox(width: 2),
        _headSkill(title: '$title3', fontSize: 10),
      ],
    );
  }

  Expanded _headSkill(
      {String title, double fontSize = 14, Color color = Colors.black}) {
    return Expanded(
      child: Container(
        height: 30,
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        color: color,
        child: Center(
          child: Text(
            '$title',
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
