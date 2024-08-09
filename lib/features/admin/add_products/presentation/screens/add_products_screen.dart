import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/admin_appbar.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/add_products/logic/get/get_all_products_cubit.dart';
import 'package:store/features/admin/add_products/logic/create/create_product_cubit.dart';
import 'package:store/features/admin/add_products/presentation/widgets/get/get_list_product.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/get/get_list_category.dart';
import 'package:store/features/admin/add_products/presentation/widgets/get_all_product_text_and_Add_button.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
          
            BlocProvider( create: (context) => getIt<GetAllProductsCubit>()..getAllProducts()),
            
            
         
          
            
    ],
     
         
            
              child:  
    Scaffold(
                backgroundColor: context.color.mainColor,
                appBar: AdminAppBar(
                  isMain: true,
                  background: context.color.mainColor ?? ColorsDark.mainColor,
                  title: context.translate(LangKeys.products),
                ),
                body:
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      children: [
                         GetAllProductTextAndAddButton (),
                        Expanded(
                          child: GetListProduct(),
                        ),
                      ],
                    ),
                  ),
                
    ));
  }
}







