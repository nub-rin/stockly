import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/home_trending_model.dart';
import '../utils/user_data.dart';

class HomeFavList extends StatelessWidget {
  const HomeFavList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20, left: 20),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Trending Stocks',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // ! TODO
      ],
    );
  }
}
