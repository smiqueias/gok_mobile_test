import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/models/user_repo_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app_colors.dart';
import '../../../app_images.dart';
import 'modal_add_tag_component.dart';

class TagListComponent extends StatelessWidget {
  final Size size;
  final int index;
  final List<UserRepoModel> state;

  const TagListComponent(
      {Key? key, required this.size, required this.index, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return state[index].tags!.isEmpty || state[index].tags == null
        ? ModalAddTagComponent(
            state: state,
            index: index,
            child: Container(
              margin: EdgeInsets.only(left: 16.w, top: 12.h),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(100.0.r),
              ),
              height: 21.h,
              width: 96.w,
              child: Center(
                child: Text(
                  "Adicionar TAG",
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          )
        : Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: state[index].tags!.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.98.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(100.0.r),
                          ),
                          height: 21.h,
                          width: 96.w,
                          child: Center(
                            child: Text(
                              state[index].tags![index].name.toString(),
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: index == (state[index].tags!.length - 1),
                        child: Padding(
                          padding: EdgeInsets.only(right: 6.0.w),
                          child: ModalAddTagComponent(
                            state: state,
                            index: index,
                            child: Image.asset(
                              AppImages.editTagListIcon,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          );
  }
}
