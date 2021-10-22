import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_colors.dart';

class FilterListIconComponent extends StatelessWidget {
  final Size size;

  const FilterListIconComponent({Key? key, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 8.0.w,
        top: 8.0.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4.0.r),
      ),
      height: 40.h,
      width: 40.w,
      child: const Center(
        child: Icon(
          Icons.filter_list,
          size: 24,
        ),
      ),
    );
  }
}
