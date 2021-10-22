import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/cubit/user_repo_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app_colors.dart';

class RepoInfoComponent extends StatelessWidget {
  final int index;
  final Size size;
  final dynamic state;
  final UserRepoCubit userRepoCubit;

  const RepoInfoComponent({
    Key? key,
    required this.index,
    required this.size,
    required this.state,
    required this.userRepoCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16.0.h,
        left: 16.0.w,
        bottom: 8.0.h,
      ),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(
                Icons.language,
                size: 16,
                color: AppColors.borderColor,
              ),
              Text(
                state.userRepoModel[index].language!,
                style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            width: (16 / size.width) * size.width,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 16,
                color: AppColors.borderColor,
              ),
              Text(
                state.userRepoModel[index].stargazersCount.toString(),
                style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            width: (16 / size.width) * size.width,
          ),
          Row(
            children: [
              const Icon(
                Icons.supervisor_account,
                size: 16,
                color: AppColors.borderColor,
              ),
              Text(
                state.userRepoModel[index].watchersCount.toString(),
                style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            width: (16 / size.width) * size.width,
          ),
          Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 16,
                color: AppColors.borderColor,
              ),
              Text(
                userRepoCubit
                        .calculateRepoTime(
                          state.userRepoModel[index].createdAt,
                        )
                        .toString() +
                    " dias atrás",
                style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
