class WebpushNotification {
  WebpushNotification({this.headers, this.data, this.notification});
  Map<String, dynamic> toJson() => {
    'headers': headers,
    'data': data,
    'notification': notification
  };
  Map<String, String>? headers;
  Map<String, String>? data;
  Map<String, String>? notification;

}
