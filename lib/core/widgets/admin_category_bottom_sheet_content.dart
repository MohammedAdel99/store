import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/widgets/app_text_form_feild.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';

class AdminCategoryBottomSheetContent extends StatelessWidget {
  const AdminCategoryBottomSheetContent({
    super.key,
    required this.textTitle,
    required this.textAddImage,
    required this.uploadImageWidget,
    required this.textEnterCategoryName,
    required this.formKey,
    required this.hintTextCategoryName,
    required this.textFieldController,
    required this.blocListenerWidget,
    this.removeButton, this.validation,
  });

  final String textTitle;
  final String textAddImage;
  final Widget uploadImageWidget;
  final String textEnterCategoryName;
  final Key formKey;
  final String hintTextCategoryName;
  final TextEditingController textFieldController;
  final Widget blocListenerWidget;
  final Widget? removeButton;
  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Spacer(),
              Center(
                  child: TextApp(
                textAlign: TextAlign.center,
                text: context.translate(textTitle),
                theme: TextStyles.font20BoldWhite,
              )),
              Spacer(),
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp(
                text: context.translate(LangKeys.addPhoto),
                theme: TextStyles.font17BoldWhite
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              removeButton ?? SizedBox.shrink()
            ],
          ),
          uploadImageWidget,
          SizedBox(
            height: 15.h,
          ),
          TextApp(
            text: context.translate(textEnterCategoryName),
            theme: TextStyles.font17BoldWhite
                .copyWith(fontWeight: FontWeight.normal),
          ),
          AppTextFormField(
            keyboardType: TextInputType.text,
            hintText: LangKeys.categoryName,
            controller: textFieldController,
            validator: validation,
            backgroundColor: mainBlue,
            hintStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            focusedBorderColor: Colors.grey,
            enabledBorderColor: Colors.white,
          ),
          SizedBox(height: 17.h),
          blocListenerWidget,
          SizedBox(height: 5.h)
        ],
      ),
    );
  }
}
