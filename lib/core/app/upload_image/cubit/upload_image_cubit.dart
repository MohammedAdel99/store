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
    List<String> imageList = ['','',''];
    
  List<String> imageUpdateList = [];
  
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
    emit(UploadImageState.loading());
    final result = await uploadImageRepository.upload(imagefile: pickerImage);
    result.when(success: (image) {
      getImageUrl = image.location ?? '';
      emit(const UploadImageState.success());
    }, failure: (error) {
      emit(
        UploadImageState.error(error: error.apiErrorModel.message ?? ''),
      );
    });
  }

  // pick image and save it in file and upload it to server with List
  Future<void> uploadImageList({required int indexId}) async {
    final pickedImage = await PickImage().pickImage();
    if (pickedImage == null) return;

    emit(UploadImageState.loadingList(indexId));
    final result = await uploadImageRepository.upload(imagefile: pickedImage);

    result.when(
      success: (image) {
   
        imageList
          ..removeAt(indexId)
          ..insert(indexId, image.location ?? '');
        emit(const UploadImageState.success());
      },
      failure: (error) {
        emit(UploadImageState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

// Upload update image list
  Future<void> uploadUpdateImageList({
    required int indexId,
    required List<String> productImageList,
  }) async {
    final pickedImage = await PickImage().pickImage();
    if (pickedImage == null) return;

    emit(UploadImageState.loadingList(indexId));
    final result = await uploadImageRepository.upload(imagefile: pickedImage);

    result.when(
      success: (image) {
        imageUpdateList = productImageList;
        imageUpdateList
          ..removeAt(indexId)
          ..insert(indexId, image.location ?? '');
        emit(const UploadImageState.success());
      },
      failure: (error) {
        emit(UploadImageState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  //removeImage
  void removeImage() {
    getImageUrl = '';
    emit(UploadImageState.removeImage(imageUrl: getImageUrl));
  }
}
