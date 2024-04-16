import 'package:flutter_modular/flutter_modular.dart';
import 'package:uber_clone/app/shared/models/user_model.dart';

class AuthController {
  late String userType;
  UserModel? user;

  Future login(
      {required Map<String, dynamic> data, required String type}) async {
    userType = type;
    await Future.delayed(const Duration(seconds: 3));
    user = UserModel.fromMap(data);
    Modular.to.pushReplacementNamed("/start/");
  }
}
