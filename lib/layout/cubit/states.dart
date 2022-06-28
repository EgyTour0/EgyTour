abstract class SocialStates {}

class SocialInitialStates extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetSelectedUserLoadingState extends SocialStates {}

class SocialGetSelectedUserErrorLoadingState extends SocialStates {
  final String error;

  SocialGetSelectedUserErrorLoadingState(this.error);
}

class SocialGetUserSuccessStates extends SocialStates {}

class SocialGetUserErrorStates extends SocialStates {
  final String error;

  SocialGetUserErrorStates(this.error);
}

class GetUserLoadingState extends SocialStates {}

class GetUserSuccessState extends SocialStates {}

class GetUserErrorState extends SocialStates {
  final CastError error;
  GetUserErrorState(this.error);
}

class GetCommentsLoadingState extends SocialStates {}

class GetCommentsLoadingErrorState extends SocialStates {
  final String error;
  GetCommentsLoadingErrorState(this.error);
}

class GetCommentsSuccessState extends SocialStates {}

class GetCommentsErrorState extends SocialStates {
  final String error;
  GetCommentsErrorState(this.error);
}

class GetUserFriendLoadingState extends SocialStates {}

class GetUserFriendSuccessState extends SocialStates {}

class GetUserFriendErrorState extends SocialStates {
  final String error;
  GetUserFriendErrorState(this.error);
}

class SocialGetAllUserLoadingState extends SocialStates {}

class SocialGetAllUserSuccessStates extends SocialStates {}

class SocialGetAllUserErrorStates extends SocialStates {
  final String error;

  SocialGetAllUserErrorStates(this.error);
}

class SocialCreatePostLoadingState extends SocialStates {}

class SocialCreatePostSuccessState extends SocialStates {}

class SocialCreatePostErrorState extends SocialStates {}

class SocialPostImagePickedSuccessState extends SocialStates {}

class SocialPostImagePickedErrorState extends SocialStates {}

class SocialRemovePostImageState extends SocialStates {}

class SocialChangeBottomNavState extends SocialStates {}

class SocialGetPostsLoadingState extends SocialStates {}

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsbyIDSuccessState extends SocialStates {}

class SocialGetPostsByIDErrorSuccessState extends SocialStates {
  final String error;
  SocialGetPostsByIDErrorSuccessState(this.error);
}

class SocialGetPostsErrorState extends SocialStates {
  final String error;

  SocialGetPostsErrorState(this.error);
}

class SocialLikePostSuccessState extends SocialStates {}

class SocialLikePostErrorState extends SocialStates {
  final String error;

  SocialLikePostErrorState(this.error);
}

class SocialNewPostState extends SocialStates {}

class SocialprofileImagePickedSuccessState extends SocialStates {}

class SocialprofileImagePickedErrorState extends SocialStates {}

class SocialUploadprofileImageSuccessState extends SocialStates {}

class SocialUploadprofileImageErrorSState extends SocialStates {}

class SocialGetFollowersSuccessState extends SocialStates {}

class SocialDeletePostSuccessState extends SocialStates {}

class SocialDeletePostErrorState extends SocialStates {
  final String error;
  SocialDeletePostErrorState(this.error);
}

class SocialGetFollowersErrorState extends SocialStates {
  final String error;
  SocialGetFollowersErrorState(this.error);
}

class SocialCoverImagePickedSuccessState extends SocialStates {}

class SocialCoverImagePickedErrorState extends SocialStates {}

class SocialUserUpdateSuccessState extends SocialStates {}

class SocialUserUpdateErrorState extends SocialStates {
  final String error;
  SocialUserUpdateErrorState(this.error);
}

class GetAllChatUserErrorState extends SocialStates {
  final String error;
  GetAllChatUserErrorState(this.error);
}

class SendingMessageErrorState extends SocialStates {
  final String error;
  SendingMessageErrorState(this.error);
}

class SocialUploadCoverImageSuccessState extends SocialStates {}

class SocialUploadCoverImageErrorState extends SocialStates {
  final String error;
  SocialUploadCoverImageErrorState(this.error);
}

class SocailGetSavedPostErrorState extends SocialStates {
  final String error;
  SocailGetSavedPostErrorState(this.error);
}

class GetAllSearchUserErrorState extends SocialStates {
  final String error;
  GetAllSearchUserErrorState(this.error);
}

class GetPostPersonalErrorState extends SocialStates {
  final String error;
  GetPostPersonalErrorState(this.error);
}

class SocialLikesErrorState extends SocialStates {
  final String error;
  SocialLikesErrorState(this.error);
}

class SocailSavePostErrorState extends SocialStates {
  final String error;
  SocailSavePostErrorState(this.error);
}

class GetNotificationsErrorState extends SocialStates {
  final String error;
  GetNotificationsErrorState(this.error);
}

class SocialGetCommentsErrorState extends SocialStates {
  final String error;
  SocialGetCommentsErrorState(this.error);
}

class SocialCreateCommentsErrorState extends SocialStates {
  final String error;
  SocialCreateCommentsErrorState(this.error);
}

class SocialUserUpdateLoadingState extends SocialStates {}

class SocialSendMessageSuccessState extends SocialStates {}

class SocialSendMessageErrorState extends SocialStates {}

class SocialGetMessageSuccessState extends SocialStates {}

class SendingMessageSuccessState extends SocialStates {}

class SocailGetMessageSuccessState extends SocialStates {}

class GetAllSearchUserLoadingState extends SocialStates {}

class GetAllSearchUserSuccessState extends SocialStates {}

class GetAllChatUserLoadingState extends SocialStates {}

class GetAllChatUserSuccessState extends SocialStates {}

class SocialGetSavedPostLoadingState extends SocialStates {}

class SocialGetSavedPostSuccessState extends SocialStates {}

class SocialCreateCommentsSuccessState extends SocialStates {}

class SocialGetCommentsLoadingState extends SocialStates {}

class SocialGetCommentsSuccessState extends SocialStates {}

class GetNotificationsSuccessState extends SocialStates {}

class GetNotificationsLoadingState extends SocialStates {}

class SocialSavePostSuccessState extends SocialStates {}

class SocialLikesSuccessState extends SocialStates {}

class GetPostPersonalLoadingState extends SocialStates {}

class GetPostPersonalSuccessState extends SocialStates {}

class GetPostLoadingState extends SocialStates {}

class GetPostSuccessState extends SocialStates {}
