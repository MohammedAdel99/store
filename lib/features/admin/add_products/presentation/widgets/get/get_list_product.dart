import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/shimmer.dart';
import 'package:store/core/widgets/empty_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/features/admin/add_products/logic/get/get_all_products_cubit.dart';
import 'package:store/features/admin/add_products/logic/get/get_all_products_state.dart';
import 'package:store/features/admin/add_products/presentation/widgets/get/product_item.dart';
import 'package:store/features/admin/add_products/data/models/get/get_all_products_response.dart';


class GetListProduct extends StatelessWidget {
  const GetListProduct(
      {super.key,
   });
  

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: () async {
      await context.read<GetAllProductsCubit>().getAllProducts();
    }, child:CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 20.h),
            ),
            SliverToBoxAdapter(child: 
    BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
        builder: (context, state) {
      return state.maybeWhen(getProductsLoading: () {
        return GridView.builder(
          shrinkWrap: true,
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 165/250
            ),
            itemBuilder: (context, index) {
              return LoadingShimmer(
                  
                  height: 250.h,
                  width: 165,
                    
                  );
            });
      }, getProductsEmpty: () {
        return const EmptyScreen();
      }, getProductsSuccess: (getAllPtoducts) {
        List<GetProductResponse> productList = getAllPtoducts;
        return GridView.builder(
          shrinkWrap:true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
            itemCount: productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 165/250
            ),
            itemBuilder: (context, index) {
              return ProductItem(
                  productTitle: productList[index].title ?? '',
                  categoryName: productList[index].category!.name ?? '',
                  productImage: productList[index].images!.elementAt(0) ,
                  productPrice: productList[index].price.toString() ,
                  productId: productList[index].id??0,
                  productImages: productList[index].images??[],
                  productDescription: productList[index].description??'',
                   categoryId: productList[index].category!.id ?? 0,
                  
                  );
            });
      }, getProductsError: (errerHandler) {
        return SizedBox.shrink();
      }, orElse: () {
        return SizedBox.shrink();
      });
    }),
    ),
    SliverToBoxAdapter(
              child: SizedBox(height: 20.h),
            ),
    ]));
  }
}
