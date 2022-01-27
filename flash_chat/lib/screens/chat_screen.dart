import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = "/chat";
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firebaseAuthInstance = FirebaseAuth.instance;
  final _firestoreInstance = FirebaseFirestore.instance;
  late User currentUser;

  bool _showSpinner = true;

  final _messageTextFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _showSpinner = false;
  }

  void getCurrentUser() {
    try {
      final _user = _firebaseAuthInstance.currentUser;
      if (_user != null) {
        currentUser = _user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await _firebaseAuthInstance.signOut();
                Navigator.pop(context);
              },
            ),
          ],
          title: const Text('⚡️Chat'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MessageStreamWidget(
                  firestoreInstance: _firestoreInstance,
                  currentUser: currentUser),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _messageTextFieldController,
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _firestoreInstance.collection('messages').add({
                          'content': _messageTextFieldController.text,
                          'sender': currentUser.email.toString(),
                          'time': FieldValue.serverTimestamp(),
                        });
                        _messageTextFieldController.clear();
                      },
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageStreamWidget extends StatelessWidget {
  const MessageStreamWidget({
    Key? key,
    required FirebaseFirestore firestoreInstance,
    required this.currentUser,
  })  : _firestoreInstance = firestoreInstance,
        super(key: key);

  final FirebaseFirestore _firestoreInstance;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestoreInstance.collection('messages').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageWidgets = [];

        if (snapshot.hasData) {
          final messages = snapshot.data!.docs.reversed;
          for (var message in messages) {
            messageWidgets.add(MessageBubble(
              sender: message['sender'],
              content: message['content'],
              userEmail: currentUser.email ?? "anonymous",
            ));
          }
        }
        return Expanded(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          children: messageWidgets,
          reverse: true,
        ));
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String content;
  final String userEmail;

  const MessageBubble(
      {Key? key,
      required this.sender,
      required this.content,
      required this.userEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: sender == userEmail
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(
              sender,
              style: const TextStyle(fontSize: 12.0, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 8.0),
          Material(
            elevation: 2.0,
            borderRadius: BorderRadius.only(
              topLeft:
                  sender == userEmail ? const Radius.circular(20) : Radius.zero,
              topRight:
                  sender != userEmail ? const Radius.circular(20) : Radius.zero,
              bottomLeft: const Radius.circular(20),
              bottomRight: const Radius.circular(20),
            ),
            color: sender == userEmail ? Colors.white : Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 20,
                  color: userEmail == sender ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
