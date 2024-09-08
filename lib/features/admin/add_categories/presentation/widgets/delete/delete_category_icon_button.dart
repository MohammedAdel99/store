import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_categories/logic/delete/delete_category_cubit.dart';
import 'package:store/features/admin/add_categories/logic/delete/delete_category_state.dart';


class DeleteCategoryIconButton extends StatelessWidget {
  const DeleteCategoryIconButton({super.key, required this.categoryId});
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<DeleteCategoryCubit>(),
        child: BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
          listenWhen: (previous, current) =>
              current is DeleteCategorySuccess ||
              current is DeleteCategoryError,
          listener: (context, state) {
            state.whenOrNull(
              deleteCategorySuccess: () {
                context.read<GetAllCategoriesCubit>()..getAllCategories(isNotLoading: true);
                return fluttertoast(
                    text:
                        context.translate(LangKeys.deleteCategorySuccessfully),
                    state: ToastStates.Success);
              },
              deleteCategoryError: (errorHandler) {
                return fluttertoast(
                    text:
                        context.translate(LangKeys.deleteCategoryFailed),
                    state: ToastStates.Error);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(deleteCategoryLoading: (id) {
              if (id == categoryId) {
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
                        .read<DeleteCategoryCubit>()
                        .deleteCategory(categoryId: categoryId);
                  });
            });
          },
        ));
  }
}
