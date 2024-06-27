import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/helpers/image_picker.dart';
import 'package:store/core/animations/animate_do.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/helpers/images/image_helper.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/auth/signUp/logic/cubit/signup_cubit.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_state.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';

class UserAvaterImage extends StatelessWidget {
  const UserAvaterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () => PickImage().pickImage(),
            child: CustomFadeInDown(
                duration: 500,
                child: BlocConsumer<UploadImageCubit, UploadImageState>(
                    listener: (context, state) {
                  state.whenOrNull(
                    sucess: () {
                      return fluttertoast(
                          text: context.translate( LangKeys.imageUploaded),
                          state: ToastStates.Success);
                    },
                    removeImage: (removeImage) {
                      return fluttertoast(
                          text: context.translate(LangKeys.imageRemoved),
                          state: ToastStates.Success);
                    },
                    error: (error) {
                      return fluttertoast(
                          text: error, state: ToastStates.Error);
                    },
                  );
                }, builder: (context, state) {
                  final isImageUploaded =
                      context.read<UploadImageCubit>().getImageUrl.isNotEmpty;
                  return state.maybeWhen(
                    ladding: () {
                      return CircleAvatar(
                        backgroundImage: AssetImage(AppImages.userAvatar),
                        radius: 38,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: context.color.mainColor,
                          ),
                        ),
                      );
                    },
                    orElse: () {
                     
                      return CircleAvatar(
                          backgroundImage: isImageUploaded
                              ? NetworkImage(context
                                  .read<UploadImageCubit>()
                                  .getImageUrl) as ImageProvider
                              : const AssetImage(AppImages.userAvatar),
                          radius: 38,
                          backgroundColor: context.color.textColor!.withOpacity(0.1),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              if (isImageUploaded)
                                Positioned(
                                  top: -15,
                                  right: -15,
                                  child: IconButton(
                                      onPressed: () {
                                        context
                                            .read<UploadImageCubit>()
                                            .removeImage();
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: context.color.textColor,
                                      )),
                                )
                              else
                                const SizedBox.shrink(),
                              Container(
                                width: 100.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Colors.grey.withOpacity(0.1),
                                     
                                ),
                              ),
                              if (isImageUploaded)
                                const SizedBox.shrink()
                              else
                                IconButton(
                                    onPressed: () {
                                      context.read<UploadImageCubit>().upload();
                                    },
                                    icon: Icon(Icons.add_a_photo,color:Colors.white))
                            ],
                          ));
                    },
                  );
                }))),
        SizedBox(height: 10.h),
      ],
    );
  }
}
