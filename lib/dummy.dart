// practiced on class
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DummyShared extends StatefulWidget {
//   const DummyShared({super.key});

//   @override
//   State<DummyShared> createState() => _DummySharedState();
// }

// class _DummySharedState extends State<DummyShared> {
//   final TextEditingController _nameController = TextEditingController();
//   String _displayName = "no name";

//   Future<void> _saveName() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userName', _nameController.text);
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text("Name saved successfully!")));
//   }

//   Future<void> _getName() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? name = prefs.getString('userName');
//     setState(() {
//       _displayName = name ?? "No name saved";
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getName();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         padding: EdgeInsets.all(10),
//         child: ListView(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 hintText: "Enter your Name",
//                 label: Text("your name"),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(onPressed: _saveName, child: Text("save data")),
//             ElevatedButton(onPressed: _getName, child: Text("getName:")),
//             Text("name:$_displayName"),
//           ],
//         ),
//       ),
//     );
//   }
// }
