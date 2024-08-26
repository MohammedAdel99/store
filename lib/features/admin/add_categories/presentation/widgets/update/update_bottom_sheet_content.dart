import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/widgets/admin_category_bottom_sheet_content.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_state.dart';
import 'package:store/features/admin/add_categories/logic/update/update_category_cubit.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/update/update_button.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/update/update_categoy_upload_image.dart';

class UpdateCategoryBottomSheetContent extends StatefulWidget {
  const UpdateCategoryBottomSheetContent({
    super.key,
    required this.categoryId,
    required this.imageUrl,
    required this.categoryName,
  });
  final String categoryId;
  final String categoryName;
  final String imageUrl;

  @override
  State<UpdateCategoryBottomSheetContent> createState() =>
      _UpdateCategoryBottomSheetContentState();
}

class _UpdateCategoryBottomSheetContentState
    extends State<UpdateCategoryBottomSheetContent> {
  @override
  void initState() {
    super.initState();

    context.read<UpdateCategoryCubit>().categoryNameController.text =
        widget.categoryName;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<GetAllCategoriesCubit>(),
        child: BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
            builder: (context, state) {
          return AdminCategoryBottomSheetContent(
              textTitle: LangKeys.updateCategory,
              textAddImage: context.translate(LangKeys.addPhoto),
              uploadImageWidget:
                  UpdateCategoryUploadImage(imageUrl: widget.imageUrl),
              textEnterCategoryName:
                  context.translate(LangKeys.enterCategoryName),
              formKey: context.read<UpdateCategoryCubit>().formKey,
              hintTextCategoryName: LangKeys.categoryName,
              textFieldController:
                  context.read<UpdateCategoryCubit>().categoryNameController,
              validation: (value) {
                if (value == null || value.isEmpty ||  context.read<GetAllCategoriesCubit>().getAllCategoryResponse.any(
        (element) =>
            element.name ==
            value) ){
                  return context.translate(LangKeys.nameValidation);
                }
              },
              blocListenerWidget: UpdateCategoryBlocListener(
                categoryId: widget.categoryId,
                categoryName: widget.categoryName,
                imageUrl: widget.imageUrl,
              ));
        }));
  }
}

















// UpdateCategoryBlocListener(
          
//           categoryId: widget.categoryId,
//           categoryName: context.read<UpdateCategoryCubit>().categoryNameController.text,
//           imageUrl: context.read<UploadImageCubit>().getImageUrl.isEmpty ? widget.imageUrl: context.read<UploadImageCubit>().getImageUrl,
//         )