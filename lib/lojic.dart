import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_app/post.dart';
import 'package:intl/intl.dart';

import 'gloval.dart';

class Data extends ChangeNotifier {

 TextEditingController namcon = TextEditingController();
  TextEditingController pascon = TextEditingController();
   TextEditingController textController = TextEditingController();
    TextEditingController commentController = TextEditingController();
  bool hasImage = false;
  XFile? pickedImage;
 
   BuildContext context;
  Data(this.context);


  singin(BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: namcon.text,
      password: pascon.text,
    );
    var authCredential = userCredential.user;
    if (authCredential!.uid.isNotEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PostListPage()));
    } else {
      Fluttertoast.showToast(msg: 'Something is wrong');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Fluttertoast.showToast(msg: 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
    }
  }notifyListeners();
  
 
  
}

 resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: namcon.text);
      Fluttertoast.showToast(msg: 'Password reset email sent to ${namcon.text}');
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: 'Error: ${e.message}');
    }notifyListeners();
  }


  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  singup(BuildContext context)async{

    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: namecontroller.text,
          password: passcontroller.text
      );
      var authCredential = userCredential.user;
      if(authCredential!.uid.isNotEmpty){
        Navigator.push(context , MaterialPageRoute(builder: (context)=>PostListPage()));
      }
      else{
        Fluttertoast.showToast(msg: "Something is wrong");
      }


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "The account already exists for that email.");
      }
    } catch (e) {
      print(e);


    }
     
     sharedPreferences =await SharedPreferences.getInstance();
    await sharedPreferences!.setString("email",namecontroller.text);
    await sharedPreferences!.setString("password", passcontroller.text);
   
     notifyListeners();

  } 

   Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      
        pickedImage = image;
        hasImage = true;
      
    }notifyListeners();
  }

   createPost(String text, bool hasImage, String imagePath) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var currentuser = auth.currentUser;
  String userId = currentuser?.uid ?? '';
  String email = currentuser?.email ?? ''; // Get the current user's email

  CollectionReference postsCollection = FirebaseFirestore.instance.collection("posts");
  
  await postsCollection.add({
    'text': text,
    'hasImage': hasImage,
    'imagePath': imagePath,
    'timestamp': Timestamp.now(),
    'userId': userId,
    'email': email, // Store the user's email
  });notifyListeners();textController.clear();
}

Future<void> deletePost(String postId) async {
  CollectionReference postsCollection = FirebaseFirestore.instance.collection("posts");

  // Delete the post with the specified document ID.
  await postsCollection.doc(postId).delete();
  notifyListeners();
}

Future<void> addComment(String postId, String commentText) async {
  final CollectionReference postComments = FirebaseFirestore.instance
      .collection('posts')
      .doc(postId)
      .collection('comments');

  final user = FirebaseAuth.instance.currentUser;
   final FirebaseAuth auth = FirebaseAuth.instance;
  var currentuser = auth.currentUser;
   String email = currentuser?.email ?? '';

  // Add a new document with the comment data
  await postComments.add({
    'commentText': commentText,
    'commenterUserId': user!.uid,  // Store the user ID of the commenter
    'timestamp': Timestamp.now(), 
     'email': email,// Store the timestamp of the comment
  });
   final dateTime = DateTime.now(); // Assuming you want to use the current timestamp
  final formattedDate = DateFormat.yMMMd().format(dateTime); 
   notifyListeners(); commentController.clear();
}
  
  




}