import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/string_exetension.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_state.dart';

class UpdateProductImages extends StatelessWidget {
  const UpdateProductImages({
    required this.oldProductImages,
    super.key,
  });
  final List<String> oldProductImages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: oldProductImages.length,
      itemBuilder: (context, index) {
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
                return fluttertoast(text: context.translate(LangKeys.updateProductFailed), state: ToastStates.Error);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loadingList: (indexId) {
                if (indexId == index) {
                  return Container(
                    height: 120.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
                return SeletetYourUpdateProductImage(
                  oldProductImages: oldProductImages,
                  index: index,
                  onTap: () {},
                );
              },
              orElse: () {
                return SeletetYourUpdateProductImage(
                  oldProductImages: oldProductImages,
                  index: index,
                  onTap: () {
                    context
                        .read<UploadImageCubit>()
                        .uploadUpdateImageList(indexId: index, productImageList: oldProductImages,);
                  },
                );
              },
            );
          },
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 6.h),
    );
  }
}

class SeletetYourUpdateProductImage extends StatelessWidget {
  const SeletetYourUpdateProductImage({
    
    required this.onTap,
    super.key, required this.oldProductImages, required this.index,
  });

  final int index;
  final VoidCallback onTap;
  final List<String> oldProductImages;

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap:onTap,
            child: Stack(
              children: [
                Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                      NetworkImage(

                        
                        oldProductImages[index].imageProductFormate())
                       
                    ),
                  ),
                ),
                
                Container(
                    height: 120.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    )),
            
          
      //    InkWell(
      //       onTap: onTap,
      //       child: Container(
      //         height: 120.h,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //           color: Colors.black.withOpacity(0.3),
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //         child: const Icon(
      //           Icons.add_a_photo_outlined,
      //           size: 50,
      //           color: Colors.white,
      //         ),
      // )
        //)
        ]
        ));
  }
}
