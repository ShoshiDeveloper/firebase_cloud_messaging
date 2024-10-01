class ApnsNotification {
  ApnsNotification({this.headers, this.payload});
  Map<String, dynamic> toJson() => {
    'headers': headers,
    'payload': payload
  };

  Map<String, String>? headers;
  Map<String, String>? payload;

}
