import 'package:uber_clone/app/modules/start/start_page.dart';
import 'package:uber_clone/app/modules/start/start_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => StartStore()),];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => StartPage()),];

}