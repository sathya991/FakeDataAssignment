import 'package:fakelegends/constants/string_constants.dart';
import 'package:fakelegends/constants/style_constants.dart';
import 'package:fakelegends/models/user_model.dart';
import 'package:fakelegends/providers/user_list_provider.dart';
import 'package:fakelegends/screens/user_profile.dart';
import 'package:fakelegends/widgets/user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListDisplay extends StatefulWidget {
  const UserListDisplay({super.key});

  @override
  State<UserListDisplay> createState() => _UserListDisplayState();
}

class _UserListDisplayState extends State<UserListDisplay> {
  //Declaring scroll controller to use in listview builder
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
    //Using provider to hit the api for data and maintain page index
    UserListProvider userListProvider =
        Provider.of<UserListProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userListProvider.getData(index: userListProvider.getIndex);
    });
    //This checks whether the scroll hit the end of screen
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        userListProvider.incrementIndex();
        userListProvider.getData(index: userListProvider.getIndex);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants().heading),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              //Adding gradient style for the background
              colors: [StyleConstants().color, Colors.white],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        //Using Consumer to access data from the provider and maintain state changes
        child: Consumer<UserListProvider>(builder: (context, users, child) {
          return ListView.builder(
              controller: controller,
              itemCount: users.userDataList.length + 1,
              itemBuilder: (context, index) {
                if (index < users.userDataList.length) {
                  //checks if current index being loaded is less than the elements available in local state list
                  Datum userIndexData = users.userDataList[index];
                  return GestureDetector(
                    //Navigates to new profile page when clicked
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => UserProfile(
                                userData: userIndexData,
                              )));
                    },
                    child: UserCard(
                      //Displays user details card
                      userData: userIndexData,
                    ),
                  );
                } else {
                  //Checks if user has more data if not displays no more data to load
                  return users.noMoreData
                      ? Text(
                          StringConstants().noMoreData,
                          textAlign: TextAlign.center,
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                }
              });
        }),
      ),
    );
  }
}
