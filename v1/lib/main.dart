import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/app_provider.dart';
import 'providers/game_provider.dart';
import 'screens/home_screen.dart';

ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  // primaryColor: Colors.red[600],
  primaryColor: Colors.amber,
  accentColor: Colors.grey,
);

ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Colors.amber,
  accentColor: Colors.grey,
);

void main() {
  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Image _image;
//   GlobalKey _globalKey = new GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     // _callRepaintBoundaryToImage() async {
//     //   // Image img = await WidgetToImage.repaintBoundaryToImage(_globalKey);
//     //   Image img = await WidgetToImage.widgetToImage(Container(
//     //     color: Colors.blue,
//     //     height: 100,
//     //     width: 100,
//     //   ));
//     //   setState(() {
//     //     imagem = img;
//     //   });
//     // }

//     _callRepaintBoundaryToImage() async {
//       Image byteData = await WidgetToImage.repaintBoundaryToImage(this._globalKey);
//       setState(() {
//         _image = byteData;
//       });
//     }

//     // _callWidgetToImage() async {
//     //   Image byteData = await WidgetToImage.widgetToImage(Container(
//     //     width: 100,
//     //     height: 100,
//     //     color: Colors.blue,
//     //   ));
//     //   setState(() => _image = byteData);
//     // }

//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               key: _globalKey,
//               child: RepaintBoundary(
//                 child: Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text("Olá"),
//                       RaisedButton.icon(
//                         icon: Icon(Icons.ac_unit_outlined),
//                         onPressed: null,
//                         label: Text("Botão"),
//                       ),
//                       Text("Olá"),
//                       Text("Olá"),
//                       Text("Olá"),
//                       Text("Olá"),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Divider(thickness: 5),
//             Expanded(
//               child: RepaintBoundary(
//                 child: Scaffold(
//                     body: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       RaisedButton(
//                         onPressed: _callRepaintBoundaryToImage,
//                         child: Text('Gerar imagem'),
//                       ),
//                       _image != null
//                           ? Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(25.0),
//                                 child: Container(
//                                   decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//                                   child: _image,
//                                 ),
//                               ),
//                             )
//                           : Container()
//                     ],
//                   ),
//                 )),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GameProvider(),
        ),
      ],
      child: Consumer<AppProvider>(
        builder: (ctx, appProvider, _) => MaterialApp(
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode: appProvider.lightTheme ? ThemeMode.light : ThemeMode.dark,
          title: "Alhambra",
          home: HomeScreen(),
        ),
      ),
    );
  }
}
