import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/view/user_repo_screen.dart';

class UserRepoModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const UserRepoScreen(),
        ),
      ];
}
