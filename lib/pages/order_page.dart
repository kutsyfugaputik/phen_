import 'package:flutter/material.dart'; 
import 'package:phen/themes/settings.dart'; 
import 'package:isar/isar.dart'; 
import 'package:phen/components/my_order_list.dart'; 
import 'package:phen/models/order.dart'; 
import 'package:provider/provider.dart'; 
 
class OrderPage extends StatelessWidget {
  OrderPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
      future: SettingApp.isar.orders.filter().userIdEqualTo(SettingApp.user_id.id).findAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Order> orders = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Text(
                'Записи',
                style: TextStyle(
                  fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 24.0,
                  fontFamily: Provider.of<SettingApp>(context).selectedFontFamily
                ),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'Здесь вы можете просмотреть вашу запись!',
                    style: TextStyle(
                      fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 14.0,
                      fontFamily: Provider.of<SettingApp>(context).selectedFontFamily
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return MyOrderList(order: order);
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}