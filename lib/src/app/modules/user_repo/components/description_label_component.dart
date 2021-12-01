import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionLabelComponent extends StatelessWidget {
  final Size size;
  final String description;

  const DescriptionLabelComponent({
    Key? key,
    required this.size,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.w,
      ),
      child: Text(
        description,
        style: GoogleFonts.mulish(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        overflow: TextOverflow.clip,
      ),
    );
  }
}
