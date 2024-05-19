import 'package:flutter/material.dart';
import 'package:phen/pages/order_page.dart';
import 'package:phen/pages/barber_shop_page.dart';
import 'package:phen/pages/spec_list.dart';
import 'package:phen/pages/setting_page.dart';

class BarberShopTab extends StatefulWidget {
  @override
  _BarberShopTabState createState() => _BarberShopTabState();
}

class _BarberShopTabState extends State<BarberShopTab> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animateArrow() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            'под феном',
            style: TextStyle(fontSize: 30, wordSpacing: 2, letterSpacing: 3),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation.value * 0.5 * 3.14,
                    child: Icon(Icons.settings),
                  );
                },
              ),
              onPressed: () {
                _animateArrow();
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) => SettingsPage(),
                    transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.calendar_today)),
              Tab(icon: Icon(Icons.people)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BarberShop(),
            OrderPage(),
            SpecList(),
          ],
        ),
      ),
    );
  }
}