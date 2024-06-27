import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/dashboard_contaner.dart';
import 'package:store/features/admin/dashboard/logic/categories_number/categories_cubit.dart';
import 'package:store/features/admin/dashboard/logic/categories_number/categories_state.dart';



class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
        return state.when(loading: () {
          return DashboardContainer(
              title: LangKeys.categories,
              number: 0,
              image: 'assets/images/admin/categories_drawer.png',
              isLoading: true);
        }, success: (categories) {
          final categorylist = categories;
          return DashboardContainer(
              title: LangKeys.categories,
              number: categorylist.length,
              image: 'assets/images/admin/categories_drawer.png',
              isLoading: false);
        }, error: (error) {
          return SizedBox.shrink();
        });
      }),
    );
  }
}
