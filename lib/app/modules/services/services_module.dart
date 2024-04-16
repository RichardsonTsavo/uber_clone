import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uber_clone/app/modules/services/services_page.dart';
import 'package:uber_clone/app/modules/services/services_store.dart';

class ServicesModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ServicesStore()),
  ];

  ServicesModule({super.key});

  @override
  Widget get view => const ServicesPage();
}
