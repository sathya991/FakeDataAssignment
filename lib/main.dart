import 'package:fakelegends/providers/user_list_provider.dart';
import 'package:fakelegends/screens/user_list_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserListProvider()),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              title: 'Fake Legends',
              theme: ThemeData(
                  primarySwatch: Colors.pink,
                  textTheme: TextTheme(
                      bodyMedium: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w400))),
              home: const UserListDisplay(),
            );
          },
        ));
  }
}
