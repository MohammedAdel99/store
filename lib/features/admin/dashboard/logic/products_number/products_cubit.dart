import 'package:bloc/bloc.dart';
import 'package:store/features/admin/dashboard/logic/products_number/products_state.dart';
import 'package:store/features/admin/dashboard/data/repository/dashboard_repository.dart';




class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this.dashboardRepository,
  ) : super(ProductsState.loading());
  final DashboardRepository dashboardRepository;

  @override
  void emit(ProductsState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }



  void getTotalNumOfProducts() async {
    emit(ProductsState.loading());
    final response = await dashboardRepository.getTotalNumOfProducts();

  
    

    await response.when(success: (productsList) async {
     
      
     
      emit(ProductsState.success(productsList));
    }, failure: (errorHandler) {
      emit(ProductsState.error(errorHandler));
    });
  }
}
