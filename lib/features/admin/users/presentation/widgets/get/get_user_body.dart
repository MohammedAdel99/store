import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/empty_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/users/logic/get/get_all_users_cubit.dart';
import 'package:store/features/admin/users/logic/get/get_all_users_state.dart';
import 'package:store/features/admin/users/presentation/widgets/get/table_users.dart';

class GetUserBody extends StatelessWidget {
  const GetUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          await context
              .read<GetAllUsersCubit>()
              .getAllUsers(isNotLoading: true);
        },
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(child:
              BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
                  builder: (context, state) {
            return state.maybeWhen(getUsersLoading: () {
              return Container(
                height:500.h,
                width:double.infinity,
                
                child: Center(
                  child:
                    CircularProgressIndicator(
                      color: context.color.textColor,
                    
                  
              
              )));
            }, getUsersEmpty: () {
              return const EmptyScreen();
            }, searchForUser: (getUsers) {
              return TableUsers(userList: getUsers);
            }, getUsersSuccess: (getAllUsers) {
              return TableUsers(
                userList: getAllUsers,
              );
            }, getUsersError: (errorHandler) {
              return SizedBox.shrink();
            }, orElse: () {
              return SizedBox.shrink();
            });
          }))
        ]));
  }
}
