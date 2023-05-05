import 'package:fakelegends/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key, required this.userData});
  final Datum userData;

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
                backgroundImage: NetworkImage(userData.avatar),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                userData.firstName,
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(userData.lastName),
              SizedBox(
                height: 3.h,
              ),
              Text(userData.email)
            ],
          ),
        ),
      ),
    );
  }
}
