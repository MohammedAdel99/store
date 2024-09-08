class DeleteUserQuery {
  factory DeleteUserQuery() {
    return _instance;
  }
  const DeleteUserQuery._();

  static const DeleteUserQuery _instance = DeleteUserQuery._();


  // delete user
  Map<String, dynamic> deleteUserMapQuery({
    required String userId,
  }) {
    return {
      'query': r'''
            mutation DeleteUser($userId: ID!) {
              deleteUser(id: $userId)
            }
      ''',
      'variables': {
        'userId': userId,
      },
    };
  }
}