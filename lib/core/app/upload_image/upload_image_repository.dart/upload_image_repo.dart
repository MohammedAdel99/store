import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/core/networking/api_result.dart';
import 'package:store/core/networking/api_service.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/core/app/upload_image/model/upload_image_response.dart';

class UploadImageRepository {
  final ApiService _apiService;
  UploadImageRepository(
    this._apiService,
  );

  Future<ApiResult<UploadImageResponse>> upload({required XFile imagefile}) async {
    try {
      final formData = FormData();
      formData.files
          .add(MapEntry('file', await MultipartFile.fromFile(imagefile.path)));
      final response = await _apiService.upload(formData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
