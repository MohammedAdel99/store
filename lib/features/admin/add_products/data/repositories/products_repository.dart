import 'package:store/core/networking/api_result.dart';
import 'package:store/core/networking/api_service.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/add_products/data/models/create/create_product_request.dart';
import 'package:store/features/admin/add_products/data/models/get/get_all_products_response.dart';
import 'package:store/features/admin/add_products/data/models/create/create_product_response.dart';

class ProductsRepository {
  final ApiService apiService;
  ProductsRepository(
    this.apiService,
  );

  //getAllCategories
  Future<ApiResult<List<GetProductResponse>>> getAllProducts() async {
    try {
      final response = await apiService.getAllProducts();
      return ApiResult.success(response.reversed.toList());
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  //Create Category
  Future<ApiResult<CreateProductResponse>> createProduct(
      CreateProductRequest createProductRequest) async {
    try {
      final response = await apiService.createProduct(createProductRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
