import 'package:dartz/dartz.dart';
import 'package:setup_provider/domain/facade/auth_facade.dart';
import 'package:setup_provider/domain/model/user_model.dart';
import 'package:setup_provider/infastructura/servises/dio.dart';

import '../servises/error_handler.dart';

class AuthRepo implements AuthFacade {
  @override
  Future<Either<UserModel, String>> login({required String email,required String password}) async {
    try {
      final res = await DioService.client().post("/api/v1/auth/login",queryParameters: {"email":email,"password": password});

      return left(UserModel(firstname: res.data.toString()));
    } catch (e) {
      return right(ErrorHandler.getDioStatusMessage(e));
    }
  }
}
