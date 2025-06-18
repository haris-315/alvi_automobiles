part of 'network_cubit.dart';

@immutable
sealed class NetworkState {}

final class NetworkInitial extends NetworkState {}

final class NetworkAvailable extends NetworkState {}

final class NetworkNotAvailable extends NetworkState {}
