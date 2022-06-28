import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/users.dart';
import '../../shared/components/components.dart';

class UsersChats extends StatelessWidget {
  const UsersChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      SocialCubit.get(context).getChatUsers();
      return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = SocialCubit.get(context);
          return Scaffold(
            body: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ConditionalBuilder(
                condition: bloc.users.length > 0,
                builder: (context) => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        ChatItem(context, bloc.users[index]),
                    separatorBuilder: (context, index) => SizedBox(),
                    itemCount: bloc.users.length),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        },
      );
    });
  }

  Widget ChatItem(context, SocialUserModel model) {
    var bloc1 = SocialCubit.get(context);
    return InkWell(
      onTap: () {
        // bloc1.openChat();
      },
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(model.image),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        model.name,
                        style: Theme.of(context).textTheme.headline5,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: defaultColor,
                        size: 17,
                      )
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  child: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.3),
                          blurRadius: 6,
                          spreadRadius: 2,
                          offset: Offset(0, 4))
                    ]),
                    child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: Icon(
                          Icons.chat_bubble,
                          color: defaultColor,
                        )),
                  ),
                  radius: 18,
                ))
          ],
        ),
      ),
    );
  }
}
