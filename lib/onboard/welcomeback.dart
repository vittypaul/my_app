import 'package:flutter/material.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Image(
              image: AssetImage('build/assets/images/111.jpeg'),
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'You\'ve been missed.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            _buildGoogleSignInBlock(),
            const SizedBox(height: 10),
            const InputField(label: 'Email Address', icon: Icons.email),
            const SizedBox(height: 10),
            const InputField(
                label: 'Password', isPassword: true, icon: Icons.lock),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign in button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 40,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoogleSignInBlock() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 8), // Adjusted padding
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle Google sign in button press
                },
                child: Column(
                  children: [
                    Image.asset('build/assets/images/google.png',
                        height: 30), // Adjusted height
                    const SizedBox(height: 6), // Adjusted spacing
                  ],
                ),
              ),
              const SizedBox(width: 6), // Adjusted spacing
              const Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        _buildDivider(),
      ],
    );
  }

  Widget _buildDivider() {
    return const Row(
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
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WelcomeBackScreen(),
  ));
}
