import 'package:dfgh/home.dart';
import 'package:dfgh/signup.dart';
// import 'package:dfgh/resetpassword.dart';
// import 'package:dfgh/reset_password.dart'; // Import the reset password screen
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRememberMe = false;
  // Here with the help of shared preference... data of email and password is being saved locally
  Future<void> _login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');
    // Here if clause is used  to make sure only user  can login if they have already signed up and they have to use same email and password for login
    if (emailController.text == storedEmail &&
        passwordController.text == storedPassword) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => Home()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email or password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Image.asset("assets/images/lo.png", height: 100, width: 100),
            const Text(
              "Login",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Welcome, Let's log you in.",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              // First extracted widget textfield and named it customTextfield
              // and it is being reused here
              controller: emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,

              prefixIcon: const Icon(Icons.email_outlined, size: 24),
            ),
            CustomTextField(
              // First extracted widget textfield and named it customTextfield
              // and it is being reused here
              controller: passwordController,

              //style: TextStyle(color: Colors.black ),
              label: 'Password',
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(Icons.lock_outline_rounded, size: 24),
            ),
            Row(
              children: [
                Checkbox(
                  value: isRememberMe,
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      isRememberMe =
                          value ??
                          false; //here the value is checked and it can be either true or false if true checkbox value will be true
                    });
                  },
                ),
                const Text("Remember me", style: TextStyle(fontSize: 12)),
                const Spacer(),

                const Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 12, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // First extracted widget Elevatedbutton and named it custombutton
            // and it is being reused here
            CustomButton(label: "Login", onPressed: _login),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: const Text("SignUp"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Button Widget
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Makes the button full-width
      height: 48, // Standard button height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ), // Rounded button corners
          backgroundColor: Colors.black, // Button background color
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white), // Button text color
        ),
      ),
    );
  }
}

// Custom Text Field Widget
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    required this.keyboardType,
    required this.prefixIcon,
  });

  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText:
            obscureText, // Determines whether text should be hidden (for passwords)
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelText: label, // Adds a label to the input field
          filled: true,
          fillColor:
              Colors
                  .grey
                  .shade200, // Light gray background for better UI contrast
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8,
            ), // Rounded corners for better aesthetics
            borderSide: BorderSide.none, // Removes the border
          ),
        ),
      ),
    );
  }
}
