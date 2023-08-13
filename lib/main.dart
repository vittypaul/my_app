import 'package:flutter/material.dart';

import 'onboard/createaccount.dart';

void main() {
  runApp(const OnboardApp());
}

class OnboardApp extends StatelessWidget {
  const OnboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Buzz',
      theme: ThemeData(
        primaryColor: Colors.black12,
      ),
      home: const OnboardScreens(),
    );
  }
}

class OnboardScreens extends StatefulWidget {
  const OnboardScreens({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardScreensState createState() => _OnboardScreensState();
}

class _OnboardScreensState extends State<OnboardScreens> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardPage> _pages = [
    const OnboardPage(
      imageUrl: 'build/assets/images/buzz.jpg',
      title: 'Welcome to Campus',
      description: 'This is a sample app with onboard screens.',
      bgColor: Colors.white,
    ),
    const OnboardPage(
      imageUrl: 'build/assets/images/sports.jpg',
      title: 'Discover Amazing Buzz',
      description: 'Explore the exciting features of the app.',
      bgColor: Colors.white,
    ),
    const OnboardPage(
      imageUrl: 'build/assets/images/third.jpg',
      title: 'Enjoy Pandagoo Aravind Bhai',
      description: 'Start using the app and enjoy!',
      bgColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Campus',
                style: TextStyle(
                  color: Color(0xFF112031), // Set text color to #112031
                ),
              ),
              TextSpan(
                text: 'Buzz',
                style: TextStyle(
                  color: Color(0xFFE93030), // Set text color to #E93030
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  // Handle skip button
                  _pageController.jumpToPage(_pages.length - 1);
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
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _pages[index],
                  if (index == _pages.length - 1)
                    Column(
                      children: [
                        const SizedBox(
                            height: 0), // Set height to 0 between buttons
                        _buildGetStartedButton(context),
                        const SizedBox(
                            height: 0), // Set height to 0 between buttons
                        _buildSignInButton(),
                      ],
                    ),
                ],
              );
            },
          ),
          if (_currentPage != _pages.length - 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: _buildPageIndicator(),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.black,
                      elevation: 0.0,
                      onPressed: () {
                        if (_currentPage != _pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // Handle navigation to the next screen after onboarding
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateAccountScreen(),
                            ),
                          );
                        }
                      },
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _pages.length; i++) {
      indicators.add(
        i == _currentPage ? _indicator(true) : _indicator(false),
      );
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 4.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          // Handle Get Started button press
          // Navigate to the CreateAccountScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateAccountScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(49),
          ),
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: TextButton(
        onPressed: () {
          // Handle Sign In button press
          // You can navigate to the sign-in screen or perform any action here
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(504),
          ),
        ),
        child: const Text(
          'Sign In',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(204, 6, 0, 15),
          ),
        ),
      ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final Color bgColor;

  const OnboardPage(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imageUrl, height: 400),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
