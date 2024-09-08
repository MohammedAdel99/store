import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/networking/api_error_handler.dart';



part  'delete_category_state.freezed.dart';

@freezed
class DeleteCategoryState with _$DeleteCategoryState {
  

  //delete Category
  const factory DeleteCategoryState.deleteCategoryInitial() = _DeleteCategoryInitial;
  const factory DeleteCategoryState.deleteCategoryLoading({required String categoryId}) = DeleteCategoryLoading;
  const factory DeleteCategoryState.deleteCategorySuccess( ) = DeleteCategorySuccess;
  const factory DeleteCategoryState.deleteCategoryError(ErrorHandler errorHandler ) = DeleteCategoryError;

}
