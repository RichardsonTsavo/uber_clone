// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:latlong2/latlong.dart';

class PositionModel {
  String? adressName;
  LatLng? latLng;
  PositionModel({
    this.adressName,
    this.latLng,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adressName': adressName,
      'latLng': {
        'lat': latLng?.latitude,
        "lon": latLng?.longitude,
      },
    };
  }

  factory PositionModel.fromMap(Map<String, dynamic> map) {
    return PositionModel(
      adressName:
          map['adressName'] != null ? map['adressName'] as String : null,
      latLng: map['latLng'] != null
          ? LatLng(map['latLng']["lat"], map['latLng']['lon'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PositionModel.fromJson(String source) =>
      PositionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PositionModel copyWith({
    String? adressName,
    LatLng? latLng,
  }) {
    return PositionModel(
      adressName: adressName ?? this.adressName,
      latLng: latLng ?? this.latLng,
    );
  }
}
