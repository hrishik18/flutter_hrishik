import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/theme_button.dart';
import 'package:task/theme_provider.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool value = false;
  bool osvalue = false;
  
  // Widget darkMSwitch() => Transform.scale(
  //       scale: 2,
  //       child: Switch.adaptive(
  //         activeColor: Colors.orange,
  //         activeTrackColor: Colors.orange,
  //         inactiveThumbColor: Colors.orange,
  //         inactiveTrackColor: const Color.fromARGB(255, 205, 204, 200),
  //         value: value,
  //         onChanged: (value) {
  //           final provider = Provider.of<ThemeProvider>(context, listen: false);
  //           provider.toggleTheme(value);
  //         },
  //       ),
  //     );

  Widget osSwitch() => Transform.scale(
        scale: 2,
        child: Switch.adaptive(
          activeColor: Colors.orange,
          activeTrackColor: Colors.orange,
          inactiveThumbColor: Colors.orange,
          inactiveTrackColor: const Color.fromARGB(255, 205, 204, 200),
          value: osvalue,
          onChanged: (osvalue) => setState(() => this.osvalue = osvalue),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: ListView(
          padding: const EdgeInsets.all(5),
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    "Light Mode",
                    style: TextStyle(
                        color: Color.fromARGB(255, 141, 54, 54), fontSize: 25),
                  ),
                ),
                ChangeThemeButtonWidget()
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    "Android View",
                    style: TextStyle(
                        color: Color.fromARGB(255, 141, 54, 54), fontSize: 25),
                  ),
                ),
                osSwitch()
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16),
            ),
          ],
        ));
  }
}
