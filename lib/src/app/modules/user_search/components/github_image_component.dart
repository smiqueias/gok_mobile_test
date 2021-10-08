
import 'package:flutter/material.dart';

import '../../../app_images.dart';

class GithubImageComponent extends StatelessWidget {
  const GithubImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 60,
        left: 89,
        right: 88.15,
        bottom: 80,
      ),
      child: Center(
        child: Image.asset(
          AppImages.githubLogo,
        ),
      ),
    );
  }
}
