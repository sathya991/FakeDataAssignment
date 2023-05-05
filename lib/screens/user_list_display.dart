import 'package:fakelegends/constants/style_constants.dart';
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
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
    UserListProvider userListProvider =
        Provider.of<UserListProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userListProvider.getData(index: userListProvider.getIndex);
    });

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
        title: const Text("Fake Legends"),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [StyleConstants().color, Colors.white],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Consumer<UserListProvider>(builder: (context, users, child) {
          return ListView.builder(
              controller: controller,
              itemCount: users.userDataList.length + 1,
              itemBuilder: (context, index) {
                if (index < users.userDataList.length) {
                  String firstName = users.userDataList[index].firstName;
                  String lastName = users.userDataList[index].lastName;
                  String email = users.userDataList[index].email;
                  String imageUrl = users.userDataList[index].avatar;
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => UserProfile(
                                firstName: firstName,
                                lastName: lastName,
                                email: email,
                                imageUrl: imageUrl,
                              )));
                    },
                    child: UserCard(
                      firstName: firstName,
                      lastName: lastName,
                      imageUrl: imageUrl,
                      email: email,
                    ),
                  );
                } else {
                  return users.noMoreData
                      ? const Text(
                          "No More Data to load",
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
