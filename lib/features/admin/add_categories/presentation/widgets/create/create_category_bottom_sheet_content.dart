import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/app_button.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_state.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/widgets/admin_category_bottom_sheet_content.dart';
import 'package:store/features/admin/add_categories/logic/create/create_category_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_state.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create/create_category_button.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create/create_category_upload_image.dart';

class CreateCategoryBottomSheetContent extends StatelessWidget {
  const CreateCategoryBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetAllCategoriesCubit>(),
      child:
       AdminCategoryBottomSheetContent(
            textTitle: LangKeys.createCategory,
            textAddImage: context.translate(LangKeys.addPhoto),
            uploadImageWidget: CreateCategoryUploadImage(),
            textEnterCategoryName:
                context.translate(LangKeys.enterCategoryName),
            formKey: context.read<CreateCategoryCubit>().formKey,
            hintTextCategoryName: LangKeys.categoryName,
            textFieldController:
                context.read<CreateCategoryCubit>().categoryNameController,
            validation: (value) {
              if (value == null ||
                  value.isEmpty 
               
                  
               ) {
                return context.translate(LangKeys.nameValidation);
              }
            },
            blocListenerWidget: CreateCategoryButton(),
            removeButton: BlocBuilder<UploadImageCubit, UploadImageState>(
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
                            theme: TextStyles.font17BoldWhite
                                .copyWith(fontWeight: FontWeight.w500))),
                    SizedBox(height: 5.h),
                  ],
                );
              } else {
                return SizedBox();
              }
            }),
       )
       // },
      //),
    );
    ;
  }
}
