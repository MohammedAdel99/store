import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/features/admin/dashboard/logic/products_number/products_cubit.dart';
import 'package:store/features/admin/dashboard/logic/products_number/products_state.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/dashboard_contaner.dart';

class ProductsContainer extends StatelessWidget {
  const ProductsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      return state.maybeWhen(loading: () {
        return DashboardContainer(
            title: LangKeys.products,
            number: 0,
            image: 'assets/images/admin/products_drawer.png',
            isLoading: true);
      }, success: (products) {
        final productlist = products;

        return DashboardContainer(
            title: LangKeys.products,
            number: productlist.length,
            image: 'assets/images/admin/products_drawer.png',
            isLoading: false);
      }, error: (errorHandler) {
        return const SizedBox.shrink();
      }, orElse: () {
        return const SizedBox.shrink();
      });
    });
  }
}
