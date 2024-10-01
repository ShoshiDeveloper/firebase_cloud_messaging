
import 'package:firebase_messaging_backend_service/src/models/request_models/configs/android_notification.dart';
import 'package:firebase_messaging_backend_service/src/models/request_models/configs/apns_notification.dart';
import 'package:firebase_messaging_backend_service/src/models/request_models/configs/webpush_notification.dart';
import 'package:firebase_messaging_backend_service/src/models/request_models/notification.dart';

class Message {
  Message({this.name, this.data, required this.notification, this.token, this.topic, this.condition});
  factory Message.fromJson(Map<String, dynamic> json) => Message(
    name: json['name'] as String?,
    data: (json['data'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    notification: Notification(),
    token: json['token'] as String?,
    topic: json['topic'] as String?,
    condition: json['condition'] as String?,
  );

  String? name;
  Map<String, String>? data;
  Notification notification;

  AndroidNotification? android;
  WebpushNotification? webpush;
  ApnsNotification? apns;

  String? token;
  String? topic;
  String? condition;

  Map<String, dynamic> toJson() => {
      'name': name,
      'data': data,
      'notification': notification.toJson(),
      'android': android?.toJson(),
      'webpush': webpush?.toJson(),
      'apns': apns?.toJson(),
      'token': token,
      'topic': topic,
      'condition': condition,
    };


  @override
  String toString() {
    return 'Message{name: $name, data: $data, notification: $notification, token: $token, topic: $topic, condition: $condition}';
  }
}
