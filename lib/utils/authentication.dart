import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:prueba_mvc/models/users/usersf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
UserF actual;

bool authSignedIn;
String uid;
String userEmail;
String name;
String imageUrl;

Future<String> signInWithGoogle() async {
  // Initialize Firebase
  await Firebase.initializeApp();
  
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
  
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  
  final UserCredential userCredential = await _auth.signInWithCredential(credential);
  final User user = userCredential.user;
  
  if (user != null) {
    // Checking if email and name is null
    assert(user.uid != null);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);
  
    uid = user.uid;
    name = user.displayName;
    userEmail = user.email;
    imageUrl = user.photoURL;
    Query query= FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: user.uid);
    var result = await query.get();
    actual = result.docs
        .map((doc) => UserF.fromMap(doc.data(), doc.id))
        .toList()[0];
  
    print(actual.toString());
  
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
  
    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);
  
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', true);
  
    return 'Google sign in successful, User UID: ${user.uid}';
  }
  
  return null;
}


void signOutGoogle() async {
  await googleSignIn.signOut();
  await _auth.signOut();
  
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);
  
  uid = null;
  name = null;
  userEmail = null;
  imageUrl = null;
  
  print("User signed out of Google account");
}

Future getUser() async {
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool authSignedIn = prefs.getBool('auth') ?? false;

  final User user = _auth.currentUser;

  if (authSignedIn == true) {
    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
    }
  }
}

Future<String> registerWithEmailPassword(String email, String password) async {
  await Firebase.initializeApp();

  final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  final User user = userCredential.user;

  if (user != null) {
    // checking if uid or email is null
    assert(user.uid != null);
    assert(user.email != null);

    uid = user.uid;
    userEmail = user.email;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    return user.uid;
  }

  return null;
}

Future<String> signInWithEmailPassword(String email, String password) async {
  await Firebase.initializeApp();

  final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  final User user = userCredential.user;

  if (user != null) {
    // checking if uid or email is null
    assert(user.uid != null);
    assert(user.email != null);

    uid = user.uid;
    userEmail = user.email;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', true);
    Query query= FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: user.uid);
    var result = await query.get();
    final actual2 = result.docs
        .map((doc) => UserF.fromMap(doc.data(), doc.id))
        .toList();
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    actual=actual2[0];

    return user.uid;
  }

  return null;
}

Future<String> signOut() async {
  await _auth.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);

  uid = null;
  userEmail = null;

  return 'User signed out';
}


void forgoutPassword(String email) async {
  Dio dio= new Dio();
  dio.options.headers['content-Type'] = 'application/json';
  dio.options.headers["authorization"] = "Bearer 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";
  Map<String, String> headers = new Map();
  headers["Authorization"] =
      "Bearer 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";
  headers["Content-Type"] = "application/json";

  var url = 'https://api.sendgrid.com/v3/mail/send';
  var body = jsonEncode({ 'personalizations':[ {'to':[{'email':'walkey1239@gmail.com','name':'walker manrique'}],  'subject':'Hello, World!'} ], 'content': [{ 'type': 'text/plain',  'value': 'que penita!' }],  'from':{'email':'walket1239@gmail.com','name':'Walker Manrique'},'reply_to':{'email':'walket1239@gmail.com','name':'Walker Manrique'}});
  var response = await http.post(url,
    headers: headers,
    body: body
    );
       //  "{\n          \"personalizations\": [\n            {\n              \"to\": [\n                {\n                  \"email\": \"$email\"\n                },\n             ]\n            }\n          ],\n          \"from\": {\n            \"email\": \"walket1239@gmail.com\"\n          },\n          \"subject\": \"Olvidaste tu contraseña\",\n          \"content\": [\n            {\n              \"type\": \"text\/plain\",\n              \"value\": \"Que penita lo siento mucho\"\n            }\n          ]\n        }");
  /*await dio.post(
    url,
    data:  "{\n          \"personalizations\": [\n            {\n              \"to\": [\n                {\n                  \"email\": \"walkey1239@gmail.com\"\n                },\n              ]\n            }\n          ],\n          \"from\": {\n            \"email\": \"walket1239@gmail.com\"\n          },\n          \"subject\": \"New user registration\",\n          \"content\": [\n            {\n              \"type\": \"text\/plain\",\n              \"value\": \"New user register: $email\"\n            }\n          ]\n        }"
, //create a Stream<List<int>>

  );*/
  
  /*print('Response status: ${response.statusCode}');
  print('Response body: ${response.data}');*/
}


