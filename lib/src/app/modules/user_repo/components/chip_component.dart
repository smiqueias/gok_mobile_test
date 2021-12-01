import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/app_colors.dart';
import 'package:gok_mobile_test/src/app/utils/suggestions_items_list.dart';
import 'package:google_fonts/google_fonts.dart';

class ChipComponent extends StatefulWidget {
  final int index;

  const ChipComponent({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<ChipComponent> createState() => _ChipComponentState();
}

class _ChipComponentState extends State<ChipComponent> {
  List<String> suggestions = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 7; i++) {
      var randomIndex = Random();
      suggestions.add(suggestionsItemsList[
          randomIndex.nextInt(suggestionsItemsList.length)]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13.w),
      child: Chip(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: AppColors.buttonColor.withOpacity(0.08),
        label: Text(suggestions[widget.index]),
        labelStyle: GoogleFonts.mulish(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }
}
