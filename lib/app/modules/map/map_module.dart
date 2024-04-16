import 'package:flutter_modular/flutter_modular.dart';
import 'package:uber_clone/app/modules/map/map_page.dart';
import 'package:uber_clone/app/modules/map/map_store.dart';

class MapModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MapStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => MapPage(
        pathSelected: args.data,
      ),
    ),
  ];
}
