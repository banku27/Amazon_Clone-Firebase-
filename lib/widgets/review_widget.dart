import 'package:amazon_clone/models/review_model.dart';
import 'package:amazon_clone/utils/constants.dart';

import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel review;
  const ReviewWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review.senderName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: FittedBox(
                      child: RatingStarWidget(
                        rating: review.rating,
                      ),
                    ),
                  ),
                ),
                Text(
                  keysOfRating[review.rating - 1],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Text(
            review.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
