import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/users/logic/get/get_all_users_cubit.dart';
import 'package:store/features/admin/users/logic/delete/delete_user_cubit.dart';
import 'package:store/features/admin/users/logic/delete/delete_user_state.dart';


class DeleteUserIconButton extends StatelessWidget {
  const DeleteUserIconButton({
    required this.userId, super.key,
  });
  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteUserCubit, DeleteUserState>(
          listenWhen: (previous, current) =>
              current is DeleteUserSuccess ||
              current is DeleteUserError,
          listener: (context, state) {
            state.whenOrNull(
              deleteUserSuccess: () {
                context
              .read<GetAllUsersCubit>()
              .getAllUsers(isNotLoading: true);
                return fluttertoast(
                    text:
                        context.translate(LangKeys.deleteUserSuccessfully),
                    state: ToastStates.Success);
              },
              deleteUserError: (errorHandler) {
                return fluttertoast(
                    text:
                        context.translate(LangKeys.deleteUserFailed),
                    state: ToastStates.Error);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(deleteUserLoading: (userId) {
              if (userId == userId) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  
                  child: Center(
                    
                    child: CircularProgressIndicator(
                      color: context.color.textColor,
                      
                    ),
                  ),
                );
              } else {
                return IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {});
              }
            }, orElse: () {
              return IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    context
                        .read<DeleteUserCubit>()
                        .deleteUser(userId: userId);
                  });
            });
          },
        );
  }
}

 