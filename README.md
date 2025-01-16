To work with the package, you need to get data for working with Firebase services. To get a json file with them, go to the project settings in the Firebase panel, and then to the Service account and generate a new private key, after which you will receive a json file with all the necessary data that you need to enter. 

important! Do not distribute the generated json file to anyone, as it gives access to your project's Firebase services!

```dart
  FirebaseCloudMessagingService firebaseCloudMessagingService = FirebaseCloudMessagingService(
      jwtClaim: JWTDAO(
        clientEmail: '',// client_email key in json
        clientId: '', //client_id key in json
        privateKey: '', //private_key key in json
        privateKeyId: '', //private_key_id key in json
      ),
      projectId: '',//project_id key in json
      );
```