part of 'details_page_bloc.dart';

sealed class DetailsPageState extends Equatable {
  const DetailsPageState();

  @override
  List<Object> get props => [];
}

final class DetailsPageInitial extends DetailsPageState {}

class LoadDetailsPageLoaded extends DetailsPageEvent {
  final List manga;

  LoadDetailsPageLoaded(this.manga);
}

class LoadDetailsPageError extends DetailsPageEvent {}
