import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatefulWidget {
  final MessageBoxCallback onSubmit;

  MessageBox({Key key, this.onSubmit}) : super(key: key);

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isComposing = false;

  void _handleSubmit(String value) {
    if (_isComposing) {
      _textEditingController.clear();
      widget.onSubmit(value);
    }
  }

  void _handleChange(String value) {
    setState(() {
      _isComposing = value.length > 0;
    });
  }

  void _handleButtonPress() => _handleSubmit(_textEditingController.text);

  Widget _buildTextComposer() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
                controller: _textEditingController,
                onChanged: _handleChange,
                onSubmitted: _handleSubmit,
                textAlign: TextAlign.left,
                autofocus: true,
                decoration:
                    InputDecoration.collapsed(hintText: "type a message"),
                cursorColor: Colors.black87),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Theme.of(context).platform == TargetPlatform.iOS
                ? CupertinoButton(
                    child: new Text("Send"),
                    onPressed: _handleButtonPress,
                  )
                : IconButton(
                    icon: Icon(Icons.arrow_forward,
                        color: !_isComposing
                            ? Theme.of(context).disabledColor
                            : null),
                    onPressed: _handleButtonPress,
                  ),
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: _buildTextComposer());
  }
}

typedef MessageBoxCallback = void Function(String message);
