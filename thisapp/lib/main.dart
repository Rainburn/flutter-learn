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
      ),
      home: MyHomePage(title: 'This APP'),
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

  bool _isObscureTurnOn = true;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  void _doNothing() {

  }

  void _toggleObscure() {
    setState(() {
      _isObscureTurnOn = !_isObscureTurnOn;
    });
  }

  Widget _buildPage() {
    return Container(child: ListView(
      children: [

        // Back Button
        Row(
          children: [

            Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: OutlinedButton.icon(
                        onPressed: _doNothing,
                        label: Text("Back"),
                        icon: Icon(Icons.arrow_back_ios_rounded),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue),
                  ),
                ),
            ),

          ],
        ),


        // This Icon
        Center(
          child: Icon(Icons.build_circle, size: 250,),
        ),

        // Form login
        Center(
          child: Container(
            width: 350,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _formKey,
                child:Column(
                children: [

                  // Title
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Center(child: Text("Login to THIS",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ),

                  // username
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: TextFormField(
                          controller: usernameController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Masukkan Username";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle_rounded),
                            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                            hintText: "My Username",
                            border: OutlineInputBorder(),
                      ),

                    ),
                  ),

                  // password
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                      child: TextFormField(
                        obscureText: _isObscureTurnOn,
                        controller: passwordController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Masukkan Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: _isObscureTurnOn ? Icon(Icons.remove_red_eye) : Icon(Icons.remove_red_eye_outlined),
                            onPressed: _toggleObscure,),
                          // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                          hintText: "My Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                  ),


                  // Login Button
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                      children: [
                        Expanded(child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              
                              // Login FUNCTION here
                              _doNothing();
                              
                            }

                          },
                          child: Text("Login to THIS"),
                        )
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ),
            ),
          ),
        ),


        // Version Button
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: OutlinedButton(
              onPressed: _doNothing,
              child: Text("Version 1.0.0"),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                textStyle: TextStyle(color: Colors.blue),
                side: BorderSide(color: Colors.blue),
              ),
            ),
          ),

        ),

      ],
    )
    );
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
      body: _buildPage(),


    );
  }
}
