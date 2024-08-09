import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_state.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';


class UpdateCategoryUploadImage extends StatelessWidget {
  const UpdateCategoryUploadImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
      state.whenOrNull(
        success: () {
          return fluttertoast(
              text: context.translate(LangKeys.imageUploaded),
              state: ToastStates.Success);
        },
        removeImage: (removeImage) {
          return fluttertoast(
              text: context.translate(LangKeys.imageRemoved),
              state: ToastStates.Success);
        },
        error: (error) {
          return fluttertoast(text: error, state: ToastStates.Error);
        },
      );},
    builder: (context, state) {
      final isImageUploaded =
          context.read<UploadImageCubit>().getImageUrl.isNotEmpty;
      return state.maybeWhen(loading: () {
        return Container(
            width: double.infinity,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.withOpacity(0.8),
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ));
      }, orElse: () {
        return InkWell(
          onTap:(){context.read<UploadImageCubit>().upload();} ,
          child:
        Stack(
          children: [
            
            Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
               
                image: DecorationImage(
                  image: NetworkImage(
                      context.read<UploadImageCubit>().getImageUrl.isEmpty?
                       imageUrl :
                        context.read<UploadImageCubit>().getImageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            
            
            if (context.read<UploadImageCubit>().getImageUrl.isEmpty)
              Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Icon(Icons.add_a_photo_outlined, color: Colors.white,size: 50,),
                  )),
          ],
        ));
      });
    });
  }
}
