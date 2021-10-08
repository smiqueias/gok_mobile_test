import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/app_colors.dart';
import 'package:gok_mobile_test/src/app/app_images.dart';
import 'package:gok_mobile_test/src/app/global/components/custom_button.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/github_image_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/user_search_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/user_search_form_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({Key? key}) : super(key: key);

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
                    "Crie sua conta através do seu usuário \ndo GitHub",
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                UserSearchFormComponent(
                  formKey: userSearchInputKey,
                  textEditingController : userSearchInputController,
                ),
                CustomButton(userSearchInputKey: userSearchInputKey,),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 130,
                  ),
                  child: Center(
                    child: Text.rich(
                        TextSpan(
                            text: "Termos de ",
                            style: GoogleFonts.mulish(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            children: const [
                              TextSpan(
                                text: "política ",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                  text: "e "
                              ),
                              TextSpan(
                                text: "privacidade",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              )
                            ]
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
