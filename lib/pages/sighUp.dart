import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phen/components/my_button.dart';
import 'package:phen/components/my_textfield.dart';
import 'package:phen/models/user.dart';
import 'package:isar/isar.dart';
import 'package:phen/themes/settings.dart';
import 'package:provider/provider.dart';

import 'log.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _showFirstFields = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_showFirstFields) ...[
                const Icon(Icons.face,size: 150,
        ),              const SizedBox(height: 5),
          // welcome back, you've been missed!
          Text(                'Введите ваше ФИО:',
            style: TextStyle(                  color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 14.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily             ), textAlign: TextAlign.center
          ),              const SizedBox(height: 5),
                // Фамилия
                MyTextField(
                  controller: lastNameController,
                  hintText: 'Фамилия',
                  obscureText: false,
                ),
                const SizedBox(height: 5),
                // Имя
                MyTextField(
                  controller: firstNameController,
                  hintText: 'Имя',
                  obscureText: false,
                ),
                const SizedBox(height: 5),
                // Отчество
                MyTextField(
                  controller: middleNameController,
                  hintText: 'Отчество',
                  obscureText: false,
                ),
                const SizedBox(height: 5),
              ],
              if (!_showFirstFields) ...[
                const Icon(Icons.face,size: 150,
                ),              const SizedBox(height: 5),
                // welcome back, you've been missed!
                Text(                'Введите вашу почту и пароль:',
                  style: TextStyle(                  color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 14.0), textAlign: TextAlign.center,
                ),              const SizedBox(height: 5),
                // Почта
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 5),
                // Пароль
                MyTextField(
                  controller: passwordController,
                  hintText: 'Пароль',
                  obscureText: true,
                ),
                const SizedBox(height: 5),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    onTap: () {
                      if (!_showFirstFields) {
                        setState(() {
                          _showFirstFields = true;
                        });
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 25),
                  MyButton(
                    onTap: () async {
                      if (_showFirstFields) {
                        setState(() {
                          _showFirstFields = false;
                        });
                      } else {
                        String lastName = lastNameController.text;
                        String firstName = firstNameController.text;
                        String middleName = middleNameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        User newUser = User()
                          ..firstName = lastName
                          ..name = firstName
                          ..fatherName = middleName
                          ..email = email
                          ..password = password;
                        await SettingApp.isar.writeTxn(() async {
                          await SettingApp.isar.users.put(newUser);
                        });
                        print(
                            'колво юзеров' + SettingApp.isar.users.count().toString());
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => LoginPage(), // Замените YourNextPage на вашу страницу
                            transitionsBuilder: (context, animation1, animation2, child) {
                              var begin = Offset(-1.0, 0.0);
                              var end = Offset.zero;
                              var curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                              var offsetAnimation = animation1.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );

                      }
                    },
                    child: _showFirstFields
                        ? const Icon(Icons.arrow_forward)
                        :  Text('Зарегистрироваться!', style: TextStyle(
                        fontSize: 24,
                        fontFamily: Provider.of<SettingApp>(context).selectedFontFamily)),
                  ),
                ],
              ),
              const SizedBox(height: 5),
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
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
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
            ],
          ),
        ),
      ),
    );
  }
}