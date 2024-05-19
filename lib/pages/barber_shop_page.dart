import 'package:flutter/material.dart'; 
import 'package:phen/components/my_service_list.dart'; 
import 'package:phen/models/service.dart'; 
import 'package:phen/themes/settings.dart'; 
import 'package:provider/provider.dart'; 

class BarberShop extends StatelessWidget { 
  BarberShop({Key? key}); 
  
  @override 
  Widget build(BuildContext context) { 
    final List<Service> serviceList = servs; // Получаем список услуг

    return Scaffold( 
      appBar: AppBar( 
        backgroundColor: Theme.of(context).colorScheme.secondary, 
        elevation: 0, 
        automaticallyImplyLeading: false, 
        title: Text(
          'Прайс-лист', 
          style: TextStyle(  
            fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 24.0, 
            fontFamily: Provider.of<SettingApp>(context).selectedFontFamily
          ), 
          textAlign: TextAlign.center
        ), 
        centerTitle: true, 
      ), 
      backgroundColor: Theme.of(context).colorScheme.background, 
      body: Column( 
        children:<Widget>[ 
          Center( 
            child: Text(
              'Выберите вам нужную услугу!', 
              style: TextStyle(  
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 14.0, 
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily
              ),
            ),
          ), 
          Expanded ( 
            child: ListView.builder( 
              itemCount: serviceList.length, 
              scrollDirection: Axis.vertical, 
              itemBuilder: (context, index) { 
                final service = serviceList[index]; 
                return MyServList(service: service); 
              } 
            ), 
          ), 
        ] 
      ), 
    ); 
  } 
}