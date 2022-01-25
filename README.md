# Rock-AI Application
# Frontend

A Smartphone-Application for Android and iOS devices, that allows you to upload images of homogeneous areas and then classify them. 
The application was implemented in Dart, using the Flutter framework.

## Key Features

- Upload images of a homogeneous area, using the package: `image_picker`
- Communication with the Firebase backend, i.e. uploading and loading images in the application
- Classification of the respective homogeneous areas and their storage in the database

## Look and Feel
<p align="center">
  <img src="assets/recordings/rockAI-UserExperience.gif" height="420px" alt="animated" />
</p>

# Backend

The backend consists of two main parts. One is the storage, preparation and preprocessing of the data and the other is the machine learning to automatically classify the hazard class (so called “Gefährdungsklasse") of a homogeneous area.
<br/><br/>
More detailed descriptions and documentation can be found in the [README.md](https://github.com/ManuelSperl/Rock-AI/tree/main/Rock-AI-Backend) and in the [documentation](https://github.com/ManuelSperl/Rock-AI/blob/main/Rock-AI-Backend/Dokumentation_Backend_ML.pdf) of the whole project.
Further descriptions of the application can also be found in the two Python files ([API_Request_generate_JSON.py](https://github.com/ManuelSperl/Rock-AI/tree/main/Rock-AI-Backend/API_Requests) and [uploadJSONFileToFirestore.py](https://github.com/ManuelSperl/Rock-AI/blob/main/Rock-AI-Backend/UploadJsonToFirebase/uploadJsonFileToFirestore.py)).

## Database Communication
### Protocol Buffers

The [Protocol Buffers (for Dart)](https://developers.google.com/protocol-buffers/docs/darttutorial) are implemented in the File [databaseStructure.proto](https://github.com/ManuelSperl/Rock-AI/edit/main/Rock-AI-Frontend/lib/databaseStructure.proto). This File should represent the structure of the Database.
Actually (29.10.21) the code in the commends is the structure for the Rock AI database but for the Realtime Database and not for the now used Firestore Database.
<br/>
The other databaseStructure.* files are generate with the command: `protoc --dart_out=. lib/databaseStructure.proto`
<br/>
The actual Protocol Buffer code is not used in the running app and is only a dummy Text.

Here is a [GitHub Repo](https://github.com/FirebaseExtended/protobuf-rules-gen) with a documentation to get used with protocol buffers.

### Firebase Firestore Database

In this app, the database [Firebase Firestore](https://firebase.google.com/docs/firestore) is used.<br/>
The database functions are coded in the file [data_repository.dart](https://github.com/ManuelSperl/Rock-AI/edit/main/Rock-AI-Frontend/lib/repository/data_repository.dart).
<br/>

In the [main.dart](https://github.com/ManuelSperl/Rock-AI/edit/main/Rock-AI-Frontend/main.dart) class, there are the two important functions:<br/>

**WidgetsFlutterBinding.ensureInitialized()**<br/>
`WidgetsFlutterBinding` is used to interact with the Flutter engine, which is used by Flutter plugins through platform channel to interact with the native code. Therefore, you need to call `ensureInitialized` to ensure the binding between widget layer and flutter engine is initialized before calling the `initializeApp()` method of Firebase plugin.
<br/>

**await Firebase.initializeApp()**<br/>
`await Firebase.initializeApp()` initializes the Firebase app and then rest of the code is executed.
