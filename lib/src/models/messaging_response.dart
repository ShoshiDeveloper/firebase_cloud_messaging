import 'package:firebase_messaging_backend_service/src/models/request_models/message.dart';

class CloudMessagingResponse {
  CloudMessagingResponse(this.successful, this.statusCode, this.messageSent, this.errorPhrase);
  bool successful;
  int statusCode;
  Message messageSent;
  String? errorPhrase;


  @override
  String toString() {
    return 'ServerResult{successful: $successful, statusCode: $statusCode, messageSent: $messageSent, errorPhrase: $errorPhrase}';
  }

}