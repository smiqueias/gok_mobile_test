
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_colors.dart';
import '../../../app_images.dart';

class CustomAppBarComponent extends StatelessWidget {
  const CustomAppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8,),
      height: 72,
      width: 375,
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppImages.githubLogo,
            width: 98.92,
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            onPressed: () => Modular.to.navigate('/'),
            child: Text(
              'Adiconar novo',
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
