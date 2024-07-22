import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';
import 'package:store/features/admin/add_categories/data/models/create/create_category_response.dart';


part  'create_category_state.freezed.dart';

@freezed
class CreateCategoryState with _$CreateCategoryState {
  

   //Create Categories
  
   const factory CreateCategoryState.createCategoryInitial() = _CreateCategoryInitial;
  const factory CreateCategoryState.createCategoryLoading() = CreateCategoryLoading;
  const factory CreateCategoryState.createCategorySuccess(CreateCategoryResponse createCategoryResponse ) = CreateCategorySuccess;
  const factory CreateCategoryState.createCategoryError(ErrorHandler errorHandler ) = CreateCategoryError;

}
