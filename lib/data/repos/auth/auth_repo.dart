import 'package:alvi_automobiles/core/dio/dio_settings.dart';
import 'package:alvi_automobiles/core/network/constants/network_constants.dart';
import 'package:alvi_automobiles/core/network/models/network_error.dart';
import 'package:alvi_automobiles/core/services/session_service/session_store_service.dart';
import 'package:alvi_automobiles/data/models/auth/user.dart';
import 'package:alvi_automobiles/data/repos/interface/repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepo extends Repository {
  var dio = DioSettings.dio;

  Future<Either<NetworkError, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var res = await dio.post(
        NetworkConstants.signIn,
        data: {"email": email, "password": password},
      );
      if (res.statusCode != 200) {
        return left(
          NetworkError(
            message:
                res.statusMessage ??
                "There was an error while signin status code: ${res.statusCode}",
          ),
        );
      }
      print(res.data);
      var token = (res.data as Map)['tokens']['access'];
      await SessionStoreService.storeSession(token);
      return right(User.fromMap((res.data as Map)['user']));
    } catch (e) {
      print(
        "There was an error while trying to signin with the credentials $email and the password $password reason: ${e.toString()}",
      );
      return left(NetworkError(message: e.toString()));
    }
  }
}
