import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:phen/components/my_button.dart';
import 'package:phen/components/my_textfield.dart';
import 'package:phen/pages/sighUp.dart';
import 'package:phen/themes/settings.dart';
import 'package:provider/provider.dart';
import '../components/bardershop_tab.dart';
import '../models/user.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              const Icon(
                Icons.lock,
                size: 50,
              ),
              const SizedBox(height: 10),
              Text(
                'Добро пожаловать, войдите в свой аккаунт:',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 12.0,
                  fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              MyTextField(
                controller: usernameController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 5),
              MyTextField(
                controller: passwordController,
                hintText: 'Пароль',
                obscureText: true,
              ),
              const SizedBox(height: 5),
              MyButton(
                onTap: () async {
                  final user = await SettingApp.isar.users
                      .where()
                      .filter()
                      .emailEqualTo(usernameController.text.toString())
                      .passwordEqualTo(passwordController.text.toString())
                      .findFirst();
                  if (user != null &&
                      usernameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    SettingApp.user_id = user;
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) => BarberShopTab(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  } else {
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Ошибка',
                          style: TextStyle(
                            fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 24.0,
                            fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
                          ),
                        ),
                        content: Text(
                          'Вы не верно ввели данные!',
                          style: TextStyle(
                            fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
                            fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
                          ),
                        ),
                        actions: <Widget>[
                          MyButton(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Icon(Icons.arrow_forward),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'п о д    ф е н о м',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Нет аккаунта?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 100),
                  MyButton(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) =>SignUpPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, -1.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    ),
                    child: Text(
                      'Регистрация!',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}