
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/view/user_screen.dart';
import 'view/user_search_screen.dart';

class UserSearchModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_,args) => const UserSearchScreen()),
    ChildRoute('/user/:name', child: (_,args) => const UserScreen()),
  ];

}