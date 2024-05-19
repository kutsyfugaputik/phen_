import 'package:flutter/material.dart';
import 'package:phen/themes/settings.dart';
import 'package:provider/provider.dart';
import 'package:phen/components/my_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Настройки',
            style: TextStyle(
              fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 24.0,
              fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              MyButton(
              onTap: () async {
                //для перехода на телеграмм
        await launchUrl(Uri.parse('https://web.telegram.org/k/#@pod_phenom_masha_bot'));
        },
          child: Text(
            'Связаться с ботом-консультантом',
            style: TextStyle(
              fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 12.0,
              fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Выберите тему:',
          style: TextStyle(
            fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
            fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
          ),
        ),
        SizedBox(height: 20.0),

        MyButton(
        onTap: () {
      Provider.of<SettingApp>(context, listen: false).toggleTheme();
    },
    child: Text(
    'Сменить тему',
    style: TextStyle(
    fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 12.0,
    fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
    ),
    ),
    ),
    SizedBox(height: 40.0),
    Text(
    'Выберите шрифт:',
    style: TextStyle(
    fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
    fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
    ),
    ),
    SizedBox(height: 20.0),
    DropdownButton<String>(
    value: Provider.of<SettingApp>(context).selectedFontFamily,
    //изменение по всему проекту семейства шрифта из имеющегося списка
    onChanged: (String? newValue) {
    Provider.of<SettingApp>(context, listen: false).setFontFamily(newValue!);
    },
    items: SettingApp.availableFontFamilies.map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(
    value,
    style: TextStyle(fontFamily: value),
    ),
    );
    }).toList(),
    ),
    SizedBox(height: 40.0),
    Text(
    'Выберите размер шрифта:',
    style: TextStyle(
    fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 18.0,
    fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,
    ),
    ),
    SizedBox(height: 20.0),
    Slider(
    value: Provider.of<SettingApp>(context).fontSizeMultiplier,
    min: 0.5,
    max: 2.0,
    divisions: 15,
    //для изменения по всему проекта размера шрифта
    onChanged: (double value) {
    Provider.of<SettingApp>(context, listen: false).setFontSizeMultiplier(value);
    },
    ),
    ],
    ),
    ),
    );
  }
}