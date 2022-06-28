import 'dart:ui';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/users.dart';
import '../postscreen/postmodel.dart';
import 'commentonfriendprofile.dart';

class FriendProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var bloc = SocialCubit.get(context);
        SocialUserModel? userModel = bloc.friendModel;

        return Scaffold(
          appBar: AppBar(
            title: userModel != null && state is! GetUserFriendLoadingState
                ? Text("${userModel.name}")
                : Center(
                    child: CircularProgressIndicator(
                    color: Colors.red,
                  )),
            leading: IconButton(
              onPressed: () {
                userModel = null;
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          body: ConditionalBuilder(
            condition: userModel != null && state is! GetUserFriendLoadingState,
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            )),
            builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Column(
                  children: [
                    // Container(
                    //   height: 220,
                    //   child: Stack(
                    //     alignment: AlignmentDirectional.bottomCenter,
                    //     children: [
                    //       // Align(
                    //       //   alignment: AlignmentDirectional.topCenter,
                    //       //   child: InkWell(
                    //       //     onTap: () {
                    //       //       Navigator.push(
                    //       //           context,
                    //       //           MaterialPageRoute(
                    //       //               builder: (context) => ShowImage(
                    //       //                   image: userModel!.background)));
                    //       //     },
                    //       //     child: Container(
                    //       //       height: 160,
                    //       //       width: double.infinity,
                    //       //       decoration: BoxDecoration(
                    //       //           borderRadius: BorderRadius.only(
                    //       //             topRight: Radius.circular(10),
                    //       //             topLeft: Radius.circular(10),
                    //       //             bottomLeft: Radius.circular(6),
                    //       //             bottomRight: Radius.circular(6),
                    //       //           ),
                    //       //           image: DecorationImage(
                    //       //               image: NetworkImage(userModel!.background),
                    //       //               fit: BoxFit.cover)),
                    //       //     ),
                    //       //   ),
                    //       // ),
                    //       // InkWell(
                    //       //   onTap: () {
                    //       //     Navigator.push(
                    //       //         context,
                    //       //         MaterialPageRoute(
                    //       //             builder: (context) =>
                    //       //                 ShowImage(image: userModel!.image)));
                    //       //   },
                    //       //   child: CircleAvatar(
                    //       //     radius: 63,
                    //       //     backgroundColor:
                    //       //     Theme.of(context).scaffoldBackgroundColor,
                    //       //     child: CircleAvatar(
                    //       //       radius: 60,
                    //       //       backgroundImage: NetworkImage(userModel!.image),
                    //       //     ),
                    //       //   ),
                    //       // )
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width / 2.2,
                          child: Text(
                            userModel!.name,
                            style: Theme.of(context).textTheme.headline4,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.red,
                          size: 25,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        userModel!.bio,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 15),
                        textAlign: TextAlign.center,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Text(
                                    "5",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Text(
                                    "Posts",
                                    style: Theme.of(context).textTheme.caption,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Text(
                                    "10K",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Text(
                                    "Followers",
                                    style: Theme.of(context).textTheme.caption,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Text(
                                    "87",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Text(
                                    "Following",
                                    style: Theme.of(context).textTheme.caption,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Text(
                                    "1556",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Text(
                                    "Photos",
                                    style: Theme.of(context).textTheme.caption,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        reverse: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => buildPostItem(
                              context,
                              bloc.postsFriends[index],
                              index,
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 15,
                            ),
                        itemCount: bloc.postsFriends.length),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildPostItem(
    context,
    PostModel userModel,
    index,
  ) {
    var bloc = SocialCubit.get(context).userModel;

    var bloc1 = SocialCubit.get(context);
    late int LikesNumber;
    late int CommentsNumber;
    late String postId;
    late bool isTranslated;
    TextEditingController comment = TextEditingController();

    LikesNumber = SocialCubit.get(context).postsFriends[index].likesNum!.length;
    CommentsNumber =
        SocialCubit.get(context).postsFriends[index].comments.length;
    postId = SocialCubit.get(context).postsIdFriends[index];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 6,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: userModel.uId == bloc!.uId
                        ? NetworkImage(bloc.image)
                        : NetworkImage(userModel.image),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              userModel.uId == bloc.uId
                                  ? bloc.name
                                  : userModel.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.red,
                              size: 17,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      // Text(
                      //   DateFormat.yMMMd().format(userModel!.date),
                      //   style: Theme.of(context).textTheme.caption,
                      // )
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                // if (userModel.text != '')
                //   IconButton(
                //       onPressed: () async {
                //         bloc1.translateFriendPost(userModel.text!, index);
                //       },
                //       icon: Icon(
                //         Icons.translate,
                //         color: Colors.red,
                //       )),
                // IconButton(
                //     onPressed: () {
                //       showModalBottomSheet(
                //           context: context,
                //           isScrollControlled: true,
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.vertical(
                //                   top: Radius.circular(30))),
                //           builder: (context) {
                //             return Padding(
                //               padding: const EdgeInsets.all(15.0),
                //               child: Column(
                //                 mainAxisSize: MainAxisSize.min,
                //                 children: [
                //                   InkWell(
                //                     onTap: () {
                //                       bloc1.savePost(
                //                           postId: postId,
                //                           date: DateTime.now(),
                //                           userName: userModel.name,
                //                           userId: userModel.uId,
                //                           userImage: userModel.image,
                //                           postText: userModel.text,
                //                           postImage: userModel.postImage);
                //                     },
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Row(
                //                         children: [
                //                           Icon(
                //                             Icons.turned_in_not_sharp,
                //                             color: Colors.red,
                //                             size: 30,
                //                           ),
                //                           SizedBox(
                //                             width: 10,
                //                           ),
                //                           Text(
                //                             "Save Post",
                //                             style: TextStyle(
                //                                 color: Colors.white,
                //                                 fontWeight: FontWeight.w600,
                //                                 fontSize: 20),
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     height: 15,
                //                   ),
                //                   if (userModel.postImage != '')
                //                     InkWell(
                //                       onTap: () {
                //                         bloc1.saveToGallery(userModel.postImage!);
                //                       },
                //                       child: Padding(
                //                         padding: const EdgeInsets.all(8.0),
                //                         child: Row(
                //                           children: [
                //                             Icon(
                //                               Icons.save_outlined,
                //                               color: Colors.red,
                //                               size: 30,
                //                             ),
                //                             SizedBox(
                //                               width: 10,
                //                             ),
                //                             Text(
                //                               "Save Post Image",
                //                               style: TextStyle(
                //                                   color: Colors.white,
                //                                   fontWeight: FontWeight.w600,
                //                                   fontSize: 20),
                //                             )
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   SizedBox(
                //                     height: 15,
                //                   ),
                //                   InkWell(
                //                     onTap: () {},
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Row(
                //                         children: [
                //                           Icon(
                //                             Icons.share,
                //                             color: Colors.red,
                //                             size: 30,
                //                           ),
                //                           SizedBox(
                //                             width: 10,
                //                           ),
                //                           Text(
                //                             "Share",
                //                             style: TextStyle(
                //                                 color: Colors.white,
                //                                 fontWeight: FontWeight.w600,
                //                                 fontSize: 20),
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             );
                //           });
                //     },
                //     icon: Icon(
                //       Icons.more_horiz_outlined,
                //       color: Colors.grey,
                //     ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Container(
                width: double.infinity,
                height: 0.8,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (userModel.text != '')
              Text(
                userModel.text,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 15),
              ),
            if (userModel.text != '')
              SizedBox(
                height: 10,
              ),
            if (userModel.postImage != '')
              Container(
                // height: 250,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                      image: NetworkImage(userModel.postImage),
                      fit: BoxFit.cover),
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.pink,
                          ),

                          // Text("${HomeCubit.get(context).likes[index]}"),
                          SizedBox(
                            width: 5,
                          ),

                          Text(
                            "${LikesNumber}",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),

                          // Text(
                          //     "${HomeCubit.get(context).posts[index].likes[HomeCubit.get(context).userModel!.uId].toString()}"),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      bloc1.getCommentPost(postId);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommentsFriendsScreen(
                                    likesNumber: LikesNumber,
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
                            style: Theme.of(context).textTheme.subtitle2,
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
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 13, left: 40, right: 40, top: 5),
              child: Container(
                width: double.infinity,
                height: 0.8,
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundImage: NetworkImage(
                              SocialCubit.get(context).userModel!.image),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: comment,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'write a comment .....',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 15, color: Colors.grey[400])),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            var date = DateTime.now();
                            if (comment.text != '')
                              bloc1.CreateCommentPost(
                                  postId, comment.text, date);
                            bloc1.getCommentPost(postId);
                          },
                          icon: Icon(Icons.send_outlined),
                          color: Colors.pink,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    SocialCubit.get(context).likePost(
                      SocialCubit.get(context).postsIdFriends[index],
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        if ((SocialCubit.get(context).postsFriends[index].likes[
                                    SocialCubit.get(context).userModel!.uId] !=
                                true ||
                            SocialCubit.get(context).postsFriends[index].likes[
                                    SocialCubit.get(context).userModel!.uId] ==
                                null))
                          Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          ),
                        if (SocialCubit.get(context).postsFriends[index].likes[
                                SocialCubit.get(context).userModel!.uId] ==
                            true)
                          Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Like",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
