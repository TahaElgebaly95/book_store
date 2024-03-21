import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset('assets/images/ktaby.png'),
        const SizedBox(height: 40),
        const Text(
          'Join Us!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xff32AFB5),
          ),
        ),
      ],
    );
  }
}
