class UserModel {
  int userId;
  int? id;
  String? title;
  String body;

  UserModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      userId: data['userId'],
      title: data['title'],
      body: data['body'],
    );
  }
}
