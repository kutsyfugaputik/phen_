import 'package:flutter/material.dart';
import 'package:phen/models/specialist.dart';
import 'package:provider/provider.dart';

import '../themes/settings.dart';

class MySpecList extends StatelessWidget {
  final Specialist specialist;
  const MySpecList({super.key, required this.specialist});

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
              child: Icon(Icons.filter_vintage, size: 100,),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(100)
              ),
              width: 150,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(50),
            ),
            SizedBox(height: 10),
            Text(
              specialist.firstName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 24.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              specialist.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 24.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              specialist.fatherName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 24.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Стаж: ' + specialist.stage.toString() + ' год/лет',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
            ),
            SizedBox(height: 25),
            Text(
              specialist.info,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 14.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
            ),
            Text(
            'Примеры работ мастера:',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 20.0,
                fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
              ),
            ),
            SizedBox(height: 20),
            if (specialist.imgs.isNotEmpty) buildImageRow(context),
          ],
        ),
      ),
    );
  }

  Widget buildImageRow(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: specialist.imgs.map((img) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      padding: EdgeInsets.all(25),
                      child: Image.asset('assets/works/$img'+'.jpg'),
                    ),
                  );
                },
              );
            },
            child: Container(
margin: EdgeInsets.all(5),
              child: Image.asset(
                'assets/works/$img'+'.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}