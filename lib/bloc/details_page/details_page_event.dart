part of 'details_page_bloc.dart';

sealed class DetailsPageEvent extends Equatable {
  const DetailsPageEvent();

  @override
  List<Object> get props => [];
}

class LoadDetailsPage extends DetailsPageEvent {
  final String mangaId;

  LoadDetailsPage(this.mangaId);
}
