import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egytour/layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/users.dart';
import '../../shared/components/constants.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialStates());

  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? model;

  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      // print(value.data());
      model = SocialUserModel.fromjson(value.data() as Map<String, dynamic>);
      emit(SocialGetUserSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorStates(error.toString()));
    });
  }
}
// ( FirebaseAuth.instance.currentUser!).uid
