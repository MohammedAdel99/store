import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/features/admin/dashboard/logic/users_number/users_state.dart';
import 'package:store/features/admin/dashboard/logic/users_number/users_cubit.dart';
import 'package:store/features/admin/dashboard/presentation/widgets/dashboard_contaner.dart';



class UsersContainer extends StatelessWidget {
  const UsersContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          return state.when(
            loading: () {
              return const DashboardContainer(
                  title: LangKeys.users,
                  number: 0,
                  image: 'assets/images/admin/users_drawer.png',
                  isLoading: true);
            },
            success: (users) {
              final usersList = users;
              return DashboardContainer(
                  title: LangKeys.users,
                  number: usersList.length,
                  image: 'assets/images/admin/users_drawer.png',
                  isLoading: false);
            },
            error: (error) {
              return SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
