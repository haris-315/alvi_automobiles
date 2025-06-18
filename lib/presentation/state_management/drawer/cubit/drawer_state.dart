part of 'drawer_cubit.dart';

@immutable
sealed class DrawerState {}

final class DrawerInitial extends DrawerState {}

final class DrawerLoading extends DrawerState {}

final class DrawerLoaded extends DrawerState {
  final List<DrawerItem> drawerItems;

  DrawerLoaded({required this.drawerItems});
}

final class DrawerError extends DrawerState {
  final NetworkError error;

  DrawerError({required this.error});
}
