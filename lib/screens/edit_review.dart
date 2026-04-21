import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../models/review.dart';
import '../providers/review_list.dart';
import 'about_book_screen.dart';

class EditReview extends StatefulWidget {
  static String routeName = '/edit-review';



  @override
  State<EditReview> createState() => _EditReviewState();
}


class _EditReviewState extends State<EditReview> {
  var form = GlobalKey<FormState>();
  String? review;
  int? rating;
  void updateReview(int i, reviewList) { //update review function
    // ReviewList reviewList = Provider.of<ReviewList>(context);
    // List <Review> myReviews = reviewList.updateReview(i, review, rating);
    // Review selectedItem =
    // ModalRoute.of(context)?.settings.arguments as Review;
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      print(review);
      print(rating.toString());
      reviewList.updateReview(i, review, rating, reviewList);
      // Hide the keyboard
      FocusScope.of(context).unfocus();
      // Resets the form
      // form.currentState!.reset();
      // consumptionDate = null;
      // Shows a SnackBar
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    Review selectedItem = arguments['selected'] as Review; //brings over the values on the selected review to edit
    int index = arguments['index'] as int;
    ReviewList reviewList = Provider.of<ReviewList>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit a review',
            style: TextStyle(fontFamily: "Caladea", fontSize: 26),
          ),
          backgroundColor: Color(0xFFddbea9),
          actions: [
            IconButton(onPressed: () {
              if (review == null) {
                review = selectedItem.review;}
              if (rating == null) {
                rating = selectedItem.rating;}
              updateReview(index, reviewList);//if review/rating was not edited, it will register as the selected value
              Navigator.of(context).pop();
                }, icon: Icon(Icons.save))
          ],
        ),
        body: Container(
          color: Color(0xFFfff1e6),
          padding: EdgeInsets.all(10),
          child: Form(
            key: form, // a form
            child: Column(
              children: [
                TextFormField(
                    initialValue: selectedItem.review, // original selected value of the review
                    cursorColor: Color(0xffA5A58D),
                    decoration: InputDecoration(label: Text('Review'),
                      labelStyle: TextStyle(fontFamily: "Caladea",
                        fontSize: 20, color: Color(0xffCB997E), //label style
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffA5A58D)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffA5A58D)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffA5A58D)),
                      ),
                    ),
                    onSaved: (value) { review = value; },
                    validator: (value) { //makes sure values are valid
                      if (value == null)
                        return "Please provide a review.";
                      else if (value.length < 5)
                        return 'Please enter a review that is at least 5 characters.';
                      else
                        return null;
                    }
                ),
                SizedBox(height: 10,),
                DropdownButtonFormField(
                  value: selectedItem.rating, //original selected values on rating
                  decoration: InputDecoration(
                    label: Text('Rating'),labelStyle: TextStyle(fontFamily: "Caladea",
                    fontSize: 20, color: Color(0xffCB997E), //label style
                  ),
                  ),
                  iconEnabledColor: Color(0xffA5A58D),
                  iconDisabledColor: Color(0xffb7b7a4),
                  items: [
                    DropdownMenuItem(child: Text('1'), value: 1),
                    DropdownMenuItem(child: Text('2'), value: 2),
                    DropdownMenuItem(child: Text('3'), value: 3),
                    DropdownMenuItem(child: Text('4'), value: 4),
                    DropdownMenuItem(child: Text('5'), value: 5),
                  ],
                  onChanged: (value) { rating = value as int; },
                  validator: (value) { //makes sure values are valid
                    if (value == null)
                      return "Please provide a rating.";
                    else
                      return null;
                  },
                  style: TextStyle(
                      color: Color(0xffCB997E),
                      fontSize: 18,
                      fontFamily: "Lucida Bright"
                  ),
                  dropdownColor: Color(0xFFfff1e6),
                ),
              ],
            ),
          ),
          // )
        ));
  }
}