import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/app_images.dart';
import 'package:gok_mobile_test/src/app/global/custom_button.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/chip_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';
import '../../../app_colors.dart';

class TagListComponent extends StatelessWidget {
  final List<String> tags;
  final Size size;
  final TextEditingController _addTagInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  TagListComponent({Key? key, required this.tags, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: tags.length,
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
                        tags[index],
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
                  visible: index == (tags.length - 1),
                  child: Padding(
                    padding: EdgeInsets.only(right: 6.0.w),
                    child: InkWell(
                      onTap: () => showDialog(
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 27.h),
                              child: SizedBox(
                                height: 480.h,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 27.44.h,
                                            vertical: 32.w),
                                        child: Text(
                                          "Adicionar tags",
                                          style: GoogleFonts.mulish(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      ),
                                      Form(
                                        key: _formKey,
                                        child: SizedBox(
                                          height: 40.h,
                                          width: 287.w,
                                          child: TextFormField(
                                            controller: _addTagInputController,
                                            keyboardType: TextInputType.name,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[a-zA-Z]+')),
                                            ],
                                            validator: Validatorless.multiple([
                                              Validatorless.required(
                                                  "Preencha este campo"),
                                            ]),
                                            onFieldSubmitted: (value) =>
                                                print(value),
                                            decoration: const InputDecoration(
                                              alignLabelWithHint: true,
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(8),
                                              suffixIcon: Icon(
                                                Icons.send,
                                                size: 24,
                                              ),
                                              hintText: "Tag...",
                                              border: InputBorder.none,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.borderColor,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.borderColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      SizedBox(
                                        width: 288.w,
                                        height: 167.h,
                                        child: Card(
                                          elevation: 16,
                                          color: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 14.37.h,
                                                  vertical: 16.0.w,
                                                ),
                                                child: Text(
                                                  "Sugestões",
                                                  style: GoogleFonts.mulish(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: AppColors.grey,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: ListView(
                                                  shrinkWrap: true,
                                                  children: [
                                                    Wrap(
                                                      children: List.generate(7,
                                                          (index) {
                                                        return ChipComponent(
                                                          index: index,
                                                        );
                                                      }),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24.h,
                                      ),
                                      Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              height: 40.h,
                                              child: CustomButton(
                                                label: "Salvar",
                                                onPressed: () => {},
                                                buttonStyle:
                                                    ElevatedButton.styleFrom(
                                                  primary:
                                                      AppColors.buttonColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      100.r,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text(
                                                "Cancelar",
                                                style: GoogleFonts.mulish(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
