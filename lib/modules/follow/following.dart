import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../layout/cubit/cubit.dart';

class following extends StatelessWidget {
  const following({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userModel = SocialCubit.get(context).userModel;
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConditionalBuilder(
              condition: SocialCubit.get(context).following.length > 0 &&
                  SocialCubit.get(context).userModel != null,
              builder: (context) => SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => FollowingList(
                      SocialCubit.get(context).following[index],
                      context,
                      index),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8.0,
                  ),
                  itemCount: SocialCubit.get(context).posts.length,
                ),
              ),
              fallback: (context) => Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
                color: Colors.blueGrey,
                child: FittedBox(
                  child: Text(
                    'Not Following anyone .....',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }

  Widget FollowingList(user, context, index) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.profilePicture),
            ),
            title: Text(user.name),
            subtitle: Text(user.bio),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
