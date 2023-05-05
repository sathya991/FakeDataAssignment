import 'package:fakelegends/constants/style_constants.dart';
import 'package:fakelegends/providers/user_list_provider.dart';
import 'package:fakelegends/screens/user_list_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'constants/string_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //Added Provider (helps in maintaining state)
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserListProvider()),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              title: StringConstants().heading,
              theme: ThemeData(
                primarySwatch: Colors.pink,
                //Setting global text theme
                textTheme: TextTheme(
                  bodyMedium: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              home: const UserListDisplay(),
            );
          },
        ));
  }
}
