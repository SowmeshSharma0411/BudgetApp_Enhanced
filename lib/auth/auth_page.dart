import 'package:budgetapp/pages/login_page.dart';
import 'package:budgetapp/pages/register_page.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //inititally show login page.
  bool showloginpage = true;

  void toggleScreens() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return LoginPage(
        showRegisterPage: toggleScreens,
      );
    } else
      return RegisterPage(
        showLoginPage: toggleScreens,
      );
  }
}
