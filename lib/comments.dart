import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lojic.dart';

class CommentScreen extends StatelessWidget {
  final String postId;

  CommentScreen({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: CommentList(postId: postId),
    );
  }
}
class CommentList extends StatelessWidget {
  final String postId;

  CommentList({required this.postId});

  @override
  Widget build(BuildContext context) {
     final logic = Provider.of<Data>(context);
    return ListView(
      children: [
        TextField( controller: logic.commentController,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'What\'s on your mind?',
              border: OutlineInputBorder(),
            ),),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: (){logic.addComment(postId,logic.commentController.text);}, child: Text("Comment")),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').doc(postId).collection('comments').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator()); // Loading indicator
            }

            var comments = snapshot.data!.docs;

            if (comments.isEmpty) {
              return Center(child: Text('No comments available.'));
            }

            return ListView.builder(
              shrinkWrap: true,
              
              itemCount: comments.length,
              itemBuilder: (context, index) {
                var comment = comments[index].data() as Map<String, dynamic>;

                return ListTile(leading: CircleAvatar(backgroundColor: Colors.blue,),
                  title: Text(comment['email'] ),
                  subtitle: Text(comment['commentText'].toString() ),
                  // You can add more UI elements here, such as user avatar or profile information.
                );
              },
            );
          },
        ),
      ],
    );
  }
}

