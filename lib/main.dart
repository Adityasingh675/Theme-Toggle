import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(),
    );
  }

  Widget HomePage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Theme Demo."),
      ),
      body: Center(
        child: Text("Hello Flutter"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Theme"),
              trailing: Switch(
                value: darkThemeEnabled,
                onChanged: (changed) {
                  setState(() {
                    darkThemeEnabled = changed;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: bloc.darkThemeEnabled,
//       initialData: false,
//       builder: (context, snapshot) {
//         return MaterialApp(
//           theme: snapshot.data ? ThemeData.dark() :ThemeData.light(),
//           home: HomePage(),
//         );
//       }
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   bool darkThemeEnabled;
//   HomePage({this.darkThemeEnabled});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dynamic Theme Demo."),
//       ),
//       body: Center(
//         child: Text("Hello Flutter"),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             ListTile(
//               title: Text("Theme"),
//               trailing: Switch(
//                 value: darkThemeEnabled,
//                 onChanged: bloc.changeTheme,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class Bloc {
//   final _themeController = StreamController<bool>();
//   get changeTheme => _themeController.sink.add;
//   get darkThemeEnabled => _themeController.stream;
// }
//
// final bloc = Bloc();