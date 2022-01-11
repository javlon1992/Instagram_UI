import 'package:flutter/material.dart';
import 'package:ui_instagram/pages/sign_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  String? message;

  static String id="home_page";
  LoginPage({Key? key,this.message}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginMessage = true, isHidden = true;

  Future<void> _viewMessage() async{
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      loginMessage = false;
    });
  }
  @override
  void initState(){
    loginMessage = widget.message != null ? true : false;
    super.initState();
    _viewMessage();
  }

  final _forKey = GlobalKey<FormState>();
  String? _password,_email;
  _doSignIn(){
    if(_forKey.currentState!.validate()){
      _forKey.currentState!.save();
      Navigator.popAndPushNamed(context, HomePage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Instagram"),
      ),
      body: Stack(
        children: [
          Form(
            key: _forKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Instagram",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                    /// #Email
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.mail_outline)),
                        validator: (input) => !input!.contains(RegExp(r"^([\w\.]+@[a-z]+\.[a-z]+)$")) ? "Login kiriting!": null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    /// #Passsword
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                      child: TextFormField(
                        obscureText: isHidden,
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () { setState(() {
                                isHidden = !isHidden;
                              }); },
                              icon: Icon(isHidden ? Icons.visibility : Icons.visibility_off),)
                        ),
                        validator: (input) => input!.length < 6 ? "Password kiriting!": null,
                        onSaved: (input) => _password = input,
                      ),
                    ),
                    /// #Log In
                    Padding(
                      padding:  EdgeInsets.all(30),
                      child: MaterialButton(
                        minWidth: 300,
                        onPressed: _doSignIn, child: Text("Log In",style: TextStyle(color: Colors.white),),color: Colors.blue,),
                    ),
                    /// #Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        SizedBox(width: 15,),
                        GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, SignPage.id);
                            },
                            child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold),)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          /// #Show Message
          loginMessage ? Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 40,horizontal: 30),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black,blurRadius: 7),
                  ]
              ),
              child: Text(widget.message ?? "No come message!"),
            ),
          ) : SizedBox.shrink()
        ],
      ),
    );
  }
}