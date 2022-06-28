class PostModel {
  late String name;
  late String uId;
  late String image;
  // late DateTime date;
  late String text;
  late String postImage;
  late Map<String, dynamic> likes;
  List? likesNum;
  late List<dynamic> comments = [];
  late List<dynamic> commentsName = [];
  late List<dynamic> commentsImage = [];
  List? commentsNum;
  late bool myLike;

  PostModel({
    required this.name,
    required this.uId,
    required this.image,
    // required this.date,
    required this.text,
    required this.postImage,
    required this.likes,
    required this.myLike,
    required this.likesNum,
    comments = 0,
    required this.commentsNum,
    required this.commentsName,
    required this.commentsImage,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    // date = json['date'];
    text = json['text'];
    postImage = json['postImage'];
    likes = json['likes'];
    myLike = json['myLike'];
    likesNum = json['likesNum'];
    comments = json['comments'];
    commentsNum = json['commentsNum'];
    commentsName = json['commentsName'];
    commentsImage = json['commentsImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      // 'date': date,
      'text': text,
      'postImage': postImage,
      'likes': likes,
      'myLike': myLike,
      'likesNum': likesNum,
      'comments': comments,
      'commentsNum': commentsNum,
      'commentsName': commentsName,
      'commentsImage': commentsImage,
    };
  }
}

class CommentsModel {
  late String name;
  late String uId;
  late String image;
  String? commentImage;
  late String date;
  String? text;

  CommentsModel({
    required this.uId,
    required this.name,
    required this.image,
    this.text,
    this.commentImage,
    required this.date,
  });
  CommentsModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];

    uId = json['uId'];

    image = json['image'];
    commentImage = json['commentImage'];
    date = json['date'];
    text = json['text'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'text': text,
      'commentImage': commentImage,
      'date': date,
    };
  }
}
