
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/user_search_module.dart';

class AppModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: UserSearchModule())
  ];

}