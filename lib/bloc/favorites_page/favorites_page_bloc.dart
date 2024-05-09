import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorites_page_event.dart';
part 'favorites_page_state.dart';

class FavoritesPageBloc extends Bloc<FavoritesPageEvent, FavoritesPageState> {
  FavoritesPageBloc() : super(FavoritesPageInitial()) {
    on<FavoritesPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
