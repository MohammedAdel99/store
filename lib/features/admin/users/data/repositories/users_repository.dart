import 'package:store/core/networking/api_result.dart';
import 'package:store/core/networking/api_service.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/users/data/models/delete/delete_user_request.dart';
import 'package:store/features/admin/users/data/models/get/get_all_users_response.dart';

class UsersRepository {
  final ApiService apiService;
  UsersRepository(
    this.apiService,
  );

  //Get All Users
  Future<ApiResult<List<GetUserResponse>>> getAllUsers() async {
    try {
      final response = await apiService.getAllUser();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
   //Delete User
  Future<ApiResult<void>> deleteUser({required String userId}) async {
    try {
      final response = await apiService.deleteUser(
          DeleteUserQuery().deleteUserMapQuery(userId: userId));
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
