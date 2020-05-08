class TodoJson {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoJson({this.userId, this.id, this.title, this.completed});

  factory TodoJson.fromJson(Map<String, dynamic> json) => new TodoJson(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
