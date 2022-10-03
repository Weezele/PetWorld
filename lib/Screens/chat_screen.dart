import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  //const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with me'),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/CNMj9G1CrZGAaH9bodB7/messages')
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          if(streamSnapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator() ,
            );
          }
          final docs = streamSnapshot.data.docs;
          return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (ctx, index) => Container(
                    padding: EdgeInsets.all(8),
                    child: Text(docs[index]['text']),
                  ));
        },
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add),
              onPressed: () {
            FirebaseFirestore.instance.collection('chats/CNMj9G1CrZGAaH9bodB7/messages').add({
              'text':'So your interested in this pet  ',


            });
              }
              
              ),
    );
  }
}
