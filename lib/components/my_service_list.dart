import 'package:flutter/material.dart';
import 'package:phen/components/my_button.dart';
import 'package:phen/models/order.dart';
import 'package:phen/models/service.dart';
import 'package:phen/themes/settings.dart';
import 'package:provider/provider.dart';

class MyServList extends StatelessWidget {
  final Service service;

  MyServList({Key? key, required this.service}) : super(key: key);
//для отслеживания даты и времени выбранным клиентом
   DateTime _selectedDate = DateTime.now(); 
  TimeOfDay _selectedTime = TimeOfDay.now(); 

  void _selectDateAndTime(BuildContext context) async { 
    DateTime? pickedDate; 
    TimeOfDay? pickedTime; 
//вызываем виджет Календаря
    pickedDate = await showDatePicker( 
      context: context, 
      initialDate: _selectedDate, 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2100), 
    ); 
//вызываем виджет Часов
    if (pickedDate != null) { 
      pickedTime = await showTimePicker( 
        context: context, 
        initialTime: _selectedTime, 
      ); 
    } 

    if (pickedDate != null && pickedTime != null) { 
      _selectedDate = pickedDate; 
      _selectedTime = pickedTime; 

      // Показываем всплывающее сообщение с выбранным временем 
      ScaffoldMessenger.of(context).showSnackBar( 
        SnackBar( 
          content: Text( 
            'Вы выбрали дату и время:${_selectedDate.day}.${_selectedDate.month}.${_selectedDate.year}, ${_selectedTime.format(context)}',
            style: TextStyle( 
              fontSize: Provider.of<SettingApp>(context, listen: false).fontSizeMultiplier * 18.0, 
              fontFamily: Provider.of<SettingApp>(context, listen: false).selectedFontFamily,
              color:  Theme.of(context).colorScheme.primary
            ), 
          ), 
          duration: Duration(seconds: 3), 
        ), 
      ); 
    } 
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          children: [
            Container(
              child: Image.asset(service.imagePath),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(160),
              ),
              width: 200,
              padding: const EdgeInsets.all(15),
            ),
            SizedBox(height: 10),
            Text(service.name_ser,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:
                  Provider.of<SettingApp>(context).fontSizeMultiplier *
                      24.0,
                  fontFamily:
                  Provider.of<SettingApp>(context).selectedFontFamily,
                ),
                textAlign: TextAlign.center),
            Text(
              'Продолжительность: ' + service.time.toString() + ' час',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize:
                Provider.of<SettingApp>(context).fontSizeMultiplier * 14.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
            ),
            Text(
              'Цена: ' + service.price.toString() + 'руб',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize:
                Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
            ),
            MyButton(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Давайте создадим вашу запись!'),
                    content: MyButton(
                      onTap: () => _selectDateAndTime(context),
                      child: Text(
                        'Нажмите сюда для выбора удобного времени для вашей записи.',
                        style: TextStyle(
                          fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
                          fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      MyButton(
                        onTap: () async {
                          final order_new = Order(
                            idService: service.id,
                            time: _selectedTime.format(context),
                            userId: SettingApp.user_id.id,
                            date: _selectedDate,
                          );

                          // Сохраняем запись
                          await SettingApp.isar.writeTxn(() async {
                            await SettingApp.isar.orders.put(order_new);
                          });

                          Navigator.of(context, rootNavigator: true).pop();

                          // Показываем всплывающее сообщение с выбранным временем
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Вы выбрали время: ${_selectedTime.format(context)}',
                                style: TextStyle(
                                  fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
                                  fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
                                ),
                              ),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        },
                        child: Text(
                          'Ок',
                          style: TextStyle(
                            fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
                            fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Theme.of(context).colorScheme.secondary),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_rounded,
                      size: 50,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Записаться',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
