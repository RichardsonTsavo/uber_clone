import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  HomeModule({super.key});

  @override
  Widget get view => const HomePage();
}
