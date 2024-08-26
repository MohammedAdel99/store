import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
part  'upload_image_state.freezed.dart';

@freezed
abstract class UploadImageState<T> with _$UploadImageState<T> {
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.loading() = Loading;
  const factory UploadImageState.loadingList(int index) = LoadingListState;
   const factory UploadImageState.success() = Success;
   const factory UploadImageState.removeImage({required String imageUrl}) = RemoveImage;
    const factory UploadImageState.error(ErrorHandler errorHandler ) = Error;
  
}
