import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/widgets/app_text_form_feild.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/users/logic/get/get_all_users_cubit.dart';
import 'package:store/features/admin/users/logic/get/get_all_users_state.dart';

class SearchUser extends StatefulWidget {
  const SearchUser({super.key});

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        child: BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
            builder: (context, state) {
          return AppTextFormField(
            controller: context.read<GetAllUsersCubit>().textSearchController,
            hintText: LangKeys.searchForUsers,
            keyboardType: TextInputType.name,
            onChanged: (value) {
              context.read<GetAllUsersCubit>().SearchUser(value);
            },
            suffixIcon: context
                    .read<GetAllUsersCubit>()
                    .textSearchController
                    .text
                    .isEmpty
                ? IconButton(
                    icon: Icon(Icons.search, color: context.color.textColor , size: 25,),
                    onPressed: () {})
                : IconButton(
                    icon: Icon(Icons.close, color: context.color.textColor , size: 25),
                    onPressed: () {
                      context
                          .read<GetAllUsersCubit>()
                          .textSearchController
                          .clear();
                      setState(() {
                        context
                                .read<GetAllUsersCubit>()
                                .textSearchController
                                .text ==
                            null;
                      });
                      context.read<GetAllUsersCubit>().getAllUsers(
                        isNotLoading: true
                        );
                    }),
            enabledBorderColor: mainBlue,
          );
        }));
  }
}
