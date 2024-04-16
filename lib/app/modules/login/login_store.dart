import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/utils/auth_controller.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final AuthController _authController = Modular.get();
  late AnimationController aninControllerM;
  late AnimationController aninControllerF;

  List<Map<String, dynamic>> users = [
    {
      "name": "Joshua Hunt",
      'imageUrl': "assets/userM.jpg",
      "star": "4.75",
      'position': {
        'adressName':
            "Terrazo Ponta Negra Flat, 4795, Avenida Engenheiro Roberto Freire, Ponta Negra",
        'latLng': {'lat': -5.8782119, 'lon': -35.17581532084816},
      },
    },
    {
      "name": "Lillie Morales",
      'imageUrl': "assets/userF.jpg",
      "star": "4.85",
      'position': {
        'adressName': "Hot Dog Do Negão, 38-36 ,R. Itororós, Potengi",
        'latLng': {'lat': -5.7482255, 'lon': -35.2474952},
      },
    }
  ];

  @action
  void login(int index) {
    _authController.login(data: users[index], type: index == 0 ? "M" : "F");
  }
}
