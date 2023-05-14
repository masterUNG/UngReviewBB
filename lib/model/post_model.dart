// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String post;
  final String detail;
  final String urlImage;
  final Timestamp timestamp;
  PostModel({
    required this.post,
    required this.detail,
    required this.urlImage,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'post': post,
      'detail': detail,
      'urlImage': urlImage,
      'timestamp': timestamp,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      post: (map['post'] ?? '') as String,
      detail: (map['detail'] ?? '') as String,
      urlImage: (map['urlImage'] ?? '') as String,
      timestamp: (map['timestamp']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
