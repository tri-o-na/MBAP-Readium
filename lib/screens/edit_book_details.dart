import 'package:flutter/material.dart';

import '../models/book.dart';

class EditBookDetails extends StatelessWidget {

  final Book book;

  EditBookDetails(this.book);

  //THIS PAGE HAS BEEN REMOVED FROM DEVICE

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit',
          style: TextStyle(fontFamily: "Caladea", fontSize: 26),
        ),
        backgroundColor: Color(0xFFddbea9),
      ),
      body: SingleChildScrollView( //makes the page scrollable
        child: Container(
            color: Color(0xFFfff1e6),
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Card(
                  color: Color(0xffF9EADF),
                  margin: const EdgeInsets.fromLTRB(10, 0, 8, 7),
                  child: ListTile(
                    title: Text(book.bookName, style:
                    TextStyle(
                        color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                        fontSize: 18),),
                    subtitle: Text("Title", style:
                    TextStyle(color: Color(0xffBCB9A4), fontFamily: "Caladea",
                        fontSize: 14),),
                    // onTap: () {
                    //   showDialog(
                    //       context: context,
                    //       builder: (context) => AlertDialog(
                    //         backgroundColor: Color(0xffD4AC94),
                    //         title: Text('Edit Title'),
                    //         titleTextStyle: TextStyle(fontFamily: "Lucida Bright",
                    //             fontSize: 21, color: Color(0xffFFF1E6), fontWeight: FontWeight.bold),
                    //         contentTextStyle: TextStyle(fontFamily: "Caladea", fontSize: 21, color: Color(0xffCB997E),),
                    //         content: TextFormField(
                    //           decoration: InputDecoration(
                    //             enabledBorder: UnderlineInputBorder(
                    //               borderSide: BorderSide(color: Color(0xffFFF1E6)),
                    //             ),
                    //             focusedBorder: UnderlineInputBorder(
                    //               borderSide: BorderSide(color: Color(0xffFFF1E6)),
                    //             ),
                    //             border: UnderlineInputBorder(
                    //               borderSide: BorderSide(color: Color(0xffFFF1E6)),
                    //             ),
                    //           ),
                    //         ),
                    //         actions: [
                    //           TextButton(
                    //               onPressed: (){},
                    //               child: Text('SUBMIT', style:
                    //               TextStyle(fontFamily: "Caladea",
                    //                   fontSize: 16, color: Color(0xffFFF1E6),
                    //                   fontWeight: FontWeight.bold),))
                    //         ],
                    //       )
                    //   );
                    // },
                  ),
                ),
                Card(
                  color: Color(0xffF9EADF),
                  margin: const EdgeInsets.fromLTRB(10, 0, 8, 7),
                  child: ListTile(
                    title: Text(book.authorName, style:
                    TextStyle(
                        color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                        fontSize: 18),),
                    subtitle: Text("Author", style:
                    TextStyle(color: Color(0xffBCB9A4), fontFamily: "Caladea",
                        fontSize: 14),),
                  ),
                ),
                Card(
                  color: Color(0xffF9EADF),
                  margin: const EdgeInsets.fromLTRB(10, 0, 8, 7),
                  child: ListTile(
                    title: Text(
                      book.seriesName + " #" + book.seriesNo.toString(), style:
                    TextStyle(
                        color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                        fontSize: 18),),
                    subtitle: Text("Series", style:
                    TextStyle(color: Color(0xffBCB9A4), fontFamily: "Caladea",
                        fontSize: 14),),
                  ),
                ),
                Card(
                  color: Color(0xffF9EADF),
                  margin: const EdgeInsets.fromLTRB(10, 0, 8, 7),
                  child: ListTile(
                    title: Text(book.description, style:
                    TextStyle(
                        color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                        fontSize: 18),),
                    subtitle: Text("Description", style:
                    TextStyle(color: Color(0xffBCB9A4), fontFamily: "Caladea",
                        fontSize: 14),),
                  ),
                ),
                Card(
                  color: Color(0xffF9EADF),
                  margin: const EdgeInsets.fromLTRB(10, 0, 8, 7),
                  child: ListTile(
                    title: Text(book.language, style:
                    TextStyle(
                        color: Color(0xffcb997e), fontFamily: "Lucida Bright",
                        fontSize: 18),),
                    subtitle: Text("Language", style:
                    TextStyle(color: Color(0xffBCB9A4), fontFamily: "Caladea",
                        fontSize: 14),),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
// Future editTitle() =>
//     showDialog(
//       builder: (context) =>
//           AlertDialog(
//             title: Text('Edit Title'),
//             content: TextFormField(
//               autofocus: true,
//               decoration: InputDecoration(
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xffA5A58D)),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xffA5A58D)),
//                 ),
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xffA5A58D)),
//                 ),
//               ),
//             ),
//             actions: [
//               TextButton(
//                   onPressed: () {},
//                   child: Text('SUBMIT')
//               )
//             ],
//           ),
//       context: context,
//     );
