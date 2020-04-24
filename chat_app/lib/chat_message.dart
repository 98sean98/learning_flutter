import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  ChatMessage({Key key, @required this.text, this.animationController})
      : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity:
          CurvedAnimation(parent: animationController, curve: Curves.easeIn),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[_Avatar(), _Message(text: text)])),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String _name = 'Sean';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 16),
        child: CircleAvatar(child: Text(_name)));
  }
}

class _Message extends StatelessWidget {
  final String text;
  final String _name = 'Sean';

  _Message({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 4.0),
        child: Text(text, style: Theme.of(context).textTheme.body1),
      ),
    );
  }
}
