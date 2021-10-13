
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_colors.dart';

class TermsPrivacyPolicyComponent extends StatelessWidget {
  const TermsPrivacyPolicyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 130,
      ),
      child: Center(
        child: Text.rich(TextSpan(
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
              TextSpan(text: "e "),
              TextSpan(
                text: "privacidade",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              )
            ])),
      ),
    );
  }
}
