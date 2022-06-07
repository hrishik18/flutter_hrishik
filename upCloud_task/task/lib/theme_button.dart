import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/theme_provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Transform.scale(
      scale: 2,
      child: Switch.adaptive(
        value: themeProvider.isDarkMode,
        activeColor: Colors.orange,
        activeTrackColor: Colors.orange,
        inactiveThumbColor: Colors.orange,
        inactiveTrackColor: const Color.fromARGB(255, 205, 204, 200),
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
        },
      ),
    );
  }
}
