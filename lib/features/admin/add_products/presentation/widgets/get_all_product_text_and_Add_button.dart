import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/widgets/admin_bottom_sheet.dart';
import 'package:store/core/widgets/admin_text_and_add_button.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/add_products/logic/get/get_all_products_cubit.dart';
import 'package:store/features/admin/add_products/logic/create/create_product_cubit.dart';
import 'package:store/features/admin/add_categories/logic/get/get_all_categories_cubit.dart';
import 'package:store/features/admin/add_products/presentation/widgets/create/create_product_bottom_sheet_content.dart';


class GetAllProductTextAndAddButton extends StatelessWidget {
  const  GetAllProductTextAndAddButton ({super.key});

  @override
  Widget build(BuildContext context) {
    return
    AdminTextAndAddButton(text:LangKeys.getAllProducts , onpressed: (){ return AdminBottomSheet.showModalBottomSheetContainer(
                      context: context,
                      widget: MultiBlocProvider(providers: [
                        BlocProvider(
                            create: (context) => getIt<UploadImageCubit>()),
                        BlocProvider(
                            create: (context) => getIt<CreateProductCubit>()),
                        BlocProvider(
                            create: (context) => getIt<GetAllCategoriesCubit>()),    
                        BlocProvider(
                            create: (context) => getIt<GetAllCategoriesCubit>()..getAllCategories()),    
                        
                              
                      ], child: CreateProductBottomSheetContent() ),
                      whenComplete: (){
                         context.read<GetAllProductsCubit>()..getAllProducts();

                      }
                      );
                      
                });
                      
                }
}