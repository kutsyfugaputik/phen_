import 'package:flutter/material.dart';
import 'package:phen/components/my_button.dart';
import 'package:phen/models/order.dart';
import 'package:phen/models/service.dart';
import 'package:provider/provider.dart';

import '../models/specialist.dart';
import '../themes/settings.dart';

class MyOrderList extends StatelessWidget {
  final Order order;

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _selectDateAndTime(BuildContext context) async {
    DateTime? pickedDate;
    TimeOfDay? pickedTime;

    pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
      );
    }

    if (pickedDate != null && pickedTime != null) {
      _selectedDate = pickedDate!;
      _selectedTime = pickedTime!;
    }
  }



   MyOrderList({super.key, required this.order});
    Service get ser => servs[order.idService-1];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(25),
      child: Center(
        child: Column(
          children: [
            Container(
              child: Icon(Icons.favorite),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(30)),
              width: 150,
              padding: const EdgeInsets.all(30),
            ),
            SizedBox(height: 10),
            Text(
              ser.name_ser,
              style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
            ),
            Text(
              'Продолжительность: ' + ser.time.toString() + ' час',
              style: TextStyle(
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Text(
              order.date.toString().substring(0,11),
              style: TextStyle(

                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
            ),
            Text(
              order.time,
              style: TextStyle(

                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
            ),
            Text(
              "Ваш мастер: " +specs[servs[order.idService].id_specialis].firstName+" "+specs[servs[order.idService].id_specialis].name+" "+specs[servs[order.idService].id_specialis].fatherName,
              style: TextStyle(

                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




