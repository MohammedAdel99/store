import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_keys.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_helper.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/users/presentation/screens/users_screen.dart';
import 'package:store/features/admin/add_products/presentation/add_products_screen.dart';
import 'package:store/features/admin/home_admin/presentation/widgets/custom_dialogs.dart';
import 'package:store/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:store/features/admin/add_notifications/presentation/add_notifications_screen.dart';
import 'package:store/features/admin/add_categories/presentation/screens/add_categories_screen.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return [
    
    //Dashboard
    DrawerItemModel(
        icon: Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
        title: TextApp(
            text: context.translate(LangKeys.dashboard),
            theme:
                TextStyles.font17BoldWhite.copyWith(color:Colors.white)),
        page: DashboardScreen()),
    
    //Categories
    
    DrawerItemModel(
        icon: Icon(Icons.category, color: Colors.white),
        title: TextApp(
            text: context.translate(LangKeys.categories),
            theme:
                TextStyles.font17BoldWhite.copyWith(color: Colors.white)),
        page: AddCategoriesScreen()),
       
    //Products
    DrawerItemModel(
        icon: Icon(Icons.production_quantity_limits,
            color:Colors.white),
        title: TextApp(
            text: context.translate(LangKeys.products),
            theme:
                TextStyles.font17BoldWhite.copyWith(color:Colors.white )),
        page: AddProductsScreen()),
        
    //Users
    DrawerItemModel(
        icon: Icon(Icons.people_alt_rounded, color:Colors.white),
        title: TextApp(
            text: context.translate(LangKeys.users),
            theme:
                TextStyles.font17BoldWhite.copyWith(color:Colors.white)),
        page: UsersScreen()),
        
    //notifications
    DrawerItemModel(
        icon: Icon(Icons.notifications_active, color: Colors.white),
        title: TextApp(
            text: context.translate(LangKeys.notifications),
            theme:
                TextStyles.font17BoldWhite.copyWith(color:Colors.white)),
        page: AddNotificationsScreen()),
        
    //Logout
    DrawerItemModel(
        icon: Icon(Icons.exit_to_app, color: Colors.white),
        title: GestureDetector(
            onTap: () {
              CustomDialog.twoButtonDialog(
                context: context,
                textBody: 'Do you want log out?',
                textButton1: 'Yes',
                textButton2: 'No',
                isLoading: false,
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  await SharedPref.clearPreferences();
                  await SharedPref.clearAllSecuredData();
                  

                  // await SharedPref.removePreference(SharedPrefKeys.userToken);
                  // await SharedPref.removePreference(SharedPrefKeys.userId);
                  // await SharedPref.removePreference(SharedPrefKeys.userRole);
                  await navigator.pushNamedAndRemoveUntil(
                    AppRoutes.login,
                    (route) => false,
                  );
                },
              );
            },
            child: TextApp(
              text: context.translate(LangKeys.logOut),
              theme: TextStyles.font17BoldWhite
                  
            )),
        page: UsersScreen())
  ];
}

class DrawerItemModel {
  final Icon icon;
  final Widget title;
  final Widget page;
  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.page,
  });
}
