import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/widgets/app_button.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/add_products/logic/create/create_product_cubit.dart';
import 'package:store/features/admin/add_products/logic/create/create_product_state.dart';
import 'package:store/features/admin/add_products/data/models/create/create_product_request.dart';

class CreateProductButton extends StatelessWidget {
  const CreateProductButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProductCubit, CreateProductState>(
        listenWhen: (previous, current) =>
            current is CreateProductSuccess || current is CreateProductError,
        listener: (context, state) {
          state.whenOrNull(
            createProductSuccess: (CreateProductResponse) {
              context.pop();

              return fluttertoast(
                  text: context.translate(LangKeys.createProductSuccessfully),
                  state: ToastStates.Success);
            },
            createProductError: (error) {
              return fluttertoast(
                  text: context.translate(LangKeys.createProductFailed),
                  state: ToastStates.Error);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(createProductLoading: () {
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
                  validateThenCreateProduct(context);
                },
                color: Colors.white,
                child: TextApp(
                  text: context.translate(LangKeys.createNewCategory),
                  theme: TextStyles.font17BoldWhite.copyWith(color: mainBlue),
                ));
          });
        });
  }

  //ValidateThenCreateProduct
  static void validateThenCreateProduct(BuildContext context) {
    final indexEmptyImage = context
        .read<UploadImageCubit>()
        .imageList
        .where((element) => element.isEmpty);


    if (context.read<CreateProductCubit>().formKey.currentState!.validate() ||
        indexEmptyImage.isNotEmpty  ||
        context.read<CreateProductCubit>().categoryName == null) {
      if (indexEmptyImage.isNotEmpty) {
        return fluttertoast(
            text: context.translate(LangKeys.validPickImage),
            state: ToastStates.Error);
      } else if (context.read<CreateProductCubit>().categoryName == null) {
        return fluttertoast(
            text: context.translate(LangKeys.selectCategoryValidition),
            state: ToastStates.Error);
      } else {
        
      context.read<CreateProductCubit>().imageList =
          context.read<UploadImageCubit>().imageList;

      
        context.read<CreateProductCubit>().createProduct(CreateProductRequest(
         
));
      } 
    }
  }
}
