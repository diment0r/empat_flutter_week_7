import 'package:empat_flutter_week_7/state/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({super.key});

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget>
    with AutomaticKeepAliveClientMixin {
  late bool isDark;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    isDark = Provider.of<ThemeModel>(context).isDark;

    super.build(context);
    return Center(
      child: Switch(
        activeColor: Colors.white,
        activeTrackColor: Colors.green,
        value: isDark,
        onChanged: (bool value) {
          Provider.of<ThemeModel>(context, listen: false).isDark = value;
          setState(() {
            isDark = value;
          });
        },
      ),
    );
  }
}
