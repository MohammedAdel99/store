import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/admin_appbar.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/dashboard/logic/users_number/users_cubit.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/dashboard_body.dart';
import 'package:store/features/admin/dashboard/logic/products_number/products_state.dart';
import 'package:store/features/admin/dashboard/logic/products_number/products_cubit.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/users_container.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/dashboard_contaner.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/products_container.dart';
import 'package:store/features/admin/dashboard/logic/categories_number/categories_cubit.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/categories_container.dart';



class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
            BlocProvider(create: (context) => getIt<ProductsCubit>()..getTotalNumOfProducts() ),
            BlocProvider(create: (context) =>  getIt<CategoriesCubit>()..getTotalNumOfCategories()),
            BlocProvider(create: (context) =>  getIt<UsersCubit>()..getTotalNumOfUsers())
            ], child:  
          
                  
 

    Scaffold(
        backgroundColor: context.color.mainColor,
        appBar: AdminAppBar(
          isMain: true,
          background: context.color.mainColor ?? ColorsDark.mainColor,
          title: context.translate(LangKeys.dashboard),
        ),
        body: const DashboardBody()
    )
    );
  }
}

            //DashboardBody(),
            

            
      