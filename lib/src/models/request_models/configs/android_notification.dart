import 'package:firebase_messaging_backend_service/src/enums/notification_priority.dart';
import 'package:firebase_messaging_backend_service/src/enums/notification_visibility.dart';

class AndroidNotification {
  AndroidNotification(
      {this.title,
      this.body,
      this.icon,
      this.color,
      this.sound,
      this.tag,
      this.clickAction,
      this.bodyLocKey,
      this.bodyLocArgs,
      this.titleLocKey,
      this.titleLocArgs,
      this.channelId,
      this.ticker,
      this.sticky,
      this.eventTime,
      this.localOnly,
      this.notificationPriority,
      this.defaultSound,
      this.defaultVibrateTimings,
      this.defaultLightSettings,
      this.vibrateTimings,
      this.visibility,
      this.notificationCount,
      this.lightSettings,
      this.image});

  String? title;
  String? body;

  ///The notification's icon. Sets the notification icon to myicon for drawable resource myicon. If you don't send this key in the request, FCM displays the launcher icon specified in your app manifest.
  String? icon;

  ///The notification's icon color, expressed in #rrggbb format.
  String? color;

  ///The sound to play when the device receives the notification. Supports "default" or the filename of a sound resource bundled in the app. Sound files must reside in /res/raw/.
  String? sound;

  ///Identifier used to replace existing notifications in the notification drawer. If not specified, each request creates a new notification. If specified and a notification with the same tag is already being shown, the new notification replaces the existing one in the notification drawer.
  String? tag;

  ///The action associated with a user click on the notification. If specified, an activity with a matching intent filter is launched when a user clicks on the notification.
  String? clickAction;

  ///The key to the body string in the app's string resources to use to localize the body text to the user's current localization. See String Resources for more information.
  String? bodyLocKey;

  ///Variable string values to be used in place of the format specifiers in body_loc_key to use to localize the body text to the user's current localization. See Formatting and Styling for more information.
  List<String>? bodyLocArgs;

  ///The key to the title string in the app's string resources to use to localize the title text to the user's current localization. See String Resources for more information.
  String? titleLocKey;

  ///Variable string values to be used in place of the format specifiers in title_loc_key to use to localize the title text to the user's current localization. See Formatting and Styling for more information.
  List<String>? titleLocArgs;

  ///The notification's channel id (new in Android O). The app must create a channel with this channel ID before any notification with this channel ID is received. If you don't send this channel ID in the request, or if the channel ID provided has not yet been created by the app, FCM uses the channel ID specified in the app manifest.
  String? channelId;

  ///Sets the "ticker" text, which is sent to accessibility services. Prior to API level 21 (Lollipop), sets the text that is displayed in the status bar when the notification first arrives.
  String? ticker;

  ///When set to false or unset, the notification is automatically dismissed when the user clicks it in the panel. When set to true, the notification persists even when the user clicks it.
  bool? sticky;

  ///Set the time that the event in the notification occurred. Notifications in the panel are sorted by this time. A point in time is represented using protobuf.Timestamp.
  //
  //A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z".
  String? eventTime;

  ///Set whether or not this notification is relevant only to the current device. Some notifications can be bridged to other devices for remote display, such as a Wear OS watch. This hint can be set to recommend this notification not be bridged. See Wear OS guides
  bool? localOnly;

  ///Set the relative priority for this notification. Priority is an indication of how much of the user's attention should be consumed by this notification. Low-priority notifications may be hidden from the user in certain situations, while the user might be interrupted for a higher-priority notification. The effect of setting the same priorities may differ slightly on different platforms. Note this priority differs from AndroidMessagePriority. This priority is processed by the client after the message has been delivered, whereas AndroidMessagePriority is an FCM concept that controls when the message is delivered.
  NotificationPriority? notificationPriority;

  ///If set to true, use the Android framework's default sound for the notification. Default values are specified in config.xml.
  bool? defaultSound;

  ///If set to true, use the Android framework's default vibrate pattern for the notification. Default values are specified in config.xml. If default_vibrate_timings is set to true and vibrate_timings is also set, the default value is used instead of the user-specified vibrate_timings.
  bool? defaultVibrateTimings;

  ///If set to true, use the Android framework's default LED light settings for the notification. Default values are specified in config.xml. If default_light_settings is set to true and light_settings is also set, the user-specified light_settings is used instead of the default value.
  bool? defaultLightSettings;

  ///Set the vibration pattern to use. Pass in an array of protobuf.Duration to turn on or off the vibrator. The first value indicates the Duration to wait before turning the vibrator on. The next value indicates the Duration to keep the vibrator on. Subsequent values alternate between Duration to turn the vibrator off and to turn the vibrator on. If vibrate_timings is set and default_vibrate_timings is set to true, the default value is used instead of the user-specified vibrate_timings.
  //
  //A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
  List<String>? vibrateTimings;

  ///Set the Notification.visibility of the notification.
  NotificationVisibility? visibility;

  ///Sets the number of items this notification represents. May be displayed as a badge count for launchers that support badging.See Notification Badge. For example, this might be useful if you're using just one notification to represent multiple new messages but you want the count here to represent the number of total new messages. If zero or unspecified, systems that support badging use the default, which is to increment a number displayed on the long-press menu each time a new notification arrives.
  int? notificationCount;

  ///Settings to control the notification's LED blinking rate and color if LED is available on the device. The total blinking time is controlled by the OS.
  LightSettings? lightSettings;

  ///Contains the URL of an image that is going to be displayed in a notification. If present, it will override google.firebase.fcm.v1.Notification.image.
  String? image;




  Map<String, dynamic> toJson() => {
    'title': title,
    'body': body,
    'icon': icon,
    'color': color,
    'sound': sound,
    'tag': tag,
    'click_action': clickAction,
    'body_loc_key': bodyLocKey,
    'body_loc_args': bodyLocArgs,
    'title_loc_args': titleLocArgs,
    'title_loc_key': titleLocKey,
    'channel_id': channelId,
    'ticker': ticker,
    'sticky': sticky,
    'event_time': eventTime,
    'local_only': localOnly,
    'notification_priority': notificationPriority?.name,
    'default_sound': defaultSound,
    'default_light_settings': defaultLightSettings,
    'default_vibrate_timings': defaultVibrateTimings,
    'vibrate_timings': vibrateTimings,
    'visibility': visibility?.name,
    'notification_count': notificationCount,
    'light_settings': lightSettings,
    'image': image,
  };
}



class LightSettings {
  FCMColor? color;
  String? light_on_duration;
  String? light_off_duration;

  LightSettings({this.color, this.light_on_duration, this.light_off_duration});
}

class FCMColor {
  int? red;
  int? green;
  int? blue;
  int? alpha;

  FCMColor({this.red, this.green, this.blue, this.alpha});
}
