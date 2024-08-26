import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/widgets/admin_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/string_exetension.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/add_products/logic/delete/delete_product_cubit.dart';
import 'package:store/features/admin/add_products/presentation/widgets/update/update_icon_button.dart';
import 'package:store/features/admin/add_products/presentation/widgets/delete/delete_product_icon_button.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
     
      
      required this.productImages,
      required this.productPrice,
      required this.productId,
      required this.categoryName, required this.productDescription, required this.categoryId, required this.productTitle, required this.productImage,});
  final String productTitle;
  final List<String> productImages;
  final String productImage;
  final int productId;
  final String productPrice;
  final String productDescription;
  final String categoryName;
  final int categoryId;
  

  @override
  Widget build(BuildContext context) {
    return ContainerAdmin(
        height: 250.h,
        width: 165.w,
        verticalPadding: 5.h,
        horizontalPadding: 10.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              BlocProvider(
        create: (context) => getIt<DeleteProductCubit>(),
        child:
              DeleteProductIconButton(productId: productId.toString())),
              UpdateProductIconButton(
                  productImages: productImages,
                  categoryName: categoryName,
                  ProductId: productId,
                  categoryId: categoryId,
                  productTitle: productTitle,
                  productPrice: productPrice,
                  productDescription: productDescription,
                 
                  )
            ]),
            SizedBox(
              height: 10.h,
            ),

            //     Flexible(
            //   child: CachedNetworkImage(

            //       height: 200.h,
            //       width: 130.w,

            //       imageUrl: productImage,
            //       fit: BoxFit.fill,
            //       // placeholder: (context, url) {
            //       //   return LoadingShimmer(height: 150.h,
            //       // width: 130.w,borderRadius: 0,);
            //       // },
            //       errorWidget: (context, url, error) => Image.asset(
            //             'assets/images/core/no_image_available.png',
            //             height: 200.h,
            //             width: 130.w,
            //             fit: BoxFit.fill,
            //           )),
            // ),

            Flexible(
              child: Center(
                child: Image.network(
                  productImage.imageProductFormate(),
                  height: 200.h,
                  width: 130.w,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/core/no_image_available.png',
                      height: 200.h,
                      width: 130.w,
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
                width: 130.w,
                child: TextApp(
                    text: productTitle,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    theme: TextStyles.font17BoldWhite
                        .copyWith(color: context.color.textColor))),
            SizedBox(
              height: 7.h,
            ),
            Container(
              width: 130.w,
              child: TextApp(
                  text: categoryName,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  theme: TextStyles.font17RegularWhite
                      .copyWith(color: context.color.textColor)),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              width: 130.w,
              child: TextApp(
                  text: "\$ $productPrice",
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  theme: TextStyles.font17BoldWhite.copyWith(
                      color: context.color.textColor,
                      fontWeight: FontWeight.w400)),
            )
          ],
        ));
  }
}
