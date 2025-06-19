import 'package:alvi_automobiles/core/network/models/network_error.dart'
    show NetworkError;
import 'package:alvi_automobiles/core/services/session_service/session_store_service.dart';
import 'package:alvi_automobiles/data/models/auth/user.dart';
import 'package:alvi_automobiles/data/repos/auth/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo = AuthRepo();
  User? user;
  AuthCubit() : super(AuthInitial());

  Future<User?> setUser() async {
    try {
      user = await SessionStoreService.getUser();
      return user;
    } catch (_) {
      print("There was an error while setting up the user.");
    }
    return null;
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      var res = await authRepo.signIn(email: email, password: password);
      res.fold((ne) => emit(AuthError(error: ne)), (usr) async {
        SessionStoreService.storeUser(usr.toJson());
        user = usr;
        emit(AuthLoaded(user: usr));
      });
    } catch (e) {
      emit(
        AuthError(
          error: NetworkError(
            message: e.toString(),
            stackTrace: StackTrace.current,
          ),
        ),
      );
    }
  }
}
