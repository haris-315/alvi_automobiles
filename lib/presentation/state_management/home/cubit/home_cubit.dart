import 'package:alvi_automobiles/core/network/constants/network_constants.dart';
import 'package:alvi_automobiles/core/network/models/network_error.dart';
import 'package:alvi_automobiles/data/models/home/landing_data_item.dart';
import 'package:alvi_automobiles/data/repos/home_repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo = HomeRepo();
  HomeCubit() : super(HomeInitial());

  Future<void> loadLandingData(BuildContext context) async {
    emit(HomeLoading());
    final res = await _homeRepo.getLandingData();

    res.fold((ne) => emit(HomeError(error: ne)), (ld) async {
      ld.map(
        (li) => precacheImage(
          NetworkImage(NetworkConstants.baseUrlNoSlash + li.image),
          context,
        ),
      );
      Future.delayed(Duration(seconds: 5)).then((_) {
        emit(HomeLoaded(landingData: ld));
      });
    });
  }
}
