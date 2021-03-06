import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/app_colors.dart';
import 'package:gok_mobile_test/src/app/global/custom_button.dart';
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
                  margin: EdgeInsets.only(
                    top: 10.h,
                    left: 40.w,
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
                    height: 40.h,
                    width: 295.w,
                    margin: EdgeInsets.symmetric(
                      vertical: 24.w,
                      horizontal: 40.h,
                    ),
                    child: CustomButton(
                      label: "Buscar",
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
                      buttonStyle: ElevatedButton.styleFrom(
                          primary: AppColors.buttonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r))),
                    )),
                const TermsPrivacyPolicyComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
