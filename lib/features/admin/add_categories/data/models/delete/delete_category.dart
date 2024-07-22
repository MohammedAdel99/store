class CategoriesQueries {
  factory CategoriesQueries() {
    return _instance;
  }
  const CategoriesQueries._();

  static const CategoriesQueries _instance = CategoriesQueries._();

  Map<String, dynamic> deleteMapQuery({
    required String categoryId,
  }) {
    return {
      'query': r'''
            mutation DeleteCategory($categoryId: ID!) {
              deleteCategory(id: $categoryId)
            }
      ''',
      'variables': {
        'categoryId': categoryId,
      },
    };
  }
}
