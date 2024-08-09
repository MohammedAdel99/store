import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/widgets/app_button.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/widgets/auth_login_signup_button.dart';
import 'package:store/features/auth/login/logic/cubit/login_state.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_state.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_categories/logic/create/create_category_cubit.dart';
import 'package:store/features/admin/add_categories/logic/create/create_category_state.dart';
import 'package:store/features/admin/add_categories/data/models/create/create_category_request.dart';

class CreateCategoryButton extends StatelessWidget {
  const CreateCategoryButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateCategoryCubit, CreateCategoryState>(
        listenWhen: (previous, current) =>
            current is CreateCategorySuccess || current is CreateCategoryError,
        listener: (context, state) {
          state.whenOrNull(
            createCategorySuccess: (CreateCategoriesResponse) {
               context.pop();
             
             
              return fluttertoast(
                  text: context.translate(LangKeys.createCategorySuccessfully),
                  state: ToastStates.Success);
            },
            createCategoryError: (error) {
              return fluttertoast(
                  text: context.translate(LangKeys.createCategoryFailed),
                  state: ToastStates.Error);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(createCategoryLoading: () {
            return AppButton(
                height: 60.h,
                width: double.infinity,
                onPressed: () {},
                color: Colors.white,
                child: CircularProgressIndicator(color: mainBlue));
          }, orElse: () {
            return AppButton(
                height: 60.h,
                width: double.infinity,
                onPressed: () {
                  validateThenCreateCategory(context);
                },
                color: Colors.white,
                child: TextApp(
                  text: context.translate(LangKeys.createNewCategory),
                  theme: TextStyles.font17BoldWhite.copyWith(color: mainBlue),
                ));
          });
        });
  }

  // ValidateThenCreateCategory
  static void validateThenCreateCategory(BuildContext context) {
    if (!context.read<CreateCategoryCubit>().formKey.currentState!.validate() ||
        context.read<UploadImageCubit>().getImageUrl.isEmpty) {
      if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
        return fluttertoast(
            text: context.translate(LangKeys.validPickImage),
            state: ToastStates.Error);
      }
    } else {
      context.read<CreateCategoryCubit>().imageUrl =
          context.read<UploadImageCubit>().getImageUrl;
      CreateCategoryRequest();
      context
          .read<CreateCategoryCubit>()
          .createCategory(CreateCategoryRequest());
    }
  }
}
