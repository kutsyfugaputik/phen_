import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:phen/components/my_button.dart';
import 'package:flutter/animation.dart';
import 'package:provider/provider.dart';
import '../themes/settings.dart';
import 'log.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _flowerIndex = 0; // Индекс текущего цветка
  List<String> _flowers = [
    'assets/flower_1.png',
    'assets/flower_2.png',
    'assets/flower_3.png',
  ]; // Список путей к изображениям цветков

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
    _animation = Tween(begin: 0.0, end: 2 * 3.14).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeFlower() {
    setState(() {
      _flowerIndex = (_flowerIndex + 1) % _flowers.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Анимированное изображение цветка с обработчиком нажатия
            GestureDetector(
              onTap: _changeFlower,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary, // Желаемый цвет
                      BlendMode.modulate,
                    ),
                    child: Transform.rotate(
                      angle: _animation.value,
                      child: child,
                    ),
                  );
                },
                child: Image.asset(
                  _flowers[_flowerIndex],
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "п о д   ф е н о м",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 24.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Мы заботимся о ваших волосах!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 12.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
            ),
            const SizedBox(height: 25),
            // Кнопка для перехода на следующий экран
            MyButton(
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) => LoginPage(), 
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}