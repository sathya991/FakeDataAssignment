import 'package:fakelegends/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../models/user_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.userData,
  });
  final Datum userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: StyleConstants().color),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(1.h),
          child: Row(
            children: [
              Image.network(
                userData.avatar,
                fit: BoxFit.fitHeight,
                height: 18.h,
                width: 40.w,
              ),
              SizedBox(
                width: 7.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "First Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(userData.firstName),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Text(
                    "Last Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(userData.lastName),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.h,
                    width: 36.w,
                    child: Text(
                      userData.email,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
