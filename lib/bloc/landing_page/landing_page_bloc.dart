import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proyecto_final/data_models/manga_data.dart';

part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(LandingPageInitial()) {
    on<SearchLandingPage>(_searchLandingPage);
    on<CleanLandingPage>(_cleanLandingPage);
  }

  Future<void> _searchLandingPage(
      SearchLandingPage event, Emitter<LandingPageState> emit) async {
    try {
      MangaModel manga = await MangaModel().getData(event.queryText);
      if (manga.getId() != 'Placeholder') {
        emit(LandingPageFound(manga.getId()!));
      } else {
        emit(LandingPageNotFound());
      }
    } catch (e) {
      emit(LandingPageNotFound());
    }
  }

  Future<void> _cleanLandingPage(
      CleanLandingPage event, Emitter<LandingPageState> emit) async {
    emit(LandingPageInitial());
  }
}
