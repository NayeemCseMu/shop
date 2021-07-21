import 'package:flutter/material.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    @required this.widgetChild,
    @required this.height,
  });
  final Widget? widgetChild;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(bottom: 10),
      decoration: boxDecoration(),
      child: widgetChild,
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 4,
          color: Colors.black.withOpacity(0.25),
        ),
      ],
    );
  }
}
