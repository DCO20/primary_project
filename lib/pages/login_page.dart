import 'package:flutter/material.dart';
import 'package:primary_project/components/login/custom_login_buttom_component.dart';
import 'package:primary_project/controllers/login_controller.dart';
import 'package:primary_project/widgets/custom_text_field_widget.dart';

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
            Image.network(
                height: 100, 'https://img.icons8.com/color/452/flutter.png'),
            const SizedBox(height: 20),
            CustomTextFielWidget(
                label: 'Email', onChanged: _controller.setEmail),
            const SizedBox(height: 15),
            CustomTextFielWidget(
              label: 'Senha',
              onChanged: _controller.setPass,
              obscureText: true,
            ),
            SizedBox(height: 15),
            CustomLoginButtomComponent(
              loginController: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
