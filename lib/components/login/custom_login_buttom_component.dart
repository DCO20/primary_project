import 'package:flutter/material.dart';
import 'package:primary_project/controllers/login_controller.dart';

class CustomLoginButtomComponent extends StatelessWidget {
  final LoginController loginController;

  const CustomLoginButtomComponent({Key? key, required this.loginController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.inLoader,
      builder: (_, inLoader, __) => inLoader
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                loginController.auth().then((result) {
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
              child: Text('Entrar'),
            ),
    );
  }
}
