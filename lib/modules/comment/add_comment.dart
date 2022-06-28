// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../layout/cubit/cubit.dart';
// import '../../layout/cubit/states.dart';
// import '../../shared/components/components.dart';
//
// class CreateCommentScreen extends StatelessWidget {
//   var textController = TextEditingController();
//
//   CreateCommentScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var userModel = SocialCubit.get(context).userModel;
//     var profileImage = SocialCubit.get(context).profileImage;
//
//     return BlocConsumer<SocialCubit, SocialStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Create comment'),
//             actions: [
//               defaultTextButton(
//                 function: () {
//                   var now = DateTime.now();
//                   SocialCubit.get(context).createComments(
//                     dateTime: now.toString(),
//                     text: textController.text,
//                   );
//                 },
//                 text: 'Post',
//               ),
//             ],
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                         radius: 25.0,
//                         backgroundImage: profileImage == null
//                             ? NetworkImage(
//                                 '${userModel!.image}',
//                               )
//                             : FileImage(profileImage) as ImageProvider),
//                     const SizedBox(
//                       width: 15.0,
//                     ),
//                     const Expanded(
//                       child: const Text(
//                         'Mena Ayman',
//                         style: TextStyle(
//                           height: 1.4,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: TextFormField(
//                     controller: textController,
//                     decoration: const InputDecoration(
//                       hintText: 'Write a Comment ...',
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
