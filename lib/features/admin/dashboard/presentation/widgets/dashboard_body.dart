import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/dashboard/logic/users_number/users_cubit.dart';
import 'package:store/features/admin/dashboard/logic/products_number/products_cubit.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/users_container.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/products_container.dart';
import 'package:store/features/admin/dashboard/logic/categories_number/categories_cubit.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/categories_container.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: RefreshIndicator(
          color: context.color.textColor,
            onRefresh: () async {
              context.read<ProductsCubit>().GetProducts();
              await context.read<CategoriesCubit>().GetCategories();
              await context.read<UsersCubit>().GetUsers();
            },
            child: ListView(children: [
              SizedBox(
                height: 30.h,
              ),
              const ProductsContainer(),
              SizedBox(height: 30.h),
              const CategoriesContainer(),
              SizedBox(height: 30.h),
              const UsersContainer(),
            ])));
  }
}
