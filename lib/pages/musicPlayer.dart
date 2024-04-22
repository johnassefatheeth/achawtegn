// import 'package:flutter/material.dart';
// import 'package:musica/const/colors.dart';

// class musicPlayer extends StatefulWidget {
//   const musicPlayer({super.key});

//   @override
//   State<musicPlayer> createState() => _musicPlayerState();
// }

// class _musicPlayerState extends State<musicPlayer> {
//   @override
//   Widget build(BuildContext context) {
//     final texttheme= Theme.of(context).textTheme;
//     return  Scaffold(
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Icon(Icons.close,color: Colors.transparent),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "playin now",
//                     style: texttheme.bodyMedium?.copyWith(color: customColors.primaryColor),
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                         const CircleAvatar(
//                           backgroundColor:Colors.white ,
//                           backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEBqYEUHs9SPync2bo8AmdYjzW5WYicOWF8lreCXnMcQ&s'),
//                           radius: 10,
//                         ),
//                         Text("hagergna",
//                           style:texttheme.bodyLarge?.copyWith(color: Colors.white)
//                           ,
//                         )
//                     ],
//                   )
//                 ],
//                ),
//               const Icon(Icons.close)
//             ],
//           )

//         ],
//       ),
//     );
//   }
// }