import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:podcast/screens/settings.dart';
import 'package:podcast/utils/colors.dart';
import 'package:podcast/widgets/backgound.dart';

import '../screens/home.dart';
import '../widgets/back_arrow.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
      child: CustomScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: true,
            elevation: 0,
            pinned: true,
            expandedHeight: 70,
            automaticallyImplyLeading: false,
            floating: true,
            backgroundColor: AppColors.backgroundColor,
            bottom: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              backgroundColor: Colors.transparent,
              titleSpacing: 0,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackArrow(
                      borderColor: AppColors.lightgrey,
                      iconColor: AppColors.whiteColor,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SettingsPage();
                            },
                          ),
                        );
                      },
                      child: Icon(
                        Icons.settings_rounded,
                        color: Colors.white70,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepOrangeAccent,
                            gradient: LinearGradient(
                              colors: [
                                Colors.orangeAccent,
                                AppColors.containertwo,
                                AppColors.containerone,
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.backgroundColor,
                                width: 5,
                              ),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.scaleDown,
                                image: AssetImage(
                                  "assets/images/music_thumbnail.jpg",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Mohammad Reza",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "dadeshina4@gmail.com",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.manage_accounts_outlined,
                                  color: AppColors.lightgrey,
                                  size: 32,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white70,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Divider(
                          height: 1,
                          thickness: 1.5,
                          color: AppColors.lightgrey.withOpacity(0.50),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite_border_rounded,
                                  color: AppColors.lightgrey,
                                  size: 32,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  "Liked",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white70,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Divider(
                          height: 1,
                          thickness: 1.5,
                          color: AppColors.lightgrey.withOpacity(0.50),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.history_rounded,
                                  color: AppColors.lightgrey,
                                  size: 32,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  "History",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white70,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Divider(
                          height: 1,
                          thickness: 1.5,
                          color: AppColors.lightgrey.withOpacity(0.50),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.downloading_rounded,
                                  color: AppColors.lightgrey,
                                  size: 32,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  "Downloads",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white70,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Version 1.4.2",
                    style: TextStyle(
                      color: AppColors.lightgrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
