// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HTTPTestePage extends StatefulWidget {
//   const HTTPTestePage({super.key});

//   @override
//   State<HTTPTestePage> createState() => _HTTPTestePageState();
// }

// class _HTTPTestePageState extends State<HTTPTestePage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(),
//         body: Container(),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             var response =
//                 await http.get(Uri.parse('https://www.google.com.br')).then(
//               (response) {
//                 print(response.statusCode);
//               },
//             );
//           },
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
