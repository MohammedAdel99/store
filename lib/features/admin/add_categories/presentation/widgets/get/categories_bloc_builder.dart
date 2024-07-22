import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/shimmer.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/empty_screen.dart';
import 'package:store/core/widgets/admin_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:store/features/admin/add_categories/logic/get/categories_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/categories_state.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/categories_container.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/delete/delete_category.dart';



class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          await context.read<CategoriesCubit>().getCategories();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 20.h),
            ),
            SliverToBoxAdapter(child:
                BlocBuilder<CategoriesCubit, CategoriesState>(
                    builder: (context, state) {
              return state.maybeWhen(getCategoriesLoading: () {
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
              }, getCategoriesEmpty: () {
                return const EmptyScreen();
              }, getCategoriesSuccess: (categories) {
                var categoryList = categories;
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ContainerAdmin(
                        child: Stack(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            categoryList[index].image!,
                            height: 170.h,
                            width: double.infinity,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/images/core/no_image_available.png',height: 170.h,
                            width: double.infinity,
                            fit: BoxFit.fill,);
                            },
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextApp(
                                text: categoryList[index].name ?? '',
                                theme: TextStyles.font20BoldWhite
                                    .copyWith(color: context.color.textColor)),
                            Row(children: [
                              DeleteCategory(categoryId: categoryList[index].id.toString()),
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
                  clipBehavior: Clip.none,
                  separatorBuilder: (context, index) => SizedBox(height: 25.h),
                  itemCount: categories.length,
                );
              }, getCategoriesError: (errerHandler) {
                return SizedBox.shrink();
              }, orElse: () {
                return SizedBox.shrink();
              });
            }))
          ],
        ));
  }
}
