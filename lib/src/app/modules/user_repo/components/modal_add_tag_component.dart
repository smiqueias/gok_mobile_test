import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/boxes.dart';
import 'package:gok_mobile_test/src/app/global/custom_button.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/models/tag_model.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/models/user_repo_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';
import '../../../app_colors.dart';
import 'chip_component.dart';

class ModalAddTagComponent extends StatelessWidget {
  final TextEditingController _addTagInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Widget child;
  final int index;
  final List<UserRepoModel> state;
  List<TagModel> tags = [];
  final box = Boxes.getTags();
  ModalAddTagComponent(
      {Key? key, required this.child, required this.index, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 27.44.h, vertical: 32.w),
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
                              Validatorless.required("Preencha este campo"),
                              Validatorless.min(2, "mínimo 2 caracteres"),
                            ]),
                            decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                              suffixIcon: Icon(
                                Icons.add,
                                size: 24,
                              ),
                              hintText: "Tag...",
                              border: OutlineInputBorder(gapPadding: 8.0),
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
                              errorStyle: TextStyle(
                                color: Colors.transparent,
                                fontSize: 0,
                              ),
                              errorMaxLines: 1,
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
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                      children: List.generate(7, (index) {
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
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final box = Boxes.getTags();
                                    final tag = TagModel()
                                      ..name = _addTagInputController.text;
                                    await box.add(tag);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Tag Adcionada com Sucesso!'),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Preecha o campo!',
                                          style: GoogleFonts.mulish(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                buttonStyle: ElevatedButton.styleFrom(
                                  primary: AppColors.buttonColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      100.r,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
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
      child: child,
    );
  }
}
