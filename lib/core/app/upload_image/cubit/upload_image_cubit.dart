import 'package:bloc/bloc.dart';
import 'package:store/core/helpers/image_picker.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_state.dart';
import 'package:store/core/app/upload_image/upload_image_repository.dart/upload_image_repo.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this.uploadImageRepository)
      : super(UploadImageState.initial());
  final UploadImageRepository uploadImageRepository;
  String getImageUrl = '';
  @override
  void emit(UploadImageState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  //uploadImage
  Future<void> upload() async {
    final pickerImage = await PickImage().pickImage();
    if (pickerImage == null) return;
    emit(UploadImageState.ladding());
    final result = await uploadImageRepository.upload(imagefile: pickerImage);
    result.when(success: (image) {
      getImageUrl = image.location ?? '';
      emit(const UploadImageState.sucess());
    }, failure: (error) {
      emit(
        UploadImageState.error(error: error.apiErrorModel.message ?? ''),
      );
    });
  }

  //removeImage
  void removeImage() {
    getImageUrl = '';
    emit(UploadImageState.removeImage(imageUrl: getImageUrl));
  }
}
