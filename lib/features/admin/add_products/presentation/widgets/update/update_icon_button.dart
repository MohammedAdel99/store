import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/widgets/admin_bottom_sheet.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/add_products/logic/get/get_all_products_cubit.dart';
import 'package:store/features/admin/add_products/logic/update/update_product_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_products/presentation/widgets/create/create_product_bottom_sheet_content.dart';
import 'package:store/features/admin/add_products/presentation/widgets/update/update_product_bottom_sheet_content.dart';

class UpdateProductIconButton extends StatelessWidget {
  const UpdateProductIconButton({required this.productImages,required this.categoryName,required this.ProductId,required this.categoryId, 
      super.key,
      required this.productTitle,
      required this.productPrice,
      required this.productDescription,});
  final String productTitle;
  final String productPrice;
  final String productDescription;
  final List<String> productImages;
  final String categoryName;
  final int ProductId;
  final int categoryId;
 

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.green,
        ),
        onPressed: () {
          return 
          AdminBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => getIt<UploadImageCubit>()),
                    BlocProvider(
                        create: (context) => getIt<UpdateProductCubit>()),
                    BlocProvider(
                        create: (context) => getIt<GetAllCategoriesCubit>()..getAllCategories())    
                  ],
            
                  child: UpdateProductBottomSheetContent(
                  
                    productId: ProductId,
                    categoryId: categoryId,
                    productTitle: productTitle,
                    productPrice: productPrice,
                    productDescription: productDescription,
                    productImages: productImages,
                    categoryName: categoryName,
                 
                    
                  )
                  ),
              whenComplete: () {
                context.read<GetAllProductsCubit>().getAllProducts();
              });
        });
  }
}
