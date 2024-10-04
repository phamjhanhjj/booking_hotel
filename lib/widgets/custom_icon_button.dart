import 'package:booking_hotel/screens/booking_screens/history_booking.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final Function()? onPressed;
  final double size;

  const CustomIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookingScreen()),
            );
          }
        },
        icon: icon,
      ),
    );
  }
}
