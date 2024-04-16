import 'package:flutter/material.dart';

class BannersCardWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final String url;
  final String titleDescription;
  final String subtitleDescription;
  const BannersCardWidget({
    super.key,
    required this.constraints,
    required this.url,
    required this.titleDescription,
    required this.subtitleDescription,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth / 1.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              url,
              fit: BoxFit.fill,
              height: constraints.maxHeight * 0.18,
              width: constraints.maxWidth / 1.5,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(titleDescription),
            subtitle: Text(subtitleDescription),
          )
        ],
      ),
    );
  }
}
