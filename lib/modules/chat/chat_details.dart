import 'package:flutter/material.dart';

import '../../models/users.dart';

class ChatImage extends StatelessWidget {
  SocialUserModel model;
  ChatImage({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: 50,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
        title: Text(model.name),
      ),
      body: Center(
        child: Image(
          image: NetworkImage(model.image),
          width: double.infinity,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}