class PostModel {
  PostModel({
    required this.content,
    required this.employeeId,
    required this.postdate,
  });

  late final String content;
  late final String employeeId;
  late final String postdate;

  PostModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    employeeId = json['employeeId'];
    postdate = json['postdate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content;
    _data['employeeId'] = employeeId;
    _data['postdate'] = postdate;
    return _data;
  }

  PostModel copyWith({
    String? content,
    String? employeeId,
    String? postdate,
  }) {
    return PostModel(
      content: content ?? this.content,
      employeeId: employeeId ?? this.employeeId,
      postdate: postdate ?? this.postdate,
    );
  }
}
