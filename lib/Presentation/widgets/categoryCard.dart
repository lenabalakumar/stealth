import 'package:flutter/material.dart';

Widget categoryCard(String key, String value, BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed('$key');
          },
          child: Container(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                value,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Text(key),
    ],
  );
}
