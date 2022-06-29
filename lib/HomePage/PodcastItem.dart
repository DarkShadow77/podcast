import 'package:flutter/material.dart';

import '../screens/podcast.dart';
import '../utils/colors.dart';

class PodcastItem extends StatefulWidget {
  const PodcastItem({Key? key}) : super(key: key);

  @override
  State<PodcastItem> createState() => _PodcastItemState();
}

class _PodcastItemState extends State<PodcastItem> {
  PageController pageController = PageController(viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PodcastPage();
            },
          ),
        );
      },
      child: Container(
        height: 130,
        child: PageView.builder(
          padEnds: false,
          physics: BouncingScrollPhysics(),
          controller: pageController,
          itemCount: 5,
          itemBuilder: (content, position) {
            return _buildPageItem(position);
          },
        ),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              color: Colors.grey,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/ted.png"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Ted Talks Daily",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Ted",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 10,
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
