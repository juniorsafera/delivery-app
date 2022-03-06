 // ignore_for_file: file_names

 import 'package:flutter/material.dart';

class TotalItem extends StatefulWidget {
  final String data;
  const TotalItem({Key? key,
  required this.data
  }) : super(key: key);

  @override
  _TotalItemState createState() => _TotalItemState();
}

class _TotalItemState extends State<TotalItem> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.data);
  }
}
