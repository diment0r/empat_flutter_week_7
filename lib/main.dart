import 'package:empat_flutter_week_7/state/theme_model.dart';
import 'package:empat_flutter_week_7/utils/theme.dart';
import 'package:empat_flutter_week_7/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    bool isDark = prefs.getBool('isDarkMode') ?? false;
    runApp(MyApp(
      isDark: isDark,
    ));
  });
}

class MyApp extends StatelessWidget {
  bool isDark;

  MyApp({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeModel(isDark: isDark),
      builder: (context, child) => MaterialApp(
        theme: Provider.of<ThemeModel>(context).isDark
            ? ThemeDesignData.darkTheme
            : ThemeDesignData.lightTheme,
        home: const AppNavigationWidget(),
      ),
    );
  }
}
