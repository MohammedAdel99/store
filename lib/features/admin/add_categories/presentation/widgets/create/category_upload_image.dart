import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/helpers/image_picker.dart';
import 'package:store/core/animations/animate_do.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/helpers/images/image_helper.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_state.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
// ignore_for_file: lines_longer_than_80_chars

class CreateUploadImage extends StatelessWidget {
  const CreateUploadImage({super.key});

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
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image:
                        NetworkImage(context.read<UploadImageCubit>().getImageUrl),
                        fit: BoxFit.fill,
                    
                  ),
                ), child:Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
               
                                  if (isImageUploaded)
                                    Positioned(
                                      top: -13,
                                      right: -15,
                                      child: IconButton(
                                          onPressed: () {
                                            context
                                                .read<UploadImageCubit>()
                                                .removeImage();
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 30,
                                          )),
                                    )
                                  else
                                    const SizedBox.shrink(),
                       ]
            
          ));
        } else {
          return InkWell(
              onTap: () {
                context.read<UploadImageCubit>().upload();
              },
              child: Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.add_a_photo_outlined,
                  size: 50,
                  color: Colors.white,
                ),
              ));
        }
      });
    });
  }
}
