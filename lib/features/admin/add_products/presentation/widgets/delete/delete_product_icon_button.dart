import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/add_products/logic/get/get_all_products_cubit.dart';
import 'package:store/features/admin/add_products/logic/delete/delete_product_cubit.dart';
import 'package:store/features/admin/add_products/logic/delete/delete_product_state.dart';

class DeleteProductIconButton extends StatelessWidget {
  const DeleteProductIconButton({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<DeleteProductCubit>(),
        child: BlocConsumer<DeleteProductCubit, DeleteProductState>(
          listenWhen: (previous, current) =>
              current is DeleteProductSuccess ||
              current is DeleteProductError,
          listener: (context, state) {
            state.whenOrNull(
              deleteProductSuccess: () {
                context.read<GetAllProductsCubit>()..getAllProducts();
                return fluttertoast(
                    text:
                        context.translate(LangKeys.deleteProductSuccessfully),
                    state: ToastStates.Success);
              },
              deleteProductError: (errorHandler) {
                return fluttertoast(
                    text:
                        context.translate(LangKeys.deleteProductFailed),
                    state: ToastStates.Error);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(deleteProductLoading: (id) {
              if (id == productId) {
                return CircularProgressIndicator(
                  color: context.color.textColor,
                );
              } else {
                return IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {});
              }
            }, orElse: () {
              return IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    context
                        .read<DeleteProductCubit>()
                        .deleteProduct(productId: productId);
                  });
            });
          },
        ));
  }
}
