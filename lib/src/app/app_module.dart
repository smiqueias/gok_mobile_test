
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/user_search_module.dart';
import 'package:logging/logging.dart';

class AppModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton((i) => Dio()),
    Bind.lazySingleton((i) => Logger("App Logger"))
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: UserSearchModule())
  ];

}