import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_colors.dart';

class UserSearchComponent extends StatelessWidget {
  const UserSearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
