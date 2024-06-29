import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/shimmer.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/empty_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:store/core/widgets/admin_custom_container_linear.dart';
import 'package:store/features/admin/add_categories/logic/get_categories_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get_categories_state.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/categories_container.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<GetCategoriesCubit>().GetAllCategories();
      },
      child:
    CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 20.h),
        ),
        SliverToBoxAdapter(child:
            BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
                builder: (context, state) {
          return state.when(loading: () {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return LoadingShimmer(
                  height: 130.h,
                  borderRadius: 15,
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 15.h),
              itemCount: 4,
            );
          }, empty: () {
            return const EmptyScreen();
          }, success: (categories) {
            var categoryList = categories;
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomContainerAdmin(
                    child: Stack(
                       
                        children: [
                           Flexible(
                            
                              child:ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child:
                               CachedNetworkImage(
                                fit: BoxFit.fill,
                                height: 170.h,
                                width: double.infinity ,
                                imageUrl: categoryList[index].image!,
                                // fit: BoxFit.fill,
                                errorWidget: (context, url, error) => const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 70,
                                ),
                              ),
                            ),
                          ),

                      
                      Padding(
                        padding:  EdgeInsets.only(left: 10.w),
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextApp(
                                text: categoryList[index].name ?? '',
                                theme: TextStyles.font20BoldWhite.copyWith(color: context.color.textColor)),
                            Row(children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {}),
                              SizedBox(
                                width: 10.w,
                              ),
                              IconButton(
                                  icon: Icon(Icons.edit, color: Colors.green),
                                  onPressed: () {})
                            ]),
                           
                          ],
                        ),
                      ),
                      
                    ]));
              },
              separatorBuilder: (context, index) => SizedBox(height: 25.h),
              itemCount: categories.length,
            );
          }, error: (errerHandler) {
            return SizedBox.shrink();
          });
        }))
      ],
    ));
  }
}
