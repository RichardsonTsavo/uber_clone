import 'package:flutter_modular/flutter_modular.dart';
import 'package:uber_clone/app/modules/login/login_module.dart';
import 'package:uber_clone/app/modules/map/map_module.dart';
import 'package:uber_clone/app/modules/splash/splash_module.dart';
import 'package:uber_clone/app/modules/start/start_module.dart';

import 'shared/utils/auth_controller.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule(), transition: TransitionType.fadeIn),
    ModuleRoute(
      '/login',
      module: LoginModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/start',
      module: StartModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/map',
      module: MapModule(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
