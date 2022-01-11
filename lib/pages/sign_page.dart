import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'login_page.dart';

class SignPage extends StatefulWidget {
  static const String id="sign_page";

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {

  final _forKey=GlobalKey<FormState>();
  String? _password,_email;

  Future<void> secureScreen() async{
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secureScreen();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  _doSignIn(){
    if(_forKey.currentState!.validate()){
      _forKey.currentState!.save();

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginPage(message: "You are Successfully Signed In!!!")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Instagram"),
      ),
      body: Form(
        key: _forKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Instagram",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                /// #Name
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Name"),
                    validator: (input) => !input!.contains(RegExp(r"^([a-z]+)$")) ? "Bunday Ism Yo'q": null,
                    onSaved: (input) => _email = input,
                  ),
                ),
                /// #Email
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.mail_outline)
                    ),
                    validator: (input) => !input!.contains(RegExp(r"^([\w\.]+@[a-z]+\.[a-z]+)$")) ? "Bunday Login Yo'q": null,
                    onSaved: (input) => _email = input,
                  ),
                ),
                /// #Password
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (input) => input!.length < 6 ? "Bunday parol mavjud emas": null,
                    onSaved: (input) => _password = input,
                  ),
                ),
                /// #Sign Up
                Padding(
                  padding: EdgeInsets.all(30),
                  child: MaterialButton(
                    minWidth: 300,
                    onPressed: _doSignIn, child: Text("Sign Up",style: TextStyle(color: Colors.white),),color: Colors.blue,),
                ),
                /// #Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 15,),
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text("Log in",style: TextStyle(fontWeight: FontWeight.bold),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}