// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'position_model.dart';

class UserModel {
  String? name;
  String? imageUrl;
  String? star;
  PositionModel? position;
  UserModel({
    this.name,
    this.imageUrl,
    this.star,
    this.position,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'star': star,
      'position': position?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] != null ? map['name'] as String : null,
      star: map['star'] != null ? map['star'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      position: map['position'] != null
          ? PositionModel.fromMap(map['position'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? name,
    String? imageUrl,
    String? star,
    PositionModel? position,
  }) {
    return UserModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      star: star ?? this.star,
      position: position ?? this.position,
    );
  }
}
