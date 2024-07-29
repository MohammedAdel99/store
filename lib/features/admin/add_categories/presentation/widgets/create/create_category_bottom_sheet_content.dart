import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/app_button.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/widgets/app_text_form_feild.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/widgets/admin_bottom_sheet_content.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_state.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/add_categories/logic/create/create_category_cubit.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create/create_button.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create/create_category_upload_image.dart';

class CreateCategoryBottomSheetContent extends StatelessWidget {
  const CreateCategoryBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return
        AdminBottomSheetContent(
            textTitle: LangKeys.createCategory,
            textAddImage: context.translate(LangKeys.addImage),
            uploadImageWidget: CreateCategoryUploadImage(),
            textEnterCategoryName: context.translate(LangKeys.enterCategoryName),
            formKey: context.read<CreateCategoryCubit>().formKey ,
            hintTextCategoryName: LangKeys.categoryName,
            textFieldController:
                context.read<CreateCategoryCubit>().categoryNameController,
            blocListenerWidget: CreateCategoryBlocListener(),
            removeButton:  BlocBuilder<UploadImageCubit, UploadImageState>(
                  builder: (context, state) {
                if (context.read<UploadImageCubit>().getImageUrl.isNotEmpty) {
                  return Column(
                    children: [
                   AppButton(
                            onPressed: () {
                              context.read<UploadImageCubit>().removeImage();
                            },
                            borderRadius: 10.r,
                            color: Colors.red,
                            height: 35.h,
                            width: 130.w,
                            child: TextApp(
                                text: context.translate(LangKeys.remove),
                                theme: TextStyles.font17BoldWhite.copyWith(fontWeight: FontWeight.w500)
                                )
                                ),
                      
                      SizedBox(height:5.h),        
                    ],
                  );
                } else {
                  return SizedBox();
                }
              }),
          )
        ;

         
         
  }
}
