import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();

}

class _AddPostState extends State<AddPost> {

  final postController=TextEditingController();
  final databaseRef= FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        appBar: AppBar(
          title: Text('Real Time Database'),
        ),

        body:Column(
          children: [
            SizedBox(
              height: 30,


            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(

                controller: postController,
                decoration: InputDecoration(
                    hintMaxLines: 26,

                    border: OutlineInputBorder(),
                    hintText: "What is in your mind"

                ),
              ),
            ),

            ElevatedButton(onPressed: (){

              databaseRef.child('2').set({  // if u change child value from 2 to 3 then it will store your
                //data in row 3.  if u use same child value then your text
                //will override on your previous text
                'title' : postController.text.toString(),
                'id' :1

              });

            },
                child: Text("Add"))

          ],



        )


    );
  }
}