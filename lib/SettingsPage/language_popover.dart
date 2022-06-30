import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LanguagePopover extends StatelessWidget {
  const LanguagePopover({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          builder: (_, controller) => Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.only(
                    right: 20.0, left: 20.0, top: 40.0, bottom: 20.0),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.darkgrey,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Linking together the histories of Henrietta Swan Leavitt, Edwin Hubble and Tracy K. Smith, poet and thinker Maria Popova crafts an astonishing story of how humanity came to see the edge of the observable universe. (Followed by an animated excerpt of 'My God, It's Full of Stars,' by Tracy K. Smith)",
                            softWrap: true,
                            maxLines: 30,
                            style: TextStyle(
                              height: 2,
                              color: Colors.white,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildHandle(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.20,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: Color(0xff1f212e),
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}
