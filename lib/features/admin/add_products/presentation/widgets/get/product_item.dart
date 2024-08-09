import 'package:flutter/material.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/admin_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/string_exetension.dart';
import 'package:store/core/extensions/navigator_extension.dart';


class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.productName,
      required this.categoryName,
      required this.productImage,
      required this.productPrice,
      required this.productId});
  final String productName;
  final String categoryName;
  final String productImage;
  final String productId;
  final String productPrice;

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
              IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                  onPressed: () {}),
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
                    text: productName,
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
