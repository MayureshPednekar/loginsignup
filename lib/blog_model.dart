// class Blog {
//   String? title;
//   String? description;
//   int? time;

//   Blog({this.title, this.description, this.time});

//   Blog.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     description = json['description'];
//     time = json['time'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['title'] = title;
//     data['description'] = description;
//     data['time'] = time;
//     return data;
//   }

// }

import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  String title;
  String Content;

  Blog({
    required this.title,
    required this.Content,
  });

  Blog.fromJson(Map<String, Object?> json)
      : this(
          title: json['title']! as String,
          Content: json['Content']! as String,
        );

  Blog copyWith({
    String? title,
    String? Content,
  }) {
    return Blog(
      title: title ?? this.title,
      Content: Content ?? this.Content,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'Content': Content,
    };
  }
}
