import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readium_v1/screens/edit_review.dart';
import 'package:readium_v1/screens/favourites_page.dart';

import '../models/book.dart';
import '../models/review.dart';
import '../providers/book_list.dart';
import '../providers/review_list.dart';

class ReviewsList extends StatefulWidget {

  List<Review> myReviews;
  Function removeItem;
  String bookName;
  ReviewsList(this.myReviews, this.removeItem, this.bookName);





  @override
  State<ReviewsList> createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {

  void removeItem(int i, ReviewList myReviews) {
    showDialog<Null>(
        context: context,
        builder: (context) {
          return AlertDialog( //alert dialog when delete button is pressed
            backgroundColor: Color(0xffD4AC94),
            titleTextStyle: TextStyle(fontFamily: "Lucida Bright",
              fontSize: 21, color: Color(0xffFFF1E6), fontWeight: FontWeight.bold),
            contentTextStyle: TextStyle(fontFamily: "Caladea",
              fontSize: 21, color: Color(0xffFFF1E6),),
            title: Text('Confirmation'),
            content: Text('Are you sure you want to delete?'),
            actions: [
              TextButton(onPressed: (){
                setState(() {
                  myReviews.deleteReview(i);
                });
                Navigator.of(context).pop();
              }, child: Text('YES', style:
                  TextStyle(fontFamily: "Caladea",
                    fontSize: 16, color: Color(0xffFFF1E6),
                    fontWeight: FontWeight.bold),
                )
              ),
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('NO', style:
                  TextStyle(fontFamily: "Caladea",
                    fontSize: 16, color: Color(0xffFFF1E6),
                      fontWeight: FontWeight.bold),
              )
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    ReviewList reviewList = Provider.of<ReviewList>(context);
    List <Review> myReviews = reviewList.getMyReviews();
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9/6
            //grid view of reviews
        ),
        itemCount: myReviews.length,
        itemBuilder: (context, i) {
          return myReviews[i].bookName == widget.bookName? Container(
            //bookname of reviews needs to be equal to book name in about book to show up
            padding: EdgeInsets.fromLTRB(0, 0, 20, 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffB7B7A4),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 5,
                    child: SizedBox(
                      height: 90,
                      width: 145,
                      child: Text(reviewList.getMyReviews()[i].review,  style:
                          TextStyle(color: Color(0xffFFF1E6), fontFamily: "Lucida Bright",
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Positioned(
                    child: Text(reviewList.getMyReviews()[i].rating.toStringAsFixed(1),
                      style: TextStyle(color: Color(0xffFFF1E6), fontFamily: "Caladea",
                        fontSize: 18 , fontWeight: FontWeight.bold)),
                    bottom: 5,
                    left: 10,
                  ),
                  Positioned(
                    child: IconButton(
                      icon: Icon(Icons.delete, color: Color(0xffFFF1E6), size: 25),
                      onPressed: () {
                        removeItem(i, reviewList);
                      },
                    ),
                    left: 125,
                    top: 80,
                  ),
                Positioned(
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Color(0xffFFF1E6), size: 24),
                      onPressed: () {
                        Navigator.of(context).pushNamed(EditReview.routeName,
                            arguments:{'index': i, 'selected': reviewList.getMyReviews()[i]});
                        //navigate the use to edit review page with the review details as the argument
                        },
                    ),
                    left: 95,
                    top: 80,
                  ),
                ],
              ),
            ),
          ):Center();
        },
        // separatorBuilder: (ctx, i) {
        //   return Divider( height: 3, color: Color(0xffA5A58D));
        // },
        semanticChildCount: reviewList.getMyReviews().length, //show all the reviews that have been added
    );
  }
}
// return Card(
//   margin: const EdgeInsets.fromLTRB(0, 0, 20, 15),
//   color: Color(0xffB7B7A4),
//   child: ListTile(
//     onTap: (){},
//     title: Text(reviewList.getMyReviews()[i].review,  style:
//     TextStyle(color: Color(0xffFFF1E6), fontFamily: "Lucida Bright",
//         fontSize: 18, fontWeight: FontWeight.bold),),
//     subtitle: Text(reviewList.getMyReviews()[i].rating.toStringAsFixed(1),
//       style: TextStyle(color: Color(0xffeddcd2), fontFamily: "Caladea",
//         fontSize: 16 , fontWeight: FontWeight.bold),
//     ),
//
//     trailing: IconButton(
//       icon: Icon(Icons.delete, color: Color(0xffFFF1E6)),
//       onPressed: () {
//         removeItem(i, reviewList);
//       },
//     ),
//   ),
// );
