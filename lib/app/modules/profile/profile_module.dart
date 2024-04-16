import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uber_clone/app/modules/profile/profile_page.dart';
import 'package:uber_clone/app/modules/profile/profile_store.dart';

class ProfileModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfileStore()),
  ];

  ProfileModule({super.key});

  @override
  Widget get view => const ProfilePage();
}
