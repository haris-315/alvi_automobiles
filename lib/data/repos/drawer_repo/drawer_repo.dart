import 'package:alvi_automobiles/core/dio/dio_settings.dart';
import 'package:alvi_automobiles/core/network/constants/network_constants.dart';
import 'package:alvi_automobiles/core/network/models/network_error.dart';
import 'package:alvi_automobiles/data/models/drawer/drawer_item.dart';
import 'package:alvi_automobiles/data/repos/interface/repository.dart';
import 'package:fpdart/fpdart.dart';

class DrawerRepo extends Repository {
  var dio = DioSettings.dio;
  DrawerRepo() {
    super.init();
  }

  Future<Either<NetworkError, List<DrawerItem>>> getNavItems() async {
    try {
      final res = await dio.get(NetworkConstants.drawerItems);
      if (res.statusCode == 200) {
        return right(
          ((res.data as Map)['data'] as List)
              .map((di) => DrawerItem.fromMap(di))
              .toList(),
        );
      } else {
        return left(
          NetworkError(
            message: res.statusMessage ?? "Status code is ${res.statusCode}",
          ),
        );
      }
    } catch (e) {
      return left(
        NetworkError(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
  }
}
