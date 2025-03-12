// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPrefences extends StatefulWidget {
//   const SharedPrefences({super.key});

//   @override
//   State<SharedPrefences> createState() => _SharedPrefencesState();
// }

// class _SharedPrefencesState extends State<SharedPrefences> {
//   final TextEditingController _nameController = TextEditingController();
//   String _displayName = "No name saved";
//   Future<void> _saveName() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userName', _nameController.text);
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text("Name saved successfully!")));
//   }

//   Future<void> _retrieveName() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? name = prefs.getString('userName');
//     setState(() {
//       _displayName = name ?? "No name saved";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Shared Preferences Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: "Enter your name"),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(onPressed: _saveName, child: Text("Save Name")),
//             ElevatedButton(
//               onPressed: _retrieveName,
//               child: Text("Retrieve Name"),
//             ),
//             SizedBox(height: 16),
//             Text("Saved Name: $_displayName", style: TextStyle(fontSize: 20)),
//           ],
//         ),
//       ),
//     );
//   }
// }
