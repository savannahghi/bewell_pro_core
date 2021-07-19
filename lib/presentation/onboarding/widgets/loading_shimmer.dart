import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey[50]!,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.red,
              margin: const EdgeInsets.only(bottom: 20),
            ),
            for (int i = 0; i < 25; i++)
              Container(
                width: double.infinity,
                height: 10,
                color: Colors.red,
                margin: const EdgeInsets.only(bottom: 10),
              ),
          ],
        ),
      ),
    );
  }
}
