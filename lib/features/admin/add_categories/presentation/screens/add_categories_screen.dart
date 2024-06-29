import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/admin_appbar.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/add_categories/logic/get_categories_cubit.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/categories_bloc_builder.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/get_all_categories_text.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<GetCategoriesCubit>()..GetAllCategories(),
        child: Scaffold(
          backgroundColor: context.color.mainColor,
          appBar: AdminAppBar(
            isMain: true,
            background:
             context.color.mainColor ?? 
            ColorsDark.mainColor,
            title: context.translate(LangKeys.categories),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: 
              Column(
                children: [
                   GetAllCategoriesText(),
                  Expanded(
                    child:CategoriesBlocBuilder()
                    
                  )
                  , ],
              ),
            
          ),
        ));
  }
}
