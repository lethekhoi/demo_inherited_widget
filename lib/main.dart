

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
            child: OngBa(),
          ),
        ),
      ),
    );
  }
}


//demo1
class DemoInheritedWidget extends InheritedWidget{

  int count= 1010;
  DemoInheritedWidget({Widget child}) :super(child:child);

  @override 
  bool updateShouldNotify(DemoInheritedWidget old){
    return true; 
  }
}


class OngBa extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChaMe(),
    );
  }
}
class ChaMe extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConGai(),
    );
  }
}


class ConGai extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    DemoInheritedWidget demo= 
    context.inheritFromWidgetOfExactType(DemoInheritedWidget);
    return Container(
      child: Text(demo.count.toString()),
    );
  }
}