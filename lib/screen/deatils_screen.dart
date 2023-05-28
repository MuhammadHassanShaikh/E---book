import 'dart:math';

import 'package:ebook1/constraints.dart';
import 'package:ebook1/widgets/book_rating.dart';
import 'package:ebook1/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: size.height * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bg.png"),
                        fit: BoxFit.fitWidth,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24), //24
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: size.height * .1, //1
                        ),
                        BookInfo(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .4 - 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ChapterCard(
                        name: 'Money',
                        chapterNumber: 1,
                        press: () {},
                        tag: 'Life is about change',
                      ),
                      ChapterCard(
                        name: 'Money',
                        chapterNumber: 2,
                        press: () {},
                        tag: 'Everything loves power',
                      ),
                      ChapterCard(
                        name: 'Influence',
                        chapterNumber: 3,
                        press: () {},
                        tag: 'Influence easily like never before',
                      ),
                      ChapterCard(
                        name: 'Win',
                        chapterNumber: 4,
                        press: () {},
                        tag: 'Wining is what matters',
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.displayMedium,
                          children: [
                        TextSpan(text: "You might also "),
                        TextSpan(
                            text: "like... .",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 180,
                        width: double.infinity,
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 24, top: 24, right: 150),
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(29),
                                color: Color(0xFFFFF8F9)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RichText(
                                    text: TextSpan(
                                        style: TextStyle(color: kLightBlackColor),
                                        children: [
                                      TextSpan(
                                        text:
                                            "How to win \nFriends & Influence \n",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      TextSpan(
                                          text: "Gary Venchuk",
                                          style: TextStyle(
                                            color: kLightBlackColor,
                                          ))
                                    ])),
                                Row(
                                  children: <Widget>[
                                    BookRating(score: 4.9
                                    ),
                                    SizedBox(width: 20,),
                                    Expanded(child: RoundedButton(text: "Read", 
                                    verticalPadding: 10,
                                    press: (){}))
                                  ],
                                )
                              ],
                            ),
                          )),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Image.asset(
                            "assets/images/book-3.png",
                            width: 150,
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

class ChapterCard extends StatelessWidget {
  final String name;
  final String tag;
  final int chapterNumber;
  final VoidCallback press;
  const ChapterCard({
    super.key,
    required this.name,
    required this.tag,
    required this.chapterNumber,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: size.width - 48,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(38.5),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10), blurRadius: 33, color: Color(0xFFD3D3D3))
          ]),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Chapter $chapterNumber : $name\n",
                  style: TextStyle(
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(text: tag, style: TextStyle(color: kLightBlackColor))
            ]),
          ),
          Spacer(),
          IconButton(
              onPressed: press,
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ))
        ],
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Crushing &",
                style: Theme.of(context).textTheme.bodyMedium, //displaymedium
              ),
              Text(
                "Influence",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5, //5
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "When the earth is flat and everyone wanted of the best and people  and winning with an A game with all the things you have",
                          maxLines: 6, //5
                          style: TextStyle(
                            fontSize: 10,
                            color: kLightBlackColor,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RoundedButton(
                          text: "Read",
                          press: () {},
                          verticalPadding: 10,//10
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.favorite_border)),
                      BookRating(score: 4.9)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Image.asset(
          "assets/images/book-1.png",
          height: 150, //200
        )
      ],
    );
  }
}
