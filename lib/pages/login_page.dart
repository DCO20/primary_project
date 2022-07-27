import 'package:flutter/material.dart';
import 'package:primary_project/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController _controller = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.class_outlined, size: 89),
            TextField(
              decoration: InputDecoration(
                label: Text('Email'),
              ),
              onChanged: _controller.setEmail,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Senha'),
              ),
              obscureText: true,
              onChanged: _controller.setPass,
            ),
            SizedBox(height: 15),
            ValueListenableBuilder<bool>(
              valueListenable: _controller.inLoader,
              builder: (_, inLoader, __) => inLoader
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _controller.auth().then((result) {
                          if (result) {
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Credencias Inválida'),
                                duration: Duration(seconds: 5),
                              ),
                            );
                          }
                        });
                      },
                      child: Text('Login'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
