import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/admin_appbar.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/users/logic/get/get_all_users_cubit.dart';
import 'package:store/features/admin/users/presentation/widgets/get/search_user.dart';
import 'package:store/features/admin/users/presentation/widgets/get/get_user_body.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<GetAllUsersCubit>()
          ..getAllUsers(
              isNotLoading: false
              ),
        child:  Scaffold(
              backgroundColor: context.color.mainColor,
              appBar: AdminAppBar(
                isMain: true,
                background: context.color.mainColor ?? ColorsDark.mainColor,
                title: context.translate(LangKeys.users),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                child: Column(
                  children: [
                    SearchUser(),
                    SizedBox(height: 5.h),
                    Expanded(
                      child: GetUserBody(),
                    )
                  ],
            ),
              )),
        );
  }
}
