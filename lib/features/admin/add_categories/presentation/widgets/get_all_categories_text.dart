import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/app_button.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/di/dependence_injection.dart';
import 'package:store/core/widgets/admin_bottom_sheet.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create_body.dart';
import 'package:store/features/admin/add_categories/logic/create/create_category_cubit.dart';



class GetAllCategoriesText extends StatelessWidget {
  const GetAllCategoriesText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextApp(
                text: context.translate(LangKeys.allCategories),
                theme: TextStyles.font20BoldWhite.copyWith(
                  color: mainBlue,
                )),
            AppButton(
                width: 80.w,
                onPressed: () {
                  return AdminBottomSheet.showModalBottomSheetContainer(
                      context: context,
                      widget: MultiBlocProvider(providers: [
                        BlocProvider(
                            create: (context) => getIt<UploadImageCubit>()),
                        BlocProvider(
                            create: (context) => getIt<CreateCategoryCubit>()
                              )
                      ], child: CreateBody()));
                },
                child: TextApp(
                  text: context.translate(LangKeys.add),
                  theme: TextStyles.font17BoldWhite,
                )),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
