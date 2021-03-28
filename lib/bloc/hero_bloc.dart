import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hore_list/models/hero_model.dart';
import 'package:hore_list/models/hero_status_model.dart';
import 'package:hore_list/repositories/dota_repositories.dart';

part 'hero_state.dart';

enum HeroEvent {
  fetchHero,
  error,
}

class HeroBloc extends Bloc<HeroEvent, HeroState> {
  HeroBloc({this.repository}) : super(HeroInitial());

  final GetHeroRepository repository;

  @override
  Stream<HeroState> mapEventToState(HeroEvent event) async* {
    switch (event) {
      case HeroEvent.fetchHero:
        yield HeroLoadedState(heroList: repository.fetchHeroList());
        // yield LoadingErrorState();
        break;
      case HeroEvent.error:
        yield LoadingErrorState();
        break;
      default:
    }
  }
}
