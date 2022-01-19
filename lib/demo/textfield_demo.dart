import 'package:flutter/material.dart';

class TextFieldDemo extends StatelessWidget {
  TextFieldDemo({Key? key}) : super(key: key);
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget current;
    var decoration = InputDecoration(
        prefixIcon: Icon(Icons.lock),
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true);
    current = TextField(
      keyboardType: TextInputType.text,
      controller: _editingController,
      decoration: decoration,
    );
    current = Container(
      margin: EdgeInsets.all(12),
      child: current,
    );
    current = Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: current,
    );
    return current;
  }
}
