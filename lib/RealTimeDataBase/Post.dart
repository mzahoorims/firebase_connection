import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddPost.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen', style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=> AddPost()));
        },

        child: Icon(Icons.add),
      ),

      body: Text('Welcome to my app'),

    );
  }
}
