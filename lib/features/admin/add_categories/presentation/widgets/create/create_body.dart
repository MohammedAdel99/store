import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/widgets/app_text_form_feild.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/add_categories/logic/create/create_category_cubit.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create/create_button.dart';
import 'package:store/features/admin/add_categories/presentation/widgets/create/category_upload_image.dart';






class CreateBody extends StatelessWidget {
  const CreateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: TextApp(
          textAlign: TextAlign.center,
          text: context.translate(LangKeys.createCategory),
          theme: TextStyles.font20BoldWhite,
        )),
        SizedBox(
          height: 10.h,
        ),
        TextApp(
          text: context.translate(LangKeys.addPhoto),
          theme: TextStyles.font17BoldWhite
              .copyWith(fontWeight: FontWeight.normal),
        ),
        CreateUploadImage(),
        //ContainerAdmin(height: 120.h, child: Center(child:IconButton(icon: Icon(Icons.add_a_photo_outlined,size: 22,), onPressed: (){},))),

        SizedBox(
          height: 15.h,
        ),
        TextApp(
          text: context.translate(LangKeys.enterCategoryName),
          theme: TextStyles.font17BoldWhite
              .copyWith(fontWeight: FontWeight.normal),
        ),
        Form(
          key:context.read<CreateCategoryCubit>().formKey ,
          child: AppTextFormField(
            hintText: LangKeys.categoryName,
            controller:
                context.read<CreateCategoryCubit>().categoryNameController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty 
              ){
                return context.translate(LangKeys.nameValidation);
              }
            },    
            backgroundColor: mainBlue,
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(16.r)),
          ),
        ),
        SizedBox(height: 18.h),
       CreateCategoryBlocListener()
      ],
    );
  }

  
}
