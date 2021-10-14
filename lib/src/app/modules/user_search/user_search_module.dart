
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/data/repositories/user_search_repository.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/view/user_screen.dart';
import 'view/user_search_screen.dart';

class UserSearchModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton((i) => UserSearchRepository(Modular.get(), Modular.get())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_,args) => const UserSearchScreen()),
    ChildRoute('/user/:username', child: (_,args) => UserScreen(username: args.params['username'])),
  ];

}