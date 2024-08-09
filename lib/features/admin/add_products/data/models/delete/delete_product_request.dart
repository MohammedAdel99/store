class ProductsQueries {
  factory ProductsQueries() {
    return _instance;
  }
  const ProductsQueries._();

  static const ProductsQueries _instance = ProductsQueries._();

  Map<String, dynamic> deleteMapQuery({
    required String productId,
  }) {
    return {
      'query': r'''
            mutation DeleteProduct($productId: ID!) {
              deleteProduct(id: $productId)
            }
      ''',
      'variables': {
        'productId': productId,
      },
    };
  }
}
