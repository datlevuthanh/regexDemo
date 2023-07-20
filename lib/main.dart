import 'package:flutter/material.dart';
import 'package:regex/nextScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// định dạng email
 final String regex = r'^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$';
// khai báo 1 biến email theo định dạng
 late final RegExp emailRegex = RegExp(regex);
 final TextEditingController inputEmail = TextEditingController();

 void confirmEmail(){
   String email = inputEmail.text.trim();
   //nếu email input đúng định dạng
   if(emailRegex.hasMatch(email)){
     print('email hợp lệ');
     Navigator.push(context, MaterialPageRoute(builder:(context)=>nextSreen()));
   // nếu k đúng
   }else{
     final snackbar = SnackBar(
         content: Text('Invalid Email'),
         duration: Duration(seconds: 3),
     );
     ScaffoldMessenger.of(context).showSnackBar(snackbar);
     print('email k hợp lệ');
   }
 }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: inputEmail,
                decoration: InputDecoration(
                  labelText: 'Enter your email',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: confirmEmail, child: Text('press'))

          ],
        ),
      ),
    );
  }
}
