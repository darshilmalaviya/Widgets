class AddProductReq {
  String? userId;
  String? title;
  String? body;

  AddProductReq({
    this.userId,
    this.title,
    this.body,
  });
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "title": title,
      "body": body,
    };
  }
}
