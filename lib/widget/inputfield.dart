import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  TextEditingController input = new TextEditingController();
  Input(this.input);
  @override
  Widget build(BuildContext context) {
    return          Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                height: 50,
                width: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: input ,
                ),
              );
  }
}