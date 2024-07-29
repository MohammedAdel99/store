import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/shimmer.dart';
import 'package:store/core/widgets/empty_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_state.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/get/catrgory_item.dart';
import 'package:store/features/admin/add_categories/data/models/get/get_all_categories_response.dart';


class GetListCategory extends StatelessWidget {
  const GetListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          await context.read<GetAllCategoriesCubit>().getAllCategories();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 20.h),
            ),
            SliverToBoxAdapter(child:
                BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
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
              }, getCategoriesSuccess: (getAllCategories) {
                List<GetAllCategoryResponse> categoryList = getAllCategories;
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                        nameCategory: categoryList[index].name ?? '',
                        imageCategory: categoryList[index].image ?? '',
                        idCategory: categoryList[index].id.toString());
                  },
                  clipBehavior: Clip.none,
                  separatorBuilder: (context, index) => SizedBox(height: 25.h),
                  itemCount: getAllCategories.length,
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
