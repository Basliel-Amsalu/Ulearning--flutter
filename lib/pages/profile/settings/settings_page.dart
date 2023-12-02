import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_states.dart';
import 'package:ulearning/pages/profile/settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar(),
        body: SingleChildScrollView(child:
            BlocBuilder<SettingsBlocs, SettingStates>(
                builder: (context, state) {
          return Container(
            child: const Column(
              children: [Text("HELLO")],
            ),
          );
        })));
  }
}
