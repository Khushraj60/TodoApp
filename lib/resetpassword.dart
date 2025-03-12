// import 'package:dfgh/login.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ResetPasswordScreen extends StatefulWidget {
//   const ResetPasswordScreen({super.key});

//   @override
//   State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
// }

// class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController newPasswordController = TextEditingController();

//   Future<void> _resetPassword() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? storedName = prefs.getString('name');

//     if (nameController.text == storedName) {
//       await prefs.setString('password', newPasswordController.text);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Password reset successful!")),
//       );
//       Navigator.of(context).pop(); // Go back to the login screen
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Name does not match our records")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 100),
//             Image.asset("assets/images/lo.png", height: 100, width: 100),
//             const Text(
//               "Reset Password",
//               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               "Enter your name and new password.",
//               style: TextStyle(fontSize: 12),
//             ),
//             const SizedBox(height: 24),
//             CustomTextField(
//               controller: nameController,
//               label: 'Name',
//               keyboardType: TextInputType.name,
//               prefixIcon: const Icon(Icons.person_outline, size: 24),
//             ),
//             CustomTextField(
//               controller: newPasswordController,
//               label: 'New Password',
//               obscureText: true,
//               keyboardType: TextInputType.visiblePassword,
//               prefixIcon: const Icon(Icons.lock_outline_rounded, size: 24),
//             ),
//             const SizedBox(height: 12),
//             CustomButton(label: "Reset Password", onPressed: _resetPassword),
//           ],
//         ),
//       ),
//     );
//   }
// }
