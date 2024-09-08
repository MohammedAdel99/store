import 'package:flutter/material.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/widgets/app_text_form_feild.dart';
import 'package:store/core/extensions/navigator_extension.dart';


class AdminProductBottomSheetContent extends StatelessWidget {
  const AdminProductBottomSheetContent(
      {Key? key,
      required this.textTitle,
      required this.textAddImage,
      required this.uploadImagesWidget,
      required this.formKey,
      required this.buttonWidget,
      this.removeButton,
      required this.titleController,
      required this.priceController,
      required this.decorationController,
      required this.dropDwonWidget})
      : super(key: key);

  final String textTitle;
  final String textAddImage;
  final Widget uploadImagesWidget;

  final Key formKey;

  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController decorationController;
  final Widget buttonWidget;
  final Widget? removeButton;
  final Widget dropDwonWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                
                Center(
                    child: TextApp(
                  textAlign: TextAlign.center,
                  text: context.translate(textTitle),
                  theme: TextStyles.font20BoldWhite,
                )),
             
            SizedBox(
              height: 15.h,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: context.translate(LangKeys.addPhotos),
                  theme: TextStyles.font17BoldWhite
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                removeButton ?? SizedBox.shrink()
              ],
            ),
            uploadImagesWidget,
            SizedBox(
              height: 15.h,
            ),
            TextFormFeild(
                context: context,
                text: LangKeys.productTitle,
                textInputType: TextInputType.text,
                controller: titleController,
                textValidation: LangKeys.titleValidation),
            SizedBox(height: 10.h),
            TextFormFeild(
                context: context,
                text: LangKeys.productPrice,
                textInputType: TextInputType.number,
                controller: priceController,
                textValidation: LangKeys.priceValidation),
            SizedBox(height: 10.h),
            TextFormFeild(
                context: context,
                text: LangKeys.productDescription,
                textInputType: TextInputType.text,
                controller: decorationController,
                textValidation: LangKeys.descriptionValidation,
                maxLines: 4),
            SizedBox(height: 10.h),
            
            dropDwonWidget,
            SizedBox(height: 15.h),
            buttonWidget,
            SizedBox(height: 5.h)
          ]),
        ),
      ),
    );
  }

  Widget TextFormFeild(
      {required BuildContext context,
      required String text,
      int? maxLines,
      required TextInputType textInputType,
      required TextEditingController controller,
      required String textValidation}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: context.translate(text),
          theme: TextStyles.font17RegularWhite
              .copyWith(fontWeight: FontWeight.normal),
        ),
        AppTextFormField(
          maxLines: maxLines,
          keyboardType: TextInputType.text,
          hintText: text,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.translate(textValidation);
            }
          },
          backgroundColor: mainBlue,
          hintStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          enabledBorderColor: Colors.white,
          focusedBorderColor: Colors.grey,
        ),
      ],
    );
  }
}
