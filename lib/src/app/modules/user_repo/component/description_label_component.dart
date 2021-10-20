import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionLabelComponent extends StatelessWidget {
  final Size size;
  final String description;
  //final dynamic state;

  const DescriptionLabelComponent({
    Key? key,
    required this.size,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
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
