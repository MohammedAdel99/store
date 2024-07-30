import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/widgets/admin_bottom_sheet.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_categories/logic/update/update_category_cubit.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/update/update_bottom_sheet_content.dart';

class UpdateCategoryIcon extends StatelessWidget {
  const UpdateCategoryIcon
        ({super.key, required this.nameCategory, required this.imageCategory, required this.idCategory});
  final String nameCategory;
  final String imageCategory;
  final String idCategory;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.green,
        ),
        onPressed: () {
          AdminBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => getIt<UploadImageCubit>()),
                    BlocProvider(
                        create: (context) => getIt<UpdateCategoryCubit>()),
                     
                  ],
                  child: UpdateCategoryBottomSheetContent(
                    categoryId: idCategory,
                    imageUrl: imageCategory,
                    categoryName: nameCategory,
                  )),
              whenComplete: () {
                context.read<GetAllCategoriesCubit>().getAllCategories();
                
              });
        });
  }
}
