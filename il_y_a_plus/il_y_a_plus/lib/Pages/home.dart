import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget{
  const Home({
    Key key,
    @required this.user
    }): super(key : key);

  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home ${user.email}'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection('users').document(user.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              return Text('Loading..');
            default:
              print(user.uid);
              return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(snapshot.data['nom'], style: TextStyle(fontSize: 30.0),),
                  Text(snapshot.data['language'], style: TextStyle(fontSize: 30.0),),
                  Text(snapshot.data['role'], style: TextStyle(fontSize: 30.0),),
                ],
              ));
          }
        },
      ),
    );
  }

}


