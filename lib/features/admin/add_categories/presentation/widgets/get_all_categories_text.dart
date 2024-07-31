import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/widgets/admin_bottom_sheet.dart';
import 'package:store/core/widgets/admin_text_and_add_button.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_categories/logic/create/create_category_cubit.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create/create_category_bottom_sheet_content.dart';




class GetAllCategoryTextAndAddButton extends StatelessWidget {
  const  GetAllCategoryTextAndAddButton ({super.key});

  @override
  Widget build(BuildContext context) {
    return
    AdminTextAndAddButton(text:LangKeys.getAllCategories , onpressed: (){ return AdminBottomSheet.showModalBottomSheetContainer(
                      context: context,
                      widget: MultiBlocProvider(providers: [
                        BlocProvider(
                            create: (context) => getIt<UploadImageCubit>()),
                        BlocProvider(
                            create: (context) => getIt<CreateCategoryCubit>()),
                        
                              
                      ], child: CreateCategoryBottomSheetContent()),
                      whenComplete: (){
                         context.read<GetAllCategoriesCubit>()..getAllCategories();

                      }
                      );
                      
                });
}}