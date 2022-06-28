import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egytour/layout/cubit/states.dart';
import 'package:egytour/modules/postscreen/add_post_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/SavedPostModel.dart';
import '../../models/notficationmodel.dart';
import '../../models/users.dart';
import '../../modules/Feeds/Feeds.dart';
import '../../modules/chat/chats.dart';
import '../../modules/chat/messageModel.dart';
import '../../modules/login/social_login.dart';
import '../../modules/map/map_screen.dart';
import '../../modules/pesonalpage/personal_sceen.dart';
import '../../modules/places/places.dart';
import '../../modules/postscreen/postmodel.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cach_helper.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialStates());
  static SocialCubit get(context) => BlocProvider.of(context);

  /*****************************************/
  SocialUserModel? userModel;
  SocialUserModel? selectedUser;
  List<PostModel> postsPersonal = [];
  List<String> postsIdPersonal = [];
  void getPersonalPost2() {
    emit(GetPostPersonalLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('date')
        .snapshots()
        .listen((event) {
      postsPersonal = [];
      postsIdPersonal = [];
      event.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          if (element.data()['uId'] == userModel!.uId) {
            postsIdPersonal.add(element.id);
            postsPersonal.add(PostModel.fromJson(element.data()));
          }

          emit(GetPostPersonalSuccessState());
        }).catchError((error) {
          print("${error.toString()} from Personal posts");
          emit(GetPostPersonalErrorState(error));
        });
      });

      //(GetPostPersonalSuccessState());
    });
  }
  /*****************************************/

  /*****************************************/
  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      // print(value.data());
      userModel =
          SocialUserModel.fromJson(value.data() as Map<String, dynamic>);
      emit(SocialGetUserSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorStates(error.toString()));
    });
  }
  /*****************************************/

  /*****************************************/
  Future<SocialUserModel?> getUserDataFromId(String uid) async {
    // emit(SocialGetSelectedUserLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      // print(value.data());
      selectedUser =
          SocialUserModel.fromJson(value.data() as Map<String, dynamic>);
      //  emit(SocialGetSelectedUserLoadingState());
      return selectedUser;
    }).catchError((error) {
      print(error.toString());
      //    emit(SocialGetSelectedUserErrorLoadingState(error.toString()));
      return null;
    });
    return null;
  }
  /*****************************************/

  /*****************************************/
  int currentIndex = 0;
  List<Widget> screens = [
    FeedsScreen(),
    placesinfo(),
    MapScreen(),
    Chats(),
    personal(),
  ];
  void changeBottomNav(int index) {
    if (index == 3) getUsers();
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }
  /*****************************************/

  /*****************************************/
  File? postImage;
  File? profileImage;
  var picker = ImagePicker();
  Future<void> getprofileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialprofileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialprofileImagePickedErrorState());
    }
  }
  /*****************************************/

  /*****************************************/
  File? coverImage;
  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialCoverImagePickedErrorState());
    }
  }
  /*****************************************/

  /*****************************************/
  void signOut(context) {
    CachHelper.removeData(
      key: 'uId',
    ).then((value) {
      if (value) {
        navigateAndfinish(
          context,
          SocialLoginScreen(),
        );
      }
    });
  }
  /*****************************************/

  /*****************************************/
  void uploadProfileImage({
    required String name,
    required String bio,
    required String phone,
  }) {
    emit(SocialUserUpdateLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialUploadprofileImageSuccessState());
        updateUser(
          name: name,
          bio: bio,
          phone: phone,
          image: value,
        );
        FirebaseFirestore.instance.collection('users').doc(uId).update({
          'image': value,
        });
      }).catchError((error) {
        emit(SocialUploadprofileImageErrorSState());
      });
    }).catchError((error) {
      emit(SocialUploadprofileImageErrorSState());
    });
  }
  /*****************************************/

  /*****************************************/
  void uploadCoverImage({
    required String name,
    required String bio,
    required String phone,
  }) async {
    emit(SocialUserUpdateLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(
          name: name,
          bio: bio,
          phone: phone,
          cover: value,
        );
        FirebaseFirestore.instance.collection('users').doc(uId).update({
          'cover': value,
        });
      }).catchError((error) {
        print(error.toString());
        emit(SocialUploadCoverImageErrorState(error.toString()));
      });
    }).catchError((error) {
      print(error.toString());
      emit(SocialUploadCoverImageErrorState(error.toString()));
    });
  }
  /*****************************************/

  /*****************************************/
  void updateUser(
      {required String name,
      required String bio,
      required String phone,
      String? image,
      String? cover}) {
    emit(SocialUserUpdateLoadingState());
    SocialUserModel model = SocialUserModel(
      name: name,
      bio: bio,
      phone: phone,
      email: userModel!.email,
      cover: userModel!.cover,
      image: userModel!.image,
      uId: userModel!.uId,
      isEmailVerified: false,
      followers: '',
      following: '',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
      print(getUserData);
      emit(SocialUserUpdateSuccessState());
    }).catchError((error) {
      emit(SocialUserUpdateErrorState(error.toString()));
      print(error.toString());
    });
  }
  /*****************************************/

  /*****************************************/
  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialPostImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialPostImagePickedErrorState());
    }
  }
  /*****************************************/

  /*****************************************/
  void removePostImage() {
    postImage == null;
    emit(SocialRemovePostImageState());
  }
  /*****************************************/

  /*****************************************/
  void uploadPostImage({
    required DateTime date,
    required String text,
  }) {
    emit(SocialCreatePostLoadingState());

    FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(
          text: text,
          date: date,
          postImage: value,
        );
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }
  /*****************************************/

  /*****************************************/
  void createPost({
    required DateTime date,
    required String text,
    String? postImage,
  }) async {
    emit(SocialCreatePostLoadingState());

    PostModel model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      // date: date,
      text: text,
      postImage: postImage ?? '',
      likes: {},
      likesNum: [],
      myLike: false,
      comments: [],
      commentsNum: [],
      commentsImage: [],
      commentsName: [],
    );
    await FirebaseFirestore.instance.collection('posts').add(model.toMap());
    emit(SocialCreatePostSuccessState());
  }
  /*****************************************/

  /*****************************************/
  // List<PostModel> posts = [];
  // List<String> postsId = [];
  //  List<int> likes = [];
  // List<bool> isLike = [];
  // void getPost() {
  //   emit(GetPostLoadingState());
  //   FirebaseFirestore.instance.collection('posts').snapshots().listen((event) {
  //     posts = [];
  //     postsId = [];
  //     likes = [];
  //     Comments = [];
  //     for (var element in event.docs) {
  //       element.reference.collection('likes').get().then((value) {
  //         likes.add(value.docs.length);
  //         postsId.add(element.id);
  //         posts.add(PostModel.fromJson(element.data()));
  //         emit(GetPostSuccessState());
  //         print(Comments.length);
  //       }).catchError((error) {
  //         print(error.toString());
  //       });
  //     }
  //     emit(GetPostSuccessState());
  //   });
  // }
  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];
  List<bool> isLike = [];
  int likesNum = 0;
  void getPosts() {
    FirebaseFirestore.instance
        .collection('posts')
        // .orderBy('date')
        .snapshots()
        .listen((event) {
      posts = [];
      postsId = [];
      likes = [];
      isLike = [];
      event.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          postsId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
          emit(SocialGetPostsSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(SocialGetPostsErrorState(error.toString()));
        });
      });

      emit(SocialGetPostsSuccessState());
    });
  }
  /*****************************************/

  /*****************************************/
  List<PostModel> friendposts = [];
  List<String> friendpostsId = [];
  List<int> friendlikes = [];
  void getPostsByID(String uid) async {
    await FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        element.reference
            .collection('likes')
            .where("uId", isEqualTo: uid)
            .get()
            .then((value) {
          friendlikes.add(value.docs.length);
          friendpostsId.add(element.id);
          friendposts.add(PostModel.fromJson(element.data()));
        }).catchError((error) {});
      });
      emit(SocialGetPostsbyIDSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetPostsByIDErrorSuccessState(error.toString()));
    });
  }
  /*****************************************/

  /*****************************************/
  Future getPostsFromId(String uid) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .where("uId", isEqualTo: uid)
        .get();
    querySnapshot.docs.forEach((element) async {
      QuerySnapshot querySnapshot =
          await element.reference.collection('likes').get();
      likes.add(querySnapshot.docs.length);
      postsId.add(element.id);
      posts.add(PostModel.fromJson(element.data() as Map<String, dynamic>));
      print(querySnapshot.docs.length);
    });
  }
  /*****************************************/

  /*****************************************/
  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId)
        .set({
      'like': true,
    }).then((value) {
      emit(SocialLikePostSuccessState());
    }).catchError((error) {
      emit(SocialLikePostErrorState(error.toString()));
    });
  }

  void likePost2(String postId, DateTime date) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .get()
        .then((value) {
      postModel = PostModel.fromJson(value.data() as Map<String, dynamic>);
    }).then((value) {
      if (postModel!.likes[userModel!.uId] == false ||
          postModel!.likes[userModel!.uId] == null) {
        postModel!.likes[userModel!.uId] = true;
        //notifications
        if (postModel!.uId != userModel!.uId) {
          notificationModel = NotificationModel(
              userName: userModel!.name,
              userImage: userModel!.image,
              userUid: userModel!.uId,
              date: date,
              event: "liked your post",
              postId: postId,
              postImage: postModel!.postImage,
              notificationType: 'like');
          FirebaseFirestore.instance
              .collection('users')
              .doc(postModel!.uId)
              .collection('notification')
              .add(notificationModel!.toMap())
              .then((value) {});
        }
      } else {
        postModel!.likes[userModel!.uId] = false;
      }
      postModel!.likesNum = [];
      postModel!.likes.forEach((key, value) {
        if (value == true) {
          postModel!.likesNum!.add(key);
          //  notification

        } else {
          postModel!.likesNum!.remove(key);
        }
      });

      FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .update(postModel!.toMap())
          .then((value) {
        emit(SocialLikesSuccessState());
      });
    }).catchError((error) {
      emit(SocialLikesErrorState(error));
    });
  }
  /*****************************************/

  /*****************************************/
  List<SocialUserModel> users = [];
  void getUsers() {
    if (users.length == 0) {
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          if (element.data()['uId'] != userModel!.uId) {
            users.add(SocialUserModel.fromJson(element.data()));
          }
        });
        emit(SocialGetAllUserSuccessStates());
      }).catchError((error) {
        print(error.toString());
        emit(SocialGetAllUserErrorStates(error.toString()));
      });
    }
  }
  /*****************************************/

  /*****************************************/
  SocialUserModel? friendModel;
  List<SocialUserModel> newusers = [];
  List<PostModel> postsFriends = [];
  List<String> postsIdFriends = [];
  void getFriendData(String userId) {
    //emit(GetUserFriendLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((value) {
      friendModel =
          SocialUserModel.fromJson(value.data() as Map<String, dynamic>);
      postsFriends = [];
      if (postsFriends.length == 0) {
        getFriendPosts();
      }

      //emit(GetUserFriendSuccessState());
    }).catchError((error) {
      print("${error.toString()} in Home Cubit");
      // emit(GetUserFriendErrorState(error));
    });
  }
  /*****************************************/

  /*****************************************/
  PostModel? postModel;
  void getFriendPosts() {
    //emit(GetPostFriendsLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('date')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        postsFriends = [];
        element.reference.collection('likes').get().then((value) {
          if (element.data()['uId'] == friendModel!.uId) {
            postsIdFriends.add(element.id);
            postsFriends.add(PostModel.fromJson(element.data()));
          }

          // emit(GetPostFriendsSuccessState());
        }).catchError((error) {
          print("${error.toString()} from Friends posts");
          // emit(GetPostFriendsErrorState(error));
        });
      });
      //emit(GetPostFriendsSuccessState());
    });
  }
  /*****************************************/

  //get all followers
  List<SocialUserModel> followers = [];
  void getFollowers(uId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .collection('followers')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        followers.add(SocialUserModel.fromJson(element.data()));
      });
      emit(SocialGetFollowersSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetFollowersErrorState(error.toString()));
    });
  }

  List<SocialUserModel> following = [];
  void getFollowing() {
    if (following.length == 0) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userModel?.uId)
          .collection('followers')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          following.add(SocialUserModel.fromJson(element.data()));
        });
        emit(SocialGetFollowersSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(SocialGetFollowersErrorState(error.toString()));
      });
    }
  }

  ///delete posts
  void deletePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .delete()
        .then((value) {
      emit(SocialDeletePostSuccessState());
    }).catchError((error) {
      emit(SocialDeletePostErrorState(error.toString()));
    });
  }

  ///Chaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaat
