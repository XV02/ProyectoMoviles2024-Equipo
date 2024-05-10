part of 'landing_page_bloc.dart';

sealed class LandingPageState extends Equatable {
  const LandingPageState();

  @override
  List<Object> get props => [];
}

final class LandingPageInitial extends LandingPageState {}

final class LandingPageNotFound extends LandingPageState {}

final class LandingPageFound extends LandingPageState {
  final String mangaId;

  LandingPageFound(this.mangaId);
}
