part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<LandingDataItem> landingData;

  HomeLoaded({required this.landingData});
}

final class HomeError extends HomeState {
  final NetworkError error;

  HomeError({required this.error});
}
