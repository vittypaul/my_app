import 'package:flutter/material.dart';
import 'package:my_app/onboard/welcomeback.dart';
// ignore: unused_import
import 'welcomeback_screen.dart'; // Import the WelcomeBackScreen

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Handle skip button press
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Create an account',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const InputField(label: 'First Name'),
            const InputField(label: 'Last Name'),
            const InputField(label: 'Email Address', icon: Icons.email),
            const InputField(
                label: 'Password', isPassword: true, icon: Icons.lock),
            const SizedBox(height: 30), // Increased space below password field
            ElevatedButton(
              onPressed: () {
                // Handle create account button press
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeBackScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40), // Increased horizontal padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'or',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Handle continue with Google button press
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('build/assets/images/google.png', height: 26),
                  const SizedBox(width: 10),
                  const Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final IconData? icon;

  const InputField({
    Key? key,
    required this.label,
    this.isPassword = false,
    this.icon,
  });

  @override
  // ignore: library_private_types_in_public_api
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextField(
        obscureText: widget.isPassword && !_isPasswordVisible,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
