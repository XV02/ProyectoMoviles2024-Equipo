part of 'landing_page_bloc.dart';

sealed class LandingPageEvent extends Equatable {
  const LandingPageEvent();

  @override
  List<Object> get props => [];
}

class LoadLandingPage extends LandingPageEvent {}

class SearchLandingPage extends LandingPageEvent {
  final String queryText;

  SearchLandingPage(this.queryText);
}

class CleanLandingPage extends LandingPageEvent {}
