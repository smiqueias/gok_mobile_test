import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/view/user_search_screen.dart';

import 'src/app/modules/user_repo/view/user_repo_screen.dart';
import 'src/app/modules/user_search/view/user_screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gok Mobile Test',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: UserSearchScreen.screenRoute,
        routes: {
          UserSearchScreen.screenRoute: (_) => const UserSearchScreen(),
          UserScreen.screenRoute: (_) => const UserScreen(),
          UserRepoScreen.screenRoute: (_) => const UserRepoScreen()
        },
      ),
      designSize: const Size(375, 667),
    );
  }
}