/*****************************************/
  List<SocialUserModel> user = [];
  void getChatUsers() {
    emit(GetAllChatUserLoadingState());
    if (users.length == 0)
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          if (element.data()['uId'] != userModel!.uId)
            users.add(SocialUserModel.fromJson(element.data()));
        });
        emit(GetAllChatUserSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetAllChatUserErrorState(error));
      });
  }

  List<SocialUserModel> usersSearch = [];
  void getSearchUsers(String name) {
    emit(GetAllSearchUserLoadingState());
    usersSearch = [];
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        if (element.data()['name'] == name)
          usersSearch.add(SocialUserModel.fromJson(element.data()));
      });
      emit(GetAllSearchUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllSearchUserErrorState(error));
    });
  }

  List<int> likesFriends = [];

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel messageModel = MessageModel(
        senderId: userModel!.uId,
        receiverId: receiverId,
        dateTime: dateTime,
        text: text);
    //set my chats
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(SendingMessageSuccessState());
    }).catchError((error) {
      emit(SendingMessageErrorState(error));
    });
    //set receiver chats
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel!.uId)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(SendingMessageSuccessState());
    }).catchError((error) {
      emit(SendingMessageErrorState(error));
    });
  }

  List<MessageModel> messages = [
    MessageModel(
        senderId: '',
        receiverId: '',
        dateTime: '',
        text: "Chat  with your friend")
  ];
  void getMessage({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [
        MessageModel(
            senderId: '',
            receiverId: '',
            dateTime: '',
            text: "Chat  with your friend")
      ];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });

      emit(SocailGetMessageSuccessState());
    });
  }

  void getMessageWithoutStreaming({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .get()
        .then((event) {
      messages = [
        MessageModel(
            senderId: '',
            receiverId: '',
            dateTime: '',
            text: "Chat  with your friend")
      ];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });

      emit(SocailGetMessageSuccessState());
    });
  }

  bool isFirst = true;
  void doThis() {
    isFirst = !isFirst;
  }

  bool isMessage = false;
  bool isMessage2 = true;
