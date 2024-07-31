import 'package:flutter/material.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/admin_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/delete/delete_category.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/update/update_category_icon.dart';




class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.nameCategory,
      required this.imageCategory,
      required this.idCategory});
  final String nameCategory;
  final String imageCategory;
  final String idCategory;



  @override
  Widget build(BuildContext context) {
    return ContainerAdmin(
      child: 
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
           
      
          Container(
              width: 150.w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(
                        text: nameCategory,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        theme: TextStyles.font20BoldWhite
                            .copyWith(color: context.color.textColor)),
                    Row(children: [
                      DeleteCategory(categoryId: idCategory),
                      SizedBox(
                        width: 10.w,
                      ),
                      UpdateCategoryIcon(
                          nameCategory:nameCategory,
                          imageCategory: imageCategory,
                          idCategory:idCategory),
                    ]),
                  ])),
          // Flexible(
          //   child: CachedNetworkImage(
              
          //       height: 150.h,
          //       width: 130.w,
                
          //       imageUrl: imageCategory,
          //       fit: BoxFit.fill,
          //       // placeholder: (context, url) {
          //       //   return LoadingShimmer(height: 150.h,
          //       // width: 130.w,borderRadius: 0,);
          //       // },
          //       errorWidget: (context, url, error) => Image.asset(
          //             'assets/images/core/no_image_available.png',
          //             height: 150.h,
          //             width: 130.w,
          //             fit: BoxFit.fill,
          //           )),
          // ),

         
                       Image.network(
              imageCategory,
              height: 150.h,
              width: 130.w,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
               
                
                return Image.asset(
                  'assets/images/core/no_image_available.png',
                  height: 150.h,
                  width: 130.w,
                  fit: BoxFit.fill,
                );
              },
                       ),
                     
           ],
      ),
    );
  }
}
