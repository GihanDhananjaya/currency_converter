// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../core/service/dependency_injection.dart' as di;
// import 'app/currency_convert_app.dart';
// import 'core/configurations/app_config.dart';
// import 'features/presentation/views/currency/currency_convert_view.dart';
// import 'utils/app_colors.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await di.setupLocator();
//
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     systemNavigationBarColor: AppColors.colorPrimary,
//     statusBarColor: AppColors.colorPrimary,
//   ));
//
//   runApp(
//     CurrencyConverterApp(),
//   );
// }





import 'package:currency_converter/widget/drop_down.dart';
import 'package:flutter/material.dart';

import 'features/presentation/views/splash/splash_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashView(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String>? currencies;
  String? from;
  String? to;

  double? rate;
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Currency Convertor"),

         SizedBox(height: 10,),

          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
            ),
          ),
          SizedBox(height: 20,),

          // Row(
          //   children: [
          //       customDropDown(currencies!, from, (from) {
          //
          //       })
          //   ],
          // )
        ],
      ),
    );
  }
}

