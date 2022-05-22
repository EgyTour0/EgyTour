abstract class SocialStates {}

class SocialInitialStates extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessStates extends SocialStates {}

class SocialGetUserErrorStates extends SocialStates {
  final String error;

  SocialGetUserErrorStates(this.error);
}
