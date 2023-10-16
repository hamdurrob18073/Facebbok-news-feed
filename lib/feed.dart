import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lojic.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostCreationPage(),
    );
  }
}

class PostCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Post'),
        backgroundColor: Colors.blue, // Change the app bar color.
      ),
      body: PostCreationForm(),
    );
  }
}

class PostCreationForm extends StatefulWidget {
  @override
  _PostCreationFormState createState() => _PostCreationFormState();
}

class _PostCreationFormState extends State<PostCreationForm> {
 

 








  @override
  Widget build(BuildContext context) {
    final logic = Provider.of<Data>(context);
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: logic.textController,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'What\'s on your mind?',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          if (logic.hasImage)
            Column(
              children: [
                if (logic.pickedImage != null)
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(logic.pickedImage!.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                SizedBox(height: 16),
              ],
            ),
          ElevatedButton(
            onPressed: logic.pickImage,
            child: Text('Add an Image'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Change the "Add an Image" button color.
              onPrimary: Colors.white, // Change the text color.
            ),
          ),
          SizedBox(height: 16),
         
ElevatedButton(
  onPressed: () {
   logic. createPost(logic.textController.text, logic.hasImage, logic.pickedImage != null ? logic.pickedImage!.path : '');
  },
  child: Text('Post'),
  style: ElevatedButton.styleFrom(
    primary: Colors.green,
    onPrimary: Colors.white,
  ),
),

        ],
      ),
    );
  }
}
