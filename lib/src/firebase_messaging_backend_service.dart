import 'dart:convert';

import 'package:firebase_messaging_backend_service/src/models/jwt_dao.dart';
import 'package:firebase_messaging_backend_service/src/models/request_models/message.dart';
import 'package:firebase_messaging_backend_service/src/models/request_models/notification.dart';
import 'package:firebase_messaging_backend_service/src/models/messaging_response.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class FirebaseCloudMessagingService {
  JWTDAO jwtClaim;
  String projectId;
  AccessCredentials? _accessCredentials;
  FirebaseCloudMessagingService({required this.jwtClaim, required this.projectId});

  Future<AccessCredentials?> _auth() async {
    var accountCredentials = ServiceAccountCredentials.fromJson({
      "private_key_id": "${jwtClaim.privateKeyId}",
      "private_key": "${jwtClaim.privateKey}",
      "client_email": "${jwtClaim.clientEmail}",
      "client_id": "${jwtClaim.clientId}",
      "type": "service_account"
    });
    var scopes = ["https://www.googleapis.com/auth/firebase.messaging"];
    var client = http.Client();
    _accessCredentials = await obtainAccessCredentialsViaServiceAccount(accountCredentials, scopes, client);
    
    client.close();
    print(_accessCredentials?.accessToken.data);
    print(_accessCredentials?.refreshToken);

    return _accessCredentials;
  }

  Future<CloudMessagingResponse> send(Message sendObject) async {
    return await _send(sendObject);
  }

  Future<CloudMessagingResponse> _send(Message sendObject) async {
    if (_accessCredentials == null || DateTime.now().isAfter(_accessCredentials!.accessToken.expiry)) {
      await _auth();
    }

    final url = 'https://fcm.googleapis.com/v1/projects/$projectId/messages:send';
    final response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json", "Authorization": "Bearer ${_accessCredentials!.accessToken.data}"},
      body: json.encode(sendObject.toJson())
    );
    final successful = response.statusCode == 200;
    print("successful: ${response.body}");
    print("successful: $successful");
    final serverResult =
        CloudMessagingResponse(successful, response.statusCode, successful ? Message.fromJson(json.decode(response.body)) : Message(notification: Notification()), response.reasonPhrase);
    print(serverResult);
    return serverResult;
  }

}