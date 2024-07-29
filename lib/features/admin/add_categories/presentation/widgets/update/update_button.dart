import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/widgets/app_button.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_categories/logic/update/update_category_cubit.dart';
import 'package:store/features/admin/add_categories/logic/update/update_category_state.dart';
import 'package:store/features/admin/add_categories/data/models/update/update_category_request.dart';

class UpdateCategoryBlocListener extends StatelessWidget {
  const UpdateCategoryBlocListener({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.imageUrl,
  });

  final String categoryId;
  final String categoryName;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCategoryCubit, UpdateCategoryState>(
          listenWhen: (previous, current) =>
              current is UpdateCategorySuccess ||
              current is UpdateCategoryError,
          listener: (context, state) {
            state.whenOrNull(
              updateCategorySuccess: () {
              
                context.pop();
                return fluttertoast(
                    text:
                        context.translate(LangKeys.updateCategorySuccessfully),
                    state: ToastStates.Success);
              },
              updateCategoryError: (error) {
                return fluttertoast(
                    text: context.translate(LangKeys.updateCategoryFailed),
                    state: ToastStates.Error);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(updateCategoryLoading: (id) {
              return AppButton(
                  height: 60.h,
                  width: double.infinity,
                  color: Colors.white,
                  onPressed: () {},
                  child: CircularProgressIndicator(color: mainBlue));
            }, orElse: () {
              return AppButton(
                  height: 60.h,
                  width: double.infinity,
                  onPressed: () {
                    validateThenUpdateCategory(
                        context: context,
                        categoryName: categoryName,
                        imageUrl: imageUrl,
                        categoryId: categoryId);
                  },
                  color: Colors.white,
                  child: TextApp(
                    text: context.translate(LangKeys.updateThisCategory),
                    theme: TextStyles.font17BoldWhite.copyWith(color: mainBlue),
                  ));
            });
          })
    ;
  }

  void validateThenUpdateCategory(
      {required BuildContext context,
      required String categoryId,
      required String categoryName,
      required String imageUrl}) {
    if (context.read<UpdateCategoryCubit>().formKey.currentState!.validate()) {
      context.read<UpdateCategoryCubit>().imageUrl =
          context.read<UploadImageCubit>().getImageUrl.isEmpty
              ? imageUrl
              : context.read<UploadImageCubit>().getImageUrl;
      context.read<UpdateCategoryCubit>().updateCategory(
            UpdateCategoryRequest(
              id: categoryId,
              name: context
                  .read<UpdateCategoryCubit>()
                  .categoryNameController
                  .text,
              image: context.read<UploadImageCubit>().getImageUrl.isEmpty
                  ? imageUrl
                  : context.read<UploadImageCubit>().getImageUrl,
            ),
            categoryId: categoryId,
          );
    }
  }
}
