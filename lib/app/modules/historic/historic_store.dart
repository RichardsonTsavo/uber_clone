import 'package:flutter_modular/flutter_modular.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:uber_clone/app/shared/utils/auth_controller.dart';

import '../../shared/data/data_paths.dart';

part 'historic_store.g.dart';

class HistoricStore = _HistoricStoreBase with _$HistoricStore;

abstract class _HistoricStoreBase with Store {
  AuthController authController = Modular.get();
  DataPaths dataPaths = DataPaths();

  LatLng getCenter() {
    int center = ((dataPaths.getInfo("car1To${authController.userType}").map(
              (e) {
                return LatLng(e["location"][0], e["location"][1]);
              },
            ).toList())
                .length /
            2)
        .round();
    return (dataPaths.getInfo("car1To${authController.userType}").map(
      (e) {
        return LatLng(e["location"][0], e["location"][1]);
      },
    ).toList())[center];
  }
}
