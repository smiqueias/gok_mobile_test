
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_colors.dart';

class CustomButton extends StatelessWidget {

  final GlobalKey<FormState> userSearchInputKey;

  const CustomButton({Key? key, required this.userSearchInputKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
