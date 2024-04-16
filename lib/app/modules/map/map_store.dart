import 'dart:math';

import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:uber_clone/app/shared/utils/auth_controller.dart';

import '../../shared/data/data_paths.dart';

part 'map_store.g.dart';

class MapStore = _MapStoreBase with _$MapStore;

abstract class _MapStoreBase with Store {
  final DataPaths _dataPaths = DataPaths();
  @observable
  bool containBottomSheet = true;

  @observable
  int bottomSheetStage = 0;

  String pathSelected = '';

  @observable
  Polyline currentPolyline = Polyline(
    points: [],
    color: Colors.black,
  );
  @observable
  List<Marker> currentMarkes = [];
  AuthController authController = Modular.get();
  MapController mapController = MapController();

  @action
  void iniData() {
    currentMarkes.clear();
    currentMarkes.add(
      Marker(
        point: authController.user!.position!.latLng!,
        width: 40,
        height: 40,
        child: const Icon(
          CupertinoIcons.map_pin,
          size: 40,
          color: Colors.black,
        ),
      ),
    );
    for (var i = 0; i < 3; i++) {
      currentMarkes.add(
        Marker(
          point: LatLng(
            _dataPaths
                .getInfo("car${i}To${authController.userType}")
                .first["location"][0],
            _dataPaths
                .getInfo("car${i}To${authController.userType}")
                .first["location"][1],
          ),
          width: 40,
          height: 40,
          child: Image.asset("assets/carMarker.png"),
        ),
      );
    }
  }

  @action
  Future callScript() async {
    containBottomSheet = false;
    int car = Random().nextInt(3);

    for (var i = 0; i <= car; i++) {
      currentMarkes.clear();
      LatLng currentCarPosition = LatLng(
        _dataPaths
            .getInfo("car${i}To${authController.userType}")
            .first["location"][0],
        _dataPaths
            .getInfo("car${i}To${authController.userType}")
            .first["location"][1],
      );
      List<Marker> updateMarker = [
        Marker(
          point: currentCarPosition,
          width: 40,
          height: 40,
          child: Image.asset("assets/carMarker.png"),
        ),
      ];
      currentMarkes = updateMarker;
      smoothCameraMove(currentCarPosition, 17);

      await Future.delayed(const Duration(seconds: 4));
    }
    List<Map<String, dynamic>> info =
        _dataPaths.getInfo("car${car}To${authController.userType}");

    await createPath(info);

    await Asuka.showModalBottomSheet(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(title: Text("O motorista chegou!")),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Ir ao destino"),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );

    List<Map<String, dynamic>> infoDestiny =
        _dataPaths.getInfo("${authController.userType}To$pathSelected");
    await createPath(infoDestiny);
    await Asuka.showModalBottomSheet(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(title: Text("Corrida finalizada")),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Modular.to.pop();
            },
            child: const Text("Sair"),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Future createPath(List<Map<String, dynamic>> info) async {
    List<Map<String, dynamic>> currentData = [];
    await smoothCameraMoveBetweenPoints(
        LatLng(info.first['location'][0], info.first['location'][1]),
        LatLng(info.last['location'][0], info.last['location'][1]));
    for (var i = 0; i < info.length; i++) {
      currentData.add(info[i]);
      List<LatLng> currentLatLng = [];
      for (var element in currentData) {
        currentLatLng.add(
          LatLng(
            element["location"][0],
            element["location"][1],
          ),
        );
      }
      currentPolyline = Polyline(
        points: currentLatLng,
        color: Colors.black,
        strokeWidth: 5,
      );
      await Future.delayed(const Duration(milliseconds: 100));
    }
    await Future.delayed(
      const Duration(seconds: 2),
    );
    List<LatLng> positions =
        info.map((e) => LatLng(e['location'][0], e['location'][1])).toList();
    await moveCar(positions);
  }

  Future moveCar(List<LatLng> positions) async {
    while (positions.isNotEmpty) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      positions.removeAt(0);
      currentPolyline = Polyline(
        points: positions,
        color: Colors.black,
        strokeWidth: 5,
      );
      if (positions.isEmpty) {
        continue;
      }
      LatLng carPosition =
          LatLng(positions.first.latitude, positions.first.longitude);

      currentMarkes.clear();

      List<Marker> updateMarker = [
        Marker(
          point: carPosition,
          width: 40,
          height: 40,
          child: Image.asset("assets/carMarker.png"),
        )
      ];
      currentMarkes = updateMarker;
    }
  }

  @action
  void changeBottomSheetStage(int value) {
    bottomSheetStage = value;
  }

  void smoothCameraMove(LatLng newPosition, double newZoom) {
    final LatLng currentPos = mapController.camera.center;
    final double currentZoom = mapController.camera.zoom;

    const double totalFrames = 60;

    final double latDistance =
        (newPosition.latitude - currentPos.latitude) / totalFrames;
    final double lngDistance =
        (newPosition.longitude - currentPos.longitude) / totalFrames;
    final double zoomDistance = (newZoom - currentZoom) / totalFrames;

    void moveNextFrame(int frame) {
      if (frame < totalFrames) {
        mapController.move(
          LatLng(currentPos.latitude + (latDistance * frame),
              currentPos.longitude + (lngDistance * frame)),
          currentZoom + (zoomDistance * frame),
        );
        Future.delayed(const Duration(milliseconds: 16), () {
          moveNextFrame(frame + 1);
        });
      } else {
        mapController.move(newPosition, newZoom);
      }
    }

    moveNextFrame(1);
  }

  Future smoothCameraMoveBetweenPoints(LatLng point1, LatLng point2) async {
    final double newLatitude = (point1.latitude + point2.latitude) / 2;
    final double newLongitude = (point1.longitude + point2.longitude) / 2;

    // final double distance = calculateDistance(point1, point2);
    double zoom = await calculateZoom(point1, point2);

    smoothCameraMove(LatLng(newLatitude, newLongitude), zoom);
  }

  Future<double> calculateZoom(LatLng point1, LatLng point2) async {
    final double distance = Geolocator.distanceBetween(
      point1.latitude,
      point1.longitude,
      point2.latitude,
      point2.longitude,
    );

    // Fator de ajuste, você pode ajustar conforme necessário
    const double paddingFactor = 1.5;

    // Valor de zoom máximo (mínimo nível de zoom)
    const double minZoom = 2.0;

    // Fórmula simplificada para calcular o zoom
    final double zoom = 16 - log(distance / 500) / log(2);

    return zoom.clamp(minZoom, 18.0); // Limita o zoom entre minZoom e 18
  }

  double calculateDistance(LatLng point1, LatLng point2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((point2.latitude - point1.latitude) * p) / 2 +
        c(point1.latitude * p) *
            c(point2.latitude * p) *
            (1 - c((point2.longitude - point1.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }
}
