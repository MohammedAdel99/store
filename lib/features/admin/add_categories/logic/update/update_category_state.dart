import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';


part  'update_category_state.freezed.dart';

@freezed
class UpdateCategoryState with _$UpdateCategoryState {
  

   //Update Categories
  
   const factory UpdateCategoryState.updateCategoryInitial() = _UpdateCategoryInitial;
  const factory UpdateCategoryState.updateCategoryLoading({required String categoryId}) = UpdateCategoryLoading;
  const factory UpdateCategoryState.updateCategorySuccess() = UpdateCategorySuccess;
  const factory UpdateCategoryState.updateCategoryError(ErrorHandler errorHandler ) = UpdateCategoryError;

}
