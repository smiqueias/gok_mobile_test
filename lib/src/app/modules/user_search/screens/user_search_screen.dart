import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/app_colors.dart';
import 'package:gok_mobile_test/src/app/app_images.dart';
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
                Container(
                  margin: const EdgeInsets.only(
                    top: 60,
                    left: 89,
                    right: 88.15,
                    bottom: 80,
                  ),
                  child: Center(
                    child: Image.asset(
                      AppImages.githubLogo,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 41,
                  ),
                  child: Text(
                    "Buscar usuário",
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 32,
                  ),
                  child: Form(
                    key: userSearchInputKey,
                    child: SizedBox(
                      child: TextFormField(
                        controller: userSearchInputController,
                        keyboardType: TextInputType.name,
                        cursorColor: AppColors.grey,
                        validator: Validatorless.multiple([
                          Validatorless.required("Preencha este campo"),
                        ]),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:  BorderSide(
                              color: AppColors.borderColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                              color: AppColors.borderColor,
                            ),
                          ),
                          hintText: "@username",
                          hintStyle: GoogleFonts.roboto(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          prefixIcon: const Icon(
                            Icons.account_circle,
                            color: AppColors.iconColor,
                          )
                        ),
                      ),
                    ),
                  ),
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
                      if ( userSearchInputKey.currentState!.validate()) {
                        print("TUDO OK, buscar nome no github");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                      )
                    ),
                    child: Text(
                      'Cadastrar',
                      style: GoogleFonts.mulish(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
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
