import 'package:fakelegends/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.imageUrl});
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;

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
                imageUrl,
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
                  Text(firstName),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Text(
                    "Last Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(lastName),
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
                      email,
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
