import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/drop_down.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/extensions/string_exetension.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/widgets/admin_product_bottom_sheet_content.dart';
import 'package:store/features/admin/add_products/logic/update/update_product_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_state.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_products/presentation/widgets/update/update_product_button.dart';
import 'package:store/features/admin/add_products/presentation/widgets/update/update_product_upload_images.dart';

class UpdateProductBottomSheetContent extends StatefulWidget {
  const UpdateProductBottomSheetContent(
      {super.key,
      required this.productImages,
      required this.productTitle,
      required this.productDescription,
      required this.productPrice,
      required this.categoryId,
      required this.categoryName,
      required this.productId});
  final List<String> productImages;
  final String productTitle;
  final String productDescription;
  final String productPrice;
  final int categoryId;
  final String categoryName;
  final int productId;

  @override
  State<UpdateProductBottomSheetContent> createState() =>
      _UpdateProductBottomSheetContentState();
}

class _UpdateProductBottomSheetContentState
    extends State<UpdateProductBottomSheetContent> {
  @override
  void initState() {
    super.initState();
     context.read<UpdateProductCubit>().imageList = widget.productImages;
    context.read<UpdateProductCubit>().productId = widget.productId;
    context.read<UpdateProductCubit>().productTitleController.text =
        widget.productTitle;
    context.read<UpdateProductCubit>().productPriceController.text =
        widget.productPrice;
    context.read<UpdateProductCubit>().productDescriptionController.text =
        widget.productDescription;
    context.read<UpdateProductCubit>().categoryId = widget.categoryId;
    context.read<UpdateProductCubit>().categoryName = widget.categoryName;
  }

  @override
  Widget build(BuildContext context) {
    return AdminProductBottomSheetContent(
      textTitle: LangKeys.updateProduct,
      textAddImage: context.translate(LangKeys.addPhotos),
      uploadImagesWidget: UpdateProductImages(
        
        oldProductImages: widget.productImages,
      ),
      titleController:
          context.read<UpdateProductCubit>().productTitleController,
      priceController:
          context.read<UpdateProductCubit>().productPriceController,
      decorationController:
          context.read<UpdateProductCubit>().productDescriptionController,
      formKey: context.read<UpdateProductCubit>().formKey,
      dropDwonWidget: SizedBox.shrink(),
      buttonWidget: UpdateProductButton(
        oldImageList: widget.productImages,
        productId: widget.productId,
      ),
    );
  }
}
