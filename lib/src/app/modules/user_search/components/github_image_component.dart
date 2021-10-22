import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_images.dart';

class GithubImageComponent extends StatelessWidget {
  const GithubImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 60.h,
        left: 89.w,
        right: 88.15.w,
        bottom: 80.h,
      ),
      child: Center(
        child: Image.asset(
          AppImages.githubLogo,
        ),
      ),
    );
  }
}
