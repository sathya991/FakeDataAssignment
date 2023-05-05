import 'package:fakelegends/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

class UserProfile extends StatelessWidget {
  const UserProfile(
      {super.key,
      required this.firstName,
      required this.email,
      required this.lastName,
      required this.imageUrl});
  final String firstName;
  final String email;
  final String lastName;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Data"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 18.h, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 10.h,
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                firstName,
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(lastName),
              SizedBox(
                height: 3.h,
              ),
              Text(email)
            ],
          ),
        ),
      ),
    );
  }
}
