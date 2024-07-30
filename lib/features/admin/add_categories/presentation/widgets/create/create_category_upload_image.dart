import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_state.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';



class CreateCategoryUploadImage extends StatelessWidget {
  const CreateCategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
      state.whenOrNull(
        sucess: () {
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
      );
    }, builder: (context, state) {
      final isImageUploaded =
          context.read<UploadImageCubit>().getImageUrl.isNotEmpty;
      return state.maybeWhen(loadding: () {
        return Container(
            width: double.infinity,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.withOpacity(0.8),
            ),
            child: Center(
                child: CircularProgressIndicator(
                  color:Colors.white,
                ),
              
            ));
      }, orElse: () {
        if (isImageUploaded) {
          return 
              Container(
                height: 120.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image:
                        NetworkImage(context.read<UploadImageCubit>().getImageUrl),
                        fit: BoxFit.fill,
                    
                  ),
                ), 
                                    );
                                  
                       
            
      
      }else {
          return InkWell(
              onTap: () {
                context.read<UploadImageCubit>().upload();
              },
              child: 
                  Container(
                              height: 120.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.add_a_photo_outlined,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                
            
              );
        }
      });
    });
  }
}
