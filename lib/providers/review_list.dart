import 'package:flutter/material.dart';

import '../models/review.dart';
class ReviewList with ChangeNotifier {
  List <Review> myReviews = [];
  List<Review> getMyReviews() {
    return myReviews;
  }
  void addReview(review, rating, bookName) {
    myReviews.insert(0, Review(review : review, rating : rating, bookName: bookName));
    notifyListeners();
  }
  void deleteReview(i) {
    myReviews.removeAt(i);
    notifyListeners();
  }
  updateReview(i, review, rating, reviewList) {
    myReviews[i].review = review;
    myReviews[i].rating = rating;
    notifyListeners();
  }
}