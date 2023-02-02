// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';

class Rating extends StatefulWidget {
  final int maximumRating;
  final Function? onRatingChanged;
  final int currentRating;
  const Rating(
      {this.maximumRating = 5,
      required this.onRatingChanged,
      required this.currentRating});
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index < currentRating) {
      return const Icon(Icons.star, color: healthcloudAccentColor, size: 50);
    } else {
      return Icon(Icons.star_border, color: Colors.grey[400], size: 50);
    }
  }

  Widget _buildBody() {
    final List<Widget> stars =
        List<Widget>.generate(this.widget.maximumRating, (int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            currentRating = index + 1;
          });

          this.widget.onRatingChanged!(currentRating);
        },
        child: _buildRatingStar(index),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: stars,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
