import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/components/description_label_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/components/repo_info_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/components/star_icon_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/components/tag_list_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/cubit/user_repo_cubit.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/models/user_repo_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/extensions/string_extension.dart';
import '../../../app_colors.dart';

class UserRepoDeck extends StatelessWidget {
  final Size size;
  final int index;
  final List<UserRepoModel> state;
  final UserRepoCubit userRepoCubit;

  const UserRepoDeck({
    Key? key,
    required this.size,
    required this.index,
    required this.state,
    required this.userRepoCubit,
  }) : super(key: key);

  Future<void> _launcLink(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      const snackBar = SnackBar(content: Text("Não foi possível acessar o repopositório"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 8.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: .08,
            spreadRadius: 0.0,
            offset: const Offset(
              0.0,
              1.0,
            ),
          )
        ],
      ),
      height: 190.h,
      width: 343.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      top: 26.h,
                    ),
                    child: Text(
                      state[index].name!.toString().intelliTrim(23),
                      style: GoogleFonts.mulish(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (8 / size.width) * size.width,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.h,
                    ),
                    child: IconButton(
                      onPressed: () => _launcLink(
                        state[index].htmlUrl,
                        context,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              StarIconComponent(
                index: index,
                size: size,
                state: state,
              ),
            ],
          ),
          DescriptionLabelComponent(
            size: size,
            description: state[index].description!.toString().intelliTrim(40),
          ),
          RepoInfoComponent(
            index: index,
            size: size,
            state: state,
            userRepoCubit: userRepoCubit,
          ),
        ],
      ),
    );
  }
}
