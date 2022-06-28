import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';

class CommentsScreen extends StatelessWidget {
  late int index;
  late String postId;
  CommentsScreen({required this.postId, required this.index});

  @override
  Widget build(BuildContext context) {
    TextEditingController comment = TextEditingController();
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var bloc = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 100,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.pink,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            actions: [],
          ),
          body: ConditionalBuilder(
            condition: state is! SocialGetCommentsLoadingState,
            fallback: (context) => Center(child: CircularProgressIndicator()),
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            commentItem(context, bloc.Comments[index], index),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: bloc.Comments.length),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsetsDirectional.only(
                              top: 7, end: 5, bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 3,
                                    blurRadius: 6,
                                    offset: Offset(0, 0))
                              ]),
                          child: TextFormField(
                            controller: comment,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.black),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "type here...",
                                hintStyle: TextStyle(color: Colors.grey),

                                // border: OutlineInputBorder(),
                                focusColor: defaultColor,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 3),
                                    borderRadius: BorderRadius.circular(30)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 3),
                                    borderRadius: BorderRadius.circular(30))),
                            cursorColor: defaultColor,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 27,
                        backgroundColor: defaultColor,
                        child: IconButton(
                            onPressed: () {
                              var date = DateTime.now();
                              try {
                                bloc.CreateCommentPost(
                                    postId, comment.text, date);
                              } catch (error) {}
                            },
                            icon: Icon(
                              Icons.send_outlined,
                              color: Colors.white,
                              size: 32,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget commentItem(context, String Comment, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                SocialCubit.get(context).CommentsUserImages[index]),
            radius: 29,
          ),
          Flexible(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
                padding:
                    EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
                decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(20),
                      bottomEnd: Radius.circular(20),
                      bottomStart: Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SocialCubit.get(context).CommentsUserName[index],
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Comment,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
