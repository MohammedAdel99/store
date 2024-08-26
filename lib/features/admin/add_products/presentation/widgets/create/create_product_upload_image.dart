import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/string_exetension.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_state.dart';

class CreateProductImages extends StatelessWidget {
  const CreateProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
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
                  return fluttertoast(
                      text: context.translate(LangKeys.createProductFailed),
                      state: ToastStates.Error);
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
      
                  return SeletetYourProductImage(
                    onTap: () {},
                    index: index,
                  );
                },
                orElse: () {
                  return SeletetYourProductImage(
                    onTap: () {
                      context
                          .read<UploadImageCubit>()
                          .uploadImageList(index: index);
                    }, index: index,
                  );
                },
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 6.h));
  }
}

class SeletetYourProductImage extends StatelessWidget {
  const SeletetYourProductImage({
    super.key,
    required this.onTap,
    required this.index,
  });

  final VoidCallback onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return context.read<UploadImageCubit>().imageList[index].isNotEmpty
        ? Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(context
                        .read<UploadImageCubit>()
                        .imageList[index]
                        .imageProductFormate()))),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
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
}
