import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:phen/components/my_spec_list.dart';

import 'package:phen/models/specialist.dart';
import 'package:phen/models/user.dart';
import 'package:phen/themes/settings.dart';
import 'package:provider/provider.dart';

class SpecList extends StatelessWidget {

  SpecList({super.key});
  final spec = specs;
final user = SettingApp.user_id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        automaticallyImplyLeading: false,
        elevation: 0,

        title: Text('Специалисты', style: TextStyle(  fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 24.0,
          fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,),
            textAlign: TextAlign.center),
        centerTitle: true,
      ),

      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: <Widget>[
        Center(
          child: Text(
            'Информация о наших мастерах',
            style: TextStyle(  fontSize: Provider.of<SettingApp>(context).fontSizeMultiplier * 14.0,
              fontFamily: Provider.of<SettingApp>(context).selectedFontFamily,),
          ),
        ),

        Expanded(
          child: ListView.builder(
              itemCount: spec.length,
              itemBuilder: (context, index) {
                final ser = specs[index];
                return MySpecList(specialist: ser);
              }),
        ),
      ]),
    );
  }
}
