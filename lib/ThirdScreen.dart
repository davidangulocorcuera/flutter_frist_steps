import 'package:flutter/material.dart';
import 'package:flutter_app/SecondScreen.dart';

class ThirdScreen extends StatefulWidget {
  final int position;

  @override
  _ThirdScreenState createState() => _ThirdScreenState();

  ThirdScreen({this.position});
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('elemento ${widget.position}'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Center(
            child: Container(
              color: Colors.green,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, index);
                },
                child: Text(
                  'celda $index',
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
