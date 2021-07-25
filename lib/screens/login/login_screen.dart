import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email){
                      if(!emailValid(email))
                        return 'E-mail inválido';
                      return null;
                    },
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: passController,
                    decoration: InputDecoration(hintText: 'Senha'),
                    autocorrect: false,
                    obscureText: true,
                    validator: (pass){
                      if(pass.isEmpty || pass.length < 6)
                        return 'Senha inválida';
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: (){},
                        padding: EdgeInsets.zero,
                        child: Text(
                          'Esqueci minha senha'
                        ),
                      ),
                  ),
                  SizedBox(height: 16,),
                  SizedBox(
                    height: 44,
                    child: RaisedButton(
                      onPressed: (){
                        if(formKey.currentState.validate()){
                          context.read<UserManager>().signIn(User(
                            email: emailController.text,
                            password: passController.text
                          ));
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                        child: Text('Entrar', style: TextStyle(
                          fontSize: 18
                        ),),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
