import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/app_colors.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/github_image_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/terms_privacy_policy_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/user_search_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/user_search_form_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/view/user_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({Key? key}) : super(key: key);
  static const screenRoute = "/userSearch";

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final userSearchInputKey = GlobalKey<FormState>();
  final userSearchInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GithubImageComponent(),
                const UserSearchComponent(),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 40,
                  ),
                  child: Text(
                    "Encontre qualquer conta através do seu usuário do GitHub.",
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                UserSearchFormComponent(
                  formKey: userSearchInputKey,
                  textEditingController: userSearchInputController,
                ),
                Container(
                  height: 40,
                  width: 295,
                  margin: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 40,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (userSearchInputKey.currentState!.validate()) {
                        final searchedUserByUser =
                            userSearchInputController.text.trim();

                        Navigator.pushNamed(
                          context,
                          UserScreen.screenRoute,
                          arguments: searchedUserByUser,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    child: Text(
                      'Buscar',
                      style: GoogleFonts.mulish(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const TermsPrivacyPolicyComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
