part of 'hero_bloc.dart';

abstract class HeroState {
  const HeroState();
}

class HeroInitial extends HeroState {}

class HeroLoadedState extends HeroState {
  final Future<List<HeroStatusModel>> heroList;
  HeroLoadedState({@required this.heroList});
}

class LoadingErrorState extends HeroState {}
