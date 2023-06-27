import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vikings/core/core.dart';

class RateDialog extends StatefulWidget {
  const RateDialog({
    super.key,
    required this.onRated,
  });

  final ValueChanged<double> onRated;

  @override
  State<RateDialog> createState() => _RateDialogState();
}

class _RateDialogState extends State<RateDialog> {
  String review = '';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      backgroundColor:
          isDark ? Theme.of(context).primaryColorDark : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar(
              initialRating: 5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              unratedColor: Colors.amber,
              glow: false,
              maxRating: 5,
              minRating: 1,
              updateOnDrag: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                half: const Icon(
                  Icons.star_half_rounded,
                  color: Colors.amber,
                ),
                empty: const Icon(
                  Icons.star_outline_rounded,
                  color: Colors.amber,
                ),
              ),
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: widget.onRated,
            ),
            const SizedBox(height: 20),
            AppTextField(
              hintText: 'Tell us what you think about this session',
              minLines: 3,
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  review = value;
                });
              },
            ),
            const SizedBox(height: 20),
            AppAdaptivePrimaryButton(
              onPressed: () {
                Navigator.of(context).pop(review);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
