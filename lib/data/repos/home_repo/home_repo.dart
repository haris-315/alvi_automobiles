import 'package:alvi_automobiles/core/dio/dio_settings.dart';
import 'package:alvi_automobiles/core/network/constants/network_constants.dart';
import 'package:alvi_automobiles/core/network/models/network_error.dart';
import 'package:alvi_automobiles/data/models/home/landing_data_item.dart';
import 'package:alvi_automobiles/data/repos/interface/repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepo extends Repository {
  final dio = DioSettings.dio;
  HomeRepo() {
    super.init();
  }

  Future<Either<NetworkError, List<LandingDataItem>>> getLandingData() async {
    try {
      final res = await dio.get(NetworkConstants.landingData);
      if (res.statusCode == 200) {
        List<LandingDataItem> data =
            ((res.data as Map)['data'] as List)
                .map((li) => LandingDataItem.fromMap(li))
                .toList();
        return right(data);
      }
      return left(
        NetworkError(
          message: res.statusMessage ?? "There was an error",
          stackTrace: null,
        ),
      );
    } catch (e) {
      return left(
        NetworkError(message: e.toString(), stackTrace: StackTrace.current),
      );
    }
    
  }
}
