import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';
import 'package:test/resource/google_sign_in.dart';
import 'package:test/view/background_image.dart';

import 'home.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();

}
class _LoginState extends State<Login> {

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  var _usernameError="Username is wrong";
  var _passwordError="Password is wrong";
  var _userInvalid=false;
  var _passInvalid=false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
                padding: EdgeInsets.fromLTRB(30, 0, 50, 0),
                constraints: BoxConstraints.expand(),
                color: Colors.white24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Container(
                          width: 70,
                          height: 70,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Colors.black, Colors.grey],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                            ),
                          ),
                          child: Image.asset('assets/person-icon.png')
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Text("Hello,\nWelcome back", style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30,
                        fontFamily: "Times New Roman",
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextField(
                        controller: _usernameController,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: "USERNAME",
                          errorText: _userInvalid ? _usernameError:null,
                          labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: <Widget>[
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            style: TextStyle(fontSize: 25, color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              labelText: "PASSWORD",
                              errorText: _passInvalid?_passwordError:null,
                              labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          // Text("SHOW", style: TextStyle(fontSize: 15, color: Colors.black87, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: RaisedButton(
                              color: Colors.white54,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))),
                              onPressed: (){
                                /*context.read<AuthenticationService>().signIn(
                                email: _usernameController.text.trim(),
                                password: _passwordController.text.trim(),*/
                                onSignInClick();
                              },
                              child: Text("SIGN IN",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.grey[900]),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: GoogleSignInButton(),
                        ),
                      ],
                    ),
                    Container(
                      height: 130,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Forgot Password?",
                            style: TextStyle(fontSize: 15, color: Colors.black87),),
                          Text("@CopyRightsByTeam04",
                            style: TextStyle(fontSize: 15, color: Colors.black87),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ],
    );

  }

  void onSignInClick() {
    setState(() {
      if(_usernameController.text.isEmpty || !_usernameController.text.contains("@gmail.com"))
        {
          _userInvalid=true;
        }else
          {
            _userInvalid=false;
          }
      if(_passwordController.text.isEmpty)
        {
          _passInvalid=true;
        }else
          {
            _passInvalid=false;
          }
      if(!_userInvalid && !_passInvalid)
        {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => HomePage()));
        }
    });
  }
}
class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: OutlinedButton.icon(
          label: Text(
            'SIGN IN WITH GOOGLE',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
          ),
          icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
          onPressed: () {
            final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
        ),
      ),
    );
  }
}
