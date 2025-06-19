import 'package:alvi_automobiles/core/network/models/network_error.dart';
import 'package:alvi_automobiles/data/models/drawer/drawer_item.dart';
import 'package:alvi_automobiles/data/repos/drawer_repo/drawer_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  final _drawerRepo = DrawerRepo();
  List<DrawerItem> _loadedItems = [];
  DrawerCubit() : super(DrawerInitial());

  void getDrawerItems() async {
    if (_loadedItems.isNotEmpty) {
      emit(DrawerLoaded(drawerItems: _loadedItems));
      return;
    }
    final res = await _drawerRepo.getNavItems();

    res.fold((ne) => emit(DrawerError(error: ne)), (di) {
      _loadedItems = di;
      emit(DrawerLoaded(drawerItems: di));
    });
  }
}
