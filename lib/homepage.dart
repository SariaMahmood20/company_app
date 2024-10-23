import 'package:deutics_attendance_app/features/user/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:deutics_attendance_app/features/auth/data/services/register_user_service.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final RegisterUserService _registerUserService = RegisterUserService();
  @override
  Widget build(BuildContext context) {
    return buildUI();
  }

  Widget buildUI(){
    return Scaffold(
      body: Column(
        children: [
          _messagesListView()
        ],
      )
    );
  }

  Widget _messagesListView (){
    return SizedBox(
      height: MediaQuery.sizeOf(context).height*0.8,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
        stream: _registerUserService.getUser(),
        builder: (context, snapshot){
          List users = snapshot.data?.docs?? [];
          if(users.isEmpty){
            return Center(
              child: Text(
                "Enter a new user"
              ),
            );
          }
          print(users);
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index){
                UserModel user = users[index].data();
                return ListTile(
                 title: Text(user.designation),
                 subtitle: Text(user.email),
                );
              }
              ,
            ),
          );
        },
      ),
    );
  }
}