import 'package:firebase_messaging_backend_service/firebase_messaging_backend_service.dart';
import 'package:firebase_messaging_backend_service/src/models/jwt_dao.dart';
import 'package:firebase_messaging_backend_service/src/models/request_models/message.dart';
import 'package:firebase_messaging_backend_service/src/models/request_models/notification.dart';

void main() async {
  FirebaseCloudMessagingService firebaseCloudMessagingService = FirebaseCloudMessagingService(
    jwtClaim: JWTDAO(
      clientEmail: '',
      clientId: '',
      privateKey: '',
      privateKeyId: '',
    ),
    projectId: 'smarthome-67ad8'
    
  );

  final response = await firebaseCloudMessagingService.send(Message(
      token: '',
      name: 'Name',
      notification: Notification(
        title: 'Test title',
        body: 'Test body'
      )
    ));

  print(response.statusCode);
  print(response.successful);
}
