import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/login_page/button_login_page.dart';
import 'package:pokemon_vgc/app/controllers/login_page_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late LoginPageController loginPageController;
  @override
  void initState(){
    super.initState();
    loginPageController = LoginPageController();
  }

  String username = '';
  String password = '';

  Widget _body(){
    return SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Container(
                  height: 20,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 20, bottom: 12
                    ),
                    child: Column(
                      children: [
                      TextField(
                        onChanged: (text) {
                          username = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'USERNAME',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15,),

                      ButtonLoginPage(text: 'Entrar', funct: ()=> loginPageController.login(username, password, context)),

                      SizedBox(height: 15,),

                      ButtonLoginPage(text: 'Registrar', funct: ()=> loginPageController.register(context))
                      

                    ],),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.jpg', 
              fit: BoxFit.cover)
          ),
          Container(
            color: Colors.black.withOpacity(0.1),
          ),
          _body(),
        ],
      )

    );
  }
}