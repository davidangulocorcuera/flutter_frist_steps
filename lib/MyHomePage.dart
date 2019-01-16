import 'package:flutter/material.dart';
import 'package:flutter_app/SecondScreen.dart';
import 'package:flutter_app/ThirdScreen.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  SecondScreen  secondScreen = SecondScreen();
  ThirdScreen thirdScreen = ThirdScreen();
  Widget screen;
  int _currentIndex = 0;
   List<Widget> _children = [];


  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screen =  secondScreen;
     _children = [
      thirdScreen,
      secondScreen
    ];

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),

          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text('Cosas'),
          )
        ],
      ),
     /* drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Container(
              color: Colors.blue,
            ),),
            ListTile(
              leading:  Icon(Icons.home),
              title: Text("Home"),
              onTap:(){
                setState(() {
                  screen = secondScreen;
                  Navigator.pop(context);
                });
              },
            ),

            ListTile(
              leading:  Icon(Icons.settings),
              title: Text("Cosas"),
              onTap:(){
                setState(() {
                  screen = thirdScreen;
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),*/
      body: _children[_currentIndex]
    );
  }
}
