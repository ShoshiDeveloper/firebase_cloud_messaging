import 'package:firebase_messaging_backend_service/firebase_messaging_backend_service.dart';

void main() async {
  FirebaseCloudMessagingService firebaseCloudMessagingService = FirebaseCloudMessagingService(
      jwtClaim: JWTDAO(
        clientEmail: '',
        clientId: '',
        privateKey: '',
        privateKeyId: '',
      ),
      projectId: '');

  final response =
      await firebaseCloudMessagingService.send(Message(token: '', name: 'Name', notification: Notification(title: 'Test title', body: 'Test body')));

  print(response.statusCode);
  print(response.successful);
}
