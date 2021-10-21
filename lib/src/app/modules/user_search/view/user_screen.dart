import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/custom_appbar_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/decks/user_deck.dart';

class UserScreen extends StatelessWidget {
  static const screenRoute = "/user";

  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBarComponent(),
              UserDeck(
                username: args,
              )
            ],
          ),
        ),
      ),
    );
  }
}
