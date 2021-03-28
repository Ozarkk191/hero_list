import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hore_list/bloc/hero_bloc.dart';
import 'package:hore_list/repositories/dota_repositories.dart';
import 'package:hore_list/src/page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hero Dota',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HeroBloc(
              repository: GetHeroRepository(),
            ),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
