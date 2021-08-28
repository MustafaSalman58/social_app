import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String name;
  String uId;
  String image;
  Timestamp dateTime;
  String text;
  String postImage;
  Map<String, dynamic> likes;

  PostModel({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.text,
    this.postImage,
    this.likes,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    text = json['text'];
    postImage = json['postImage'];
    likes = json['likes'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'dateTime': dateTime,
      'text': text,
      'postImage': postImage,
      'likes': likes,
    };
  }
}
