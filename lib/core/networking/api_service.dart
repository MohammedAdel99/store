import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:store/core/networking/api_constant.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseurl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  // @POST(ApiConstants.login)
  // Future<LoginResponse> login(
  //   @Body() LoginRequest loginRequest,)
}
