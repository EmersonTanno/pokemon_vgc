import 'package:flutter/material.dart';
import 'package:pokemon_vgc/app/components/login_page/button_login_page.dart';
import 'package:pokemon_vgc/app/controllers/register_user_controller.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({super.key});

  @override
  State<RegisterUserView> createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {
  String username = '';
  String email = '';
  String password = '';

  late RegisterUserController registerUserController;
  @override
  void initState(){
    super.initState();
    registerUserController = RegisterUserController();
  }

  Widget _body() {
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
                child: Image.asset('assets/images/premier_ball_logo.png'),
              ),
              Container(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 20, bottom: 12),
                  child: Column(
                    children: [
                      Text('Criar Conta:',
                      style: TextStyle(fontSize:  50),),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          username = text;
                        },
                        decoration: InputDecoration(
                          labelText: 'USERNAME',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          email = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'EMAIL',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                      SizedBox(
                        height: 15,
                      ),
                      ButtonLoginPage(text: 'Registrar', funct: () => registerUserController.registerUser(username, email, password, context)),
                       SizedBox(
                        height: 15,
                      ),
                      ButtonLoginPage(text: 'Voltar', funct: () => registerUserController.toLoginPage(context)),
                    ],
                  ),
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
            child:
                Image.asset('assets/images/background.jpg', fit: BoxFit.cover)),
        Container(
          color: Colors.black.withOpacity(0.1),
        ),
        _body(),
      ],
    ));
  }
}