/*****************************************/

/******************************************/
  List<SavedPostModel> savedPosts = [];
  List<SavedPostModel> savedPostsWithImagesWithText = [];
  List<SavedPostModel> savedPostsWithImages = [];
  List<SavedPostModel> savedPostsWithText = [];
  void getSavedPosts() {
    emit(SocialGetSavedPostLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('savedPosts')
        .orderBy('date')
        .get()
        .then((value) {
      savedPosts = [];
      savedPostsWithImagesWithText = [];
      savedPostsWithImages = [];
      savedPostsWithText = [];
      value.docs.forEach((element) {
        savedPosts.add(SavedPostModel.fromJson(element.data()));
        if (element.data()['postImage'] != '' &&
            element.data()['postText'] != '')
          savedPostsWithImagesWithText
              .add(SavedPostModel.fromJson(element.data()));
        if (element.data()['postImage'] != '' &&
            element.data()['postText'] == '')
          savedPostsWithImages.add(SavedPostModel.fromJson(element.data()));
        if (element.data()['postImage'] == '' &&
            element.data()['postText'] != '')
          savedPostsWithText.add(SavedPostModel.fromJson(element.data()));
      });
      emit(SocialGetSavedPostSuccessState());
    }).catchError((error) {
      print("${error.toString()} from getSavedPosts");
      emit(SocailGetSavedPostErrorState(error));
    });
  }
/******************************************/

/******************************************/

  ///comments
  NotificationModel? notificationModel;
  void CreateCommentPost(String postId, String commentText, DateTime date) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .get()
        .then((value) {
      postModel = PostModel.fromJson(value.data() as Map<String, dynamic>);
    }).then((value) {
      postModel!.comments.add(commentText);
      postModel!.commentsName.add(userModel!.name);
      postModel!.commentsImage.add(userModel!.image);
      //  notification
      if (postModel!.uId != userModel!.uId) {
        notificationModel = NotificationModel(
            userName: userModel!.name,
            userImage: userModel!.image,
            userUid: userModel!.uId,
            date: date,
            event: "commented in your post",
            postId: postId,
            postImage: postModel!.postImage,
            notificationType: 'comment');
        FirebaseFirestore.instance
            .collection('users')
            .doc(postModel!.uId)
            .collection('notification')
            .add(notificationModel!.toMap())
            .then((value) {});
      }
      FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .update(postModel!.toMap())
          .then((value) {
        emit(SocialCreateCommentsSuccessState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreateCommentsErrorState(error));
    });
  }

  /*************************/
  ///save post model

  SavedPostModel? savedPostModel;

  void savePost(
      {required String postId,
      required DateTime date,
      required String userName,
      required String userId,
      required String userImage,
      String? postImage,
      String? postText}) {
    savedPostModel = SavedPostModel(
        postId: postId,
        date: date,
        userName: userName,
        userId: userId,
        userImage: userImage,
        postImage: postImage ?? '',
        postText: postText ?? '');
    notificationModel = NotificationModel(
        userName: userModel!.name,
        userImage: userModel!.image,
        date: date,
        event: 'Saved your post',
        postId: postId,
        notificationType: 'save',
        postImage: postImage ?? '',
        userUid: userModel!.uId);
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('savedPosts')
        .add(savedPostModel!.toMap())
        .then((value) {
      if (userId != userModel!.uId)
        FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('notification')
            .add(notificationModel!.toMap())
            .then((value) {})
            .catchError((error) {
          print("${error.toString()} from savePostNotification");
        });
      emit(SocialSavePostSuccessState());
    }).catchError((error) {
      print("${error.toString()} from savePost");
      emit(SocailSavePostErrorState(error));
    });
  }

  /*************************/
  List Comments = [];
  List CommentsUserName = [];
  List CommentsUserImages = [];
  void getCommentPost(String postId) {
    emit(SocialGetCommentsLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .get()
        .then((value) {
      postModel = PostModel.fromJson(value.data() as Map<String, dynamic>);
    }).then((value) {
      Comments = [];
      CommentsUserName = [];
      CommentsUserImages = [];
      Comments = postModel!.comments;
      CommentsUserName = postModel!.commentsName;
      CommentsUserImages = postModel!.commentsImage;
      print(Comments.toString());
      emit(SocialGetCommentsSuccessState());
    }).catchError((error) {
      print("${error.toString()} from get comment");
      emit(SocialGetCommentsErrorState(error));
    });
  }

  List<NotificationModel> notifications = [];
  void getNotifications() {
    emit(GetNotificationsLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('notification')
        .orderBy('date')
        .get()
        .then((value) {
      notifications = [];
      value.docs.forEach((element) {
        notifications.add(NotificationModel.fromJson(element.data()));
      });
      emit(GetNotificationsSuccessState());
    }).catchError((error) {
      print("${error.toString()} from get notification");
      emit(GetNotificationsErrorState(error));
    });
  }

/******************************************/
  Future getPostFeedsImage(context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialCreatePostSuccessState());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewPostScreen()));
    } else {
      print("No image selected");
      emit(SocialCreatePostErrorState());
    }
  }

/******************************************/

}
