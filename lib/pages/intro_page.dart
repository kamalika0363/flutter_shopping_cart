import 'package:flutter/material.dart';
import 'package:shopping_cart/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.only(
              top: 160.0,
              bottom: 40.0,
              left: 80.0,
              right: 80.0,
            ),
            child: Image.asset('lib/images/avocado.png'),
          ),

          // we deliver text
           Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "We deliver groceries at your doorstep!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(
            height: 24,
          ),
          // fresh items everyday
          const Text(
            "Fresh items everyday",
            style: TextStyle(
              color: Color.fromRGBO(156, 155, 155, 1),
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),

          const Spacer(),

          // getting started
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage())),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12.0)),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
