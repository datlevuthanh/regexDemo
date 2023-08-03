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
  // định dạng tên
  final String regex_fullname = r"^[A-Za-z]+( [A-Za-z]+)*$";
  late final RegExp fullnameRegex = RegExp(regex_fullname);
  final TextEditingController inputFullname = TextEditingController();
  // định dạng phone number
  final String regex_phone =r"^0[981]{1}\d{8}$";
  late final RegExp phoneRegex = RegExp(regex_phone);
  final TextEditingController inputPhoneNumber = TextEditingController();

// định dạng email
  final String regex = r'^[A-Za-z0-9]+@[A-Za-z0-9]+\.(com|COM|org|ORG|edu|EDU)$';
// tạo một đối tượng Match và truyền vào biến regex(kiểu String) định dạng email
 late final RegExp emailRegex = RegExp(regex);
 final TextEditingController inputEmail = TextEditingController();
 List <String> email_found = [];

 void findEmail(){
   // Gọi phương thức allMatches() để tìm kiếm các khớp trong văn bản
   Iterable<Match> matches = emailRegex.allMatches(inputEmail.text.trim());
   email_found.clear();

   setState(() {
     email_found = matches.map((match) => match.group(0)!).toList();
   });
 }

 void confirmInformation(){
   String email = inputEmail.text.trim();
   //nếu email input đúng định dạng
   if(emailRegex.hasMatch(email)
       && phoneRegex.hasMatch(inputPhoneNumber.text)
       && fullnameRegex.hasMatch(inputFullname.text)
       ){
     print('email hợp lệ');
     Navigator.push(context, MaterialPageRoute(builder:(context)=>nextSreen()));
   // nếu k đúng
   }else{
     //if(!emailRegex.hasMatch(email))

       final snackbar = SnackBar(
       content: Text("Wrong in put information"),
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
            Expanded(
              child: ListView.builder(
                itemCount: email_found.length,
                itemBuilder: (context, index) {
                  return Text(email_found[index]);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                maxLines: null,
                maxLength: null,
                controller: inputFullname,
                //keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter your Name',

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
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                maxLines: null,
                maxLength: null,
                controller: inputPhoneNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter your phone Number',

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

            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                maxLines: null,
                maxLength: null,
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

            ElevatedButton(onPressed: confirmInformation, child: Text('Sign Up')),
            ElevatedButton(onPressed:findEmail, child: Text('find email')),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    inputEmail.dispose();
    super.dispose();
  }
}


