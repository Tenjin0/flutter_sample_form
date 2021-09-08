import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String name = "";

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scafffoldkey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scafffoldkey,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFffffff),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Text("Here to Get",
                  style: TextStyle(fontSize: 30, color: Color(0xFF363f93))),
              SizedBox(
                height: height * 0.04,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Enter your name"),
                validator: (value) {
                  if (value!.isEmpty ||
                      RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Enter correct name";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.04,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Enter your email"),
                validator: (value) {
                  if (value!.isEmpty ||
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                          .hasMatch(value)) {
                    return "Enter correct mail";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.04,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Enter your phone number"),
                validator: (value) {
                  if (value!.isEmpty ||
                      RegExp(r'^[+]?[(]{0,1}[0-9]{1,4}[)]{0,1}[\w]+$')
                          .hasMatch(value)) {
                    return "Enter correct phone number";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sign up",
                      style: TextStyle(fontSize: 22, color: Color(0xFF363f93))),
                  NeumorphicButton(
                    margin: EdgeInsets.only(top: 12),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final snackBar =
                            SnackBar(content: Text("Submitting form"));
                        _scafffoldkey.currentState!.showSnackBar(snackBar);
                      }
                    },
                    style: NeumorphicStyle(
                      color: Color(0xFF363f93),
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.circle(),
                      border: NeumorphicBorder(
                        isEnabled: false,
                        color: Color(0x33000000),
                        width: 0.8,
                      ),
                    ),
                    child: Icon(Icons.arrow_right, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
