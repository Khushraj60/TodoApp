import 'package:dfgh/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //Here we are saving data of name ,email and password using shared_preference widget
  Future<void> _signUp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);
    //scaffholdmessenger is being used for showing snackbar widget where sign up successful  appears
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Sign up successful!")));

    Navigator.of(context).pop(); // Go back to the login screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Image.asset("assets/images/lo.png", height: 100, width: 100),
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const Text("Create a new account.", style: TextStyle(fontSize: 12)),
            const SizedBox(height: 24),
            CustomTextField(
              // First extracted widget textfield and named it customTextfield
              // and it is being reused here
              controller: nameController,
              label: 'Name',
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Icons.person_outline, size: 24),
            ),
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
              label: 'Password',
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(Icons.lock_outline_rounded, size: 24),
            ),
            const SizedBox(height: 12),
            CustomButton(
              label: "Sign Up",
              onPressed: _signUp,
            ), // _signUp is used to invoke function _signUp  which we have created to dtore our data locally
          ],
        ),
      ),
    );
  }
}
