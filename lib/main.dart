import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo"),

        ),
        body: Scaffold(
          body: DemoInheritedWidget(
            child: MyContainer(
              child:Counter() ,
            ),
          ),
        ),
      ),
    );
  }
}


//demo2

class MyContainer extends StatefulWidget {
  Widget child;

  MyContainer({this.child});

  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  int data=0;
  increment(){
    setState(() {
      data++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DemoInheritedWidget(
      state: this,
      child: widget.child,
    );
  }
}


class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
 
  @override
  Widget build(BuildContext context) {
     DemoInheritedWidget demo= 
     context.inheritFromWidgetOfExactType(DemoInheritedWidget);
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(demo.state.data.toString()),
            RaisedButton(
              onPressed: (){
                demo.state.increment();
              },
              child: Text("click"),
            )
          ],
        ),
      ),
    );
  }
}


class DemoInheritedWidget extends InheritedWidget{

  Widget child;
  _MyContainerState state;
  DemoInheritedWidget({this.state, this.child});

  @override 
  bool updateShouldNotify(DemoInheritedWidget old){
    return true; 
  }
}