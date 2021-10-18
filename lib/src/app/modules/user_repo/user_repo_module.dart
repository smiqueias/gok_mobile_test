import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/interfaces/i_user_repo.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/repositories/user_repo_repository.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/view/user_repo_screen.dart';

class UserRepoModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<IUserRepo>(
          (i) => UserRepoRepository(
            Modular.get(),
            Modular.get(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => UserRepoScreen(
            userDTO: args.data,
          ),
        ),
      ];
}
