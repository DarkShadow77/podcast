import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/audio.dart';
import '../screens/author.dart';
import '../utils/colors.dart';
import '../widgets/back_arrow.dart';
import '../widgets/background.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/podcast_popover.dart';
import 'podcast_episode.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isExpanded = true;
  bool isExpanded2 = true;
  late ScrollController _scrollController;

  bool _isScrolled = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    super.initState();
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 50.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.all(10),
                      height:
                          isExpanded ? size.height * 0.5 : size.height * 0.80,
                      curve: Curves.easeOutCirc,
                      duration: Duration(milliseconds: 700),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lightgrey.withOpacity(0.7),
                            blurRadius: 10,
                            offset: Offset(7, 7),
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(isExpanded ? 30 : 30),
                        ),
                      ),
                      child: Stack(
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                AppColors.backgroundColor, BlendMode.color),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/ted.png"),
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.lightgrey.withOpacity(0.70),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    BackArrow(
                                      borderColor: AppColors.lightgrey,
                                      iconColor: AppColors.whiteColor,
                                      press: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return AudioPage();
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: size.width * 0.7,
                                    )
                                  ],
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: AppColors.containerone,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage("assets/ted.png"),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Ted Talks Daily",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return AuthorPage();
                                              },
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  width: 2,
                                                  color: Colors.white54),
                                            ),
                                          ),
                                          child: Text(
                                            "Ted",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: size.width * 0.48,
                                            height: size.width * 0.11,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                colors: [
                                                  AppColors.containerone
                                                      .withOpacity(0.80),
                                                  AppColors.containertwo,
                                                  AppColors.containerthree
                                                      .withOpacity(0.90),
                                                ],
                                                stops: [
                                                  0.03,
                                                  0.4,
                                                  0.6,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 22,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Follow",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: size.width * 0.1,
                                            height: size.width * 0.11,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.white54,
                                                  width: 1),
                                            ),
                                            child: Icon(
                                              Icons.share_outlined,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Every weekday, TED Talks Daily brings you the latest talks in audio. Join host and journalist Elise Hu for thought-provoking ideas on every subject imaginable -- from Artificial Intelligence to Zoology, and everything in between -- given by the world's leading thinkers and creators. With TED Talks Daily, find some space in your day to change your perspectives, ignite your curiosity, and learn something new.",
                                        maxLines: isExpanded ? 3 : 11,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          height: 2,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: AnimatedContainer(
                    height:
                        isExpanded ? size.height * 0.42 : size.height * 0.12,
                    curve: Curves.easeOutCirc,
                    duration: Duration(milliseconds: 700),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                    ),
                    child: CustomScrollView(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              SizedBox(
                                height: 88,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomBar(),
        ],
      ),
    );
  }

  void _handleFABPressed() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => Podcast_Popover(),
    );
  }
}
