import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/widgets/app_button.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/extensions/string_exetension.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/add_products/logic/update/update_product_cubit.dart';
import 'package:store/features/admin/add_products/logic/update/update_product_state.dart';
import 'package:store/features/admin/add_products/data/models/update/update_product_request.dart';

class UpdateProductButton extends StatelessWidget {
  const UpdateProductButton({
    required this.oldImageList,
    required this.productId,
    super.key,
  });
  final List<String> oldImageList;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductCubit, UpdateProductState>(
        listenWhen: (previous, current) =>
            current is UpdateProductSuccess || current is UpdateProductError,
        listener: (context, state) {
          state.whenOrNull(
            updateProductSuccess: () {
              context.pop();

              return fluttertoast(
                  text: context.translate(LangKeys.updateProductSuccessfully),
                  state: ToastStates.Success);
            },
            updateProductError: (error) {
              return fluttertoast(
                  text: context.translate(LangKeys.update),
                  state: ToastStates.Error);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(updateProductLoading: (id) {
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
                  validateThenUpdateProduct(context, oldImageList, productId);
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
  static dynamic validateThenUpdateProduct(
      BuildContext context, List<String> oldImageList, int productId) {
    List<String> imageList=[];

    if (context.read<UpdateProductCubit>().formKey.currentState!.validate()) {
       if (oldImageList.length == 1) {
      imageList= [oldImageList[0].imageProductFormate()];
    }else if(oldImageList.length==2){
       imageList= [oldImageList[0].imageProductFormate(),oldImageList[1].imageProductFormate()];
    }else if(oldImageList.length==3){
        imageList= [oldImageList[0].imageProductFormate(),oldImageList[1].imageProductFormate(),oldImageList[2].imageProductFormate()];
    }
      context.read<UpdateProductCubit>().updateProduct(
          UpdateProductRequest(
              productId: productId,
              title: context
                  .read<UpdateProductCubit>()
                  .productTitleController
                  .text,
              price: int.parse(context
                  .read<UpdateProductCubit>()
                  .productPriceController
                  .text),
              description: context
                  .read<UpdateProductCubit>()
                  .productDescriptionController
                  .text,
              images: context.read<UploadImageCubit>().imageUpdateList.isEmpty
                  ? imageList
                  : context.read<UploadImageCubit>().imageUpdateList,
              ),
          productId: productId);
    }
  }
}
