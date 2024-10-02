import 'package:flutter/material.dart'; 

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  final Color? imageColor;
  final double? heightBetween;
  final String image, title, subTitle;
  final double imageHeight;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image.asset(
          image,
          color: imageColor,
          height: size.height * imageHeight,
        ),
        SizedBox(height: heightBetween),
<<<<<<< HEAD
        Text(title, style:  Theme.of(context).textTheme.displayLarge,),
        Text(subTitle,textAlign: textAlign, style:  Theme.of(context).textTheme.bodyLarge,),
=======
        Text(title, style:  Theme.of(context).textTheme.headlineSmall,),
        Text(subTitle,textAlign: textAlign, style:  Theme.of(context).textTheme.bodySmall,),
>>>>>>> 6398486b7b646d01f08ceec2851eebf41965140f
      ],
    );
  }
}