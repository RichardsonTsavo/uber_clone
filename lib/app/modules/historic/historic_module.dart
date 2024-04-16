import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uber_clone/app/modules/historic/historic_page.dart';
import 'package:uber_clone/app/modules/historic/historic_store.dart';

class HistoricModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HistoricStore()),
  ];

  HistoricModule({super.key});

  @override
  Widget get view => const HistoricPage();
}
