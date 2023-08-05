import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Core/providers/theme_provider.dart';

class TestTheme extends StatelessWidget {
  const TestTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Title",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          SwitchListTile(
              title: themeProvider.getIsDarkTheme
                  ? const Text('Dark Theme')
                  : const Text('Light Theme'),
              value: themeProvider.getIsDarkTheme,
              onChanged: (value) {
                themeProvider.setIsDarkTheme(themeValue: value);
              })
        ],
      ),
    );
  }
}
