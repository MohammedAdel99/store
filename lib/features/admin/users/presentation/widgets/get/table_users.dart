import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/users/logic/get/get_all_users_cubit.dart';
import 'package:store/features/admin/users/logic/delete/delete_user_cubit.dart';
import 'package:store/features/admin/users/data/models/get/get_all_users_response.dart';
import 'package:store/features/admin/users/presentation/widgets/delete/delete_user_icon_button.dart';


class TableUsers extends StatelessWidget {
  const TableUsers({
    required this.userList, super.key,
  });
  final List<GetUserResponse> userList;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: 
     Table(
      border: TableBorder.all(color: context.color.textColor!),
      columnWidths: {
        0: FixedColumnWidth(100.w),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(85.w)
      },
      children: [
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              color: mainBlue,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  children: [
                    Icon(Icons.person, color: context.color.textColor),
                    TextApp(
                        text: context.translate(LangKeys.name),
                        theme: TextStyle(color: context.color.textColor)),
                  ],
                ),
              ),
            ),
          ),
          TableCell(
            child: Container(
                color: mainBlue,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Icon(Icons.email_outlined,
                          color: context.color.textColor),
                      TextApp(
                        text: context.translate(LangKeys.email),
                        theme: TextStyle(color: context.color.textColor),
                      ),
                    ],
                  ),
                )),
          ),
          TableCell(
            child: Container(
                color: mainBlue,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Icon(Icons.delete_forever,
                          color: context.color.textColor),
                      TextApp(
                          text: context.translate(LangKeys.delete),
                          theme: TextStyle(color: context.color.textColor)),
                    ],
                  ),
                )),
          ),
        ]),
        ...List.generate(
            userList.length,
            (index) => TableRow(children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    
                     child: Center(
                       
                                          
                           
                                child: Container(
                                    width: 80.w,
                                    child: TextApp(
                                        text: userList[index].name!,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        theme: TextStyle(
                                                color: context.color.textColor)
                                            .copyWith(
                                                color: context.color.textColor))),
                              
                                          ),
                     ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                     child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w,),
                 
                    child: Container(
                    
                        
                        child: TextApp(
                            text: userList[index].email!,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            theme: TextStyle(color: context.color.textColor)
                                .copyWith(color: context.color.textColor))),
                  )),
                  TableCell(
                   
                      child: 
                      
                          BlocProvider(
                            create: (context) => getIt<DeleteUserCubit>(),
                           
                        
                        child: 
                      DeleteUserIconButton(userId: userList[index].id.toString()),
                    )),
                  
                ]))
      ],
    ));
  }
}
