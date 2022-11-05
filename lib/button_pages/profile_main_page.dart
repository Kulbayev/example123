// import 'package:flutter/material.dart';
//
// import '../model/user.dart';
//
// class ProfileMainPage extends StatelessWidget {
//
//   final User userInfo;
//   const ProfileMainPage({Key? key, required this.userInfo}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Info'),
//         centerTitle: true,
//       ),
//       body: Card(
//         margin: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text(
//                 userInfo.fullname,
//                 style: const TextStyle(fontWeight: FontWeight.w500),
//               ),
//               leading: const Icon(
//                 Icons.person,
//                 color: Colors.black,
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 userInfo.username,
//                 style: const TextStyle(fontWeight: FontWeight.w500),
//               ),
//               leading: const Icon(
//                 Icons.person_add,
//                 color: Colors.black,
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 userInfo.phone,
//                 style: const TextStyle(fontWeight: FontWeight.w500),
//               ),
//               leading: const Icon(
//                 Icons.phone,
//                 color: Colors.black,
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 userInfo.email.isEmpty ? 'Not specified' : userInfo.email,
//                 style: const TextStyle(fontWeight: FontWeight.w500),
//               ),
//               leading: const Icon(
//                 Icons.mail,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }