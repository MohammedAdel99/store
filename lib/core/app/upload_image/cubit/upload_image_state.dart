import 'package:freezed_annotation/freezed_annotation.dart';
part  'upload_image_state.freezed.dart';

@freezed
abstract class UploadImageState<T> with _$UploadImageState<T> {
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.ladding() = Loading;
   const factory UploadImageState.sucess() = Success;
   const factory UploadImageState.removeImage({required String imageUrl}) = RemoveImage;
    const factory UploadImageState.error({required String error}) = Error;
  
}
