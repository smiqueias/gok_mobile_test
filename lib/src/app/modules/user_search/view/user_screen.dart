import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/custom_appbar_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/user_deck_component.dart';

class UserScreen extends StatelessWidget {
  final String username;

  const UserScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBarComponent(),
              UserDeckComponent(
                username: username,
              )
            ],
          ),
        ),
      ),
    );
  }
}
