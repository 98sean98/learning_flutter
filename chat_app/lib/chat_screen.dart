import 'package:chat_app/message_box.dart';
import 'package:flutter/material.dart';

import 'chat_message.dart';

const _animationDuration = Duration(milliseconds: 150);

class ChatScreen extends StatefulWidget {
  @override
  State createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _onSubmit(String message) {
    final animationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );
    final newChatMessage = ChatMessage(
      text: message,
      animationController: animationController,
    );
    setState(() {
      _messages.add(newChatMessage);
    });
    newChatMessage.animationController.forward();
  }

  Widget _buildMessageList() {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(8),
        reverse: true,
        itemBuilder: (_, int index) => _messages[_messages.length - index - 1],
        itemCount: _messages.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat till Dawn"),
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 4,
        ),
        body: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey[200])))
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _buildMessageList(),
              Divider(
                height: 1,
              ),
              MessageBox(
                onSubmit: _onSubmit,
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}
