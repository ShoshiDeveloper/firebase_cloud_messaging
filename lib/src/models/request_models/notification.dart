class Notification {
  Notification({this.title, this.body, this.image});
  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    title: json['title'] as String?,
    body: json['body'] as String?,
    image: json['image'] as String?,
  );

  Map<String, dynamic> toJson() => {
      'title': title,
      'body': body,
      'image': image,
    };


  String? title;
  String? body;
  ///Contains the URL of an image that is going to be downloaded on the device and displayed in a notification. JPEG, PNG, BMP have full support across platforms. Animated GIF and video only work on iOS. WebP and HEIF have varying levels of support across platforms and platform versions. Android has 1MB image size limit. Quota usage and implications/costs for hosting image on Firebase Storage: https://firebase.google.com/pricing
  String? image;

}
