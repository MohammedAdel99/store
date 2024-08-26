import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/drop_down.dart';
import 'package:store/core/widgets/app_button.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_state.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/widgets/admin_product_bottom_sheet_content.dart';
import 'package:store/features/admin/add_products/logic/create/create_product_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_state.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_products/presentation/widgets/create/create_product_button.dart';
import 'package:store/features/admin/add_products/presentation/widgets/create/create_product_upload_image.dart';

class CreateProductBottomSheetContent extends StatefulWidget {
  const CreateProductBottomSheetContent({super.key});

  @override
  State<CreateProductBottomSheetContent> createState() =>
      _CreateProductBottomSheetContentState();
}

class _CreateProductBottomSheetContentState
    extends State<CreateProductBottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    return AdminProductBottomSheetContent(
      textTitle: LangKeys.createProduct,
      textAddImage: context.translate(LangKeys.addPhotos),
      uploadImagesWidget: CreateProductImages(),
      titleController:
          context.read<CreateProductCubit>().productTitleController,
      priceController:
          context.read<CreateProductCubit>().productPriceController,
      decorationController:
          context.read<CreateProductCubit>().productDescriptionController,
      formKey: context.read<CreateProductCubit>().formKey,
      dropDwonWidget:
          BlocBuilder<GetAllCategoriesCubit,
                  GetAllCategoriesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    getCategoriesSuccess: (catgeory) {
                      return DropDown(
                        hintText:LangKeys.selectCategory ,
                        items: context.read<GetAllCategoriesCubit>().categoryDropdownList.toSet().toList(),
                        onChanged: (value) {
                          setState(() {
                            context.read<CreateProductCubit>().categoryName = value;

                            context.read<CreateProductCubit>().categoryId = catgeory
                                
                                .firstWhere((e) => e.name == value)
                                .id;
                           
                          });
                        },
                        value: context.read<CreateProductCubit>().categoryName,
                      );
                    },
                    orElse: () {
                      return DropDown(
                        hintText: LangKeys.selectCategory,
                        items: const [''],
                        onChanged: (value) {},
                        value: '',
                      );
                    },
                  );
                },
              ),
      buttonWidget: CreateProductButton(),
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
    );
  }
}
