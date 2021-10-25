import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final ButtonStyle buttonStyle;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.buttonStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(
        label,
        style: GoogleFonts.mulish(
          fontSize: 16,
          color: AppColors.white,
        ),
      ),
    );
  }
}
