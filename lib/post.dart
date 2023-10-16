
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:time_app/feed.dart';

import 'comments.dart';
import 'lojic.dart';

class PostListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Feed'),
      ),
      body: PostList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MyApp2(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Provider.of<Data>(context);
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator()); // Loading indicator
        }

        var posts = snapshot.data!.docs;

        if (posts.isEmpty) {
          return Center(child: Text('No posts available.'));
        }

        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            var post = posts[index].data() as Map<String, dynamic>;

            return Card(
              margin: EdgeInsets.all(8),
              elevation: 2,
              child: Column(
                children: [
                 
                  ListTile(
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'edit') {
                          // Handle edit action.
                        } else if (value == 'delete') {
                          // Handle delete action.
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        PopupMenuItem<String>(
                          onTap: (){logic.deletePost(posts[index].id);},
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                     backgroundColor: Colors.red,
                    ),
                    title: Text(
                      post['email'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(post['timestamp'].toString()),
                  ),
                  post['hasImage']
                      ? Image.file(
                          File(post['imagePath'],),
                          fit: BoxFit.cover,
                        )
                      : SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(post['text']),
                  ),
                  Divider(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        onPressed: () {
                          // Implement like functionality.
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.comment),
                        onPressed: () {
                            // Navigate to the comment screen and pass the post's document ID
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentScreen(postId: posts[index].id),
                        ),
                      );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          // Implement share functionality.
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}




