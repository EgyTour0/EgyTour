/****************************************/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:egytour/models/users.dart';
import 'package:egytour/modules/follow/followers.dart';
import 'package:egytour/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/constants.dart';
import '../comment/comments_screen.dart';
import '../follow/following.dart';
import '../postscreen/add_post_screen.dart';
import '../postscreen/postmodel.dart';
import '../settings/editscreen.dart';

class personal extends StatefulWidget {
  String? userID;
  personal({Key? key, this.userID}) : super(key: key);

  @override
  _personalState createState() => _personalState();
}

class _personalState extends State<personal> {
  var searchController = TextEditingController();
  bool postsLoaded = false;
  SocialUserModel? selectedUser;
  Future<SocialUserModel?> getUserDataFromId(String uid) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    selectedUser = SocialUserModel.fromJson(doc.data() as Map<String, dynamic>);
    print(selectedUser!.uId);
    return selectedUser;
  }

  @override
  Widget build(BuildContext context) {
    var bloc = SocialCubit.get(context);
    return FutureBuilder(
        future: getUserDataFromId(widget.userID ?? uId),
        builder: (context, AsyncSnapshot<SocialUserModel?> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return BlocConsumer<SocialCubit, SocialStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var userModel = SocialCubit.get(context).userModel!.uId;
              SocialUserModel selectedUser = snapshot.data!;
              return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: ButtonAndIconsColor(),
                    elevation: 7.0,
                    actions: [
                      MaterialButton(
                          onPressed: () {
                            signOut(context);
                          },
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                  body: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 180.0,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Align(
                                child: Container(
                                  height: 140.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        '${selectedUser.cover}',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                alignment: AlignmentDirectional.topCenter,
                              ),
                              CircleAvatar(
                                radius: 50.0,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 48.0,
                                  backgroundImage: NetworkImage(
                                    '${selectedUser.image}',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          '${selectedUser.name}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          '${selectedUser.bio}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(
                          height: 23.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: statWidget("Posts",
                                  "${SocialCubit.get(context).posts.length}"),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  child: statWidget("Followers",
                                      "${SocialCubit.get(context).followers.length}"),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => followers(),
                                      ),
                                    );
                                  }),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  child: statWidget("Following",
                                      "${SocialCubit.get(context).following.length}"),
                                  onTap: () {
                                    navigateto(context, following());
                                  }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7.0),
                        Row(
                          children: [
                            if (widget.userID != null)
                              Expanded(
                                flex: 2,
                                child: OutlinedButton(
                                  onPressed: () {
                                    bool first = true;
                                    bool second = true;
                                    if (first == true) {
                                      final UserDoc = FirebaseFirestore.instance
                                          .collection('users')
                                          .doc('followers');
                                      UserDoc.update({
                                        'followers': '$followers',
                                      });
                                      first == false;
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(child: Text('Follow')),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: 5,
                            ),
                            if (widget.userID == null)
                              Expanded(
                                flex: 2,
                                child: OutlinedButton(
                                  onPressed: () {
                                    navigateto(context, EditProfileScreen());
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(child: Text('Edit Profile')),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Center(
                                        child: Icon(
                                          Icons.edit,
                                          size: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(0),
                          child: Divider(
                            height: 18.0,
                            thickness: 0.8,
                            color: Colors.black87,
                          ),
                        ),
                        Expanded(
                          child: ConditionalBuilder(
                            condition:
                                SocialCubit.get(context).posts.length > 0 &&
                                    SocialCubit.get(context).userModel != null,
                            builder: (context) => SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Card(
                                      shape: BeveledRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 3,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                bloc.currentIndex;
                                              },
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                    bloc.userModel!.image),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                child: MaterialButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  NewPostScreen()));
                                                    },
                                                    child: Text(
                                                      "What's on your mind ?",
                                                      style: TextStyle(
                                                          color: defaultColor),
                                                    )),
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  bloc.getPostFeedsImage(
                                                      context);
                                                },
                                                icon: Icon(
                                                  Icons.photo_library_outlined,
                                                  color: defaultColor,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        buildPostItem(
                                            SocialCubit.get(context)
                                                .posts
                                                .where((element) {
                                              if (widget.userID == null) {
                                                return element.uId == uId;
                                              } else {
                                                return element.uId != uId;
                                              }
                                            }).toList()[index],
                                            context,
                                            index),
                                    //SocialCubit.get(context).posts[index], context, index),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 8.0,
                                    ),
                                    itemCount: SocialCubit.get(context)
                                        .posts
                                        .where((element) {
                                          if (widget.userID == null) {
                                            return element.uId == uId;
                                          } else {
                                            return element.uId != uId;
                                          }
                                        })
                                        .toList()
                                        .length,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                ],
                              ),
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                        )
                      ],
                    ),
                  ));
            },
          );
        });
  }

  Widget buildPostItem(PostModel model, context, index) {
    late int CommentsNumber;
    var date = DateTime.now();
    late String postId;
    TextEditingController comment = TextEditingController();
    postId = SocialCubit.get(context).postsId[index];
    var bloc1 = SocialCubit.get(context);
    CommentsNumber = SocialCubit.get(context).posts[index].comments.length;
    // print(CommentsNumber);

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    navigateto(
                        context,
                        personal(
                          userID: model.uId == uId ? null : model.uId,
                        ));
                  },
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                      '${model.image}',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${model.name}',
                            style: const TextStyle(
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 16.0,
                          ),
                        ],
                      ),
                      // Text(
                      //   '${DateFormat.yMMMd().format(model.date)}',
                      //   style: Theme.of(context).textTheme.caption!.copyWith(
                      //         height: 1.4,
                      //       ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 16.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Text(
              '${model.text}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
                top: 5.0,
              ),
              child: Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 6.0,
                      ),
                      child: Container(
                        height: 25.0,
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          child: Text(
                            '#software',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.blue,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 6.0,
                      ),
                      child: Container(
                        height: 25.0,
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          child: Text(
                            '#flutter',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.blue,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (model.postImage != '')
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 15.0),
                child: Container(
                  height: 400.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4.0,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${model.postImage}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.favorite_border,
                              size: 16.0,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${SocialCubit.get(context).likes[index]}',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        bloc1.getCommentPost(postId);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommentsScreen(
                                      index: index,
                                      postId: postId,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "$CommentsNumber ",
                              style: Theme.of(context).textTheme.subtitle2!,
                            ),
                            Text(
                              "comments",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: comment,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'write a comment .....',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 15, color: Colors.grey[400])),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    var date = DateTime.now();
                    if (comment.text != '')
                      bloc1.CreateCommentPost(postId, comment.text, date);
                    bloc1.getCommentPost(postId);
                  },
                  icon: Icon(Icons.send_outlined),
                  color: defaultColor,
                ),
                InkWell(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.favorite_border,
                        size: 16.0,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Like',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: () {
                    SocialCubit.get(context)
                        .likePost(SocialCubit.get(context).postsId[index]);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget statWidget(String title, String state) {
  return Expanded(
    child: Column(
      children: [
        Text(
          state,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11.0,
          ),
        ),
      ],
    ),
  );
}
/**************************************/
