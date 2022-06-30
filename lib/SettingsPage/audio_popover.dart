import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AudioPopover extends StatefulWidget {
  const AudioPopover({
    Key? key,
  }) : super(key: key);

  @override
  State<AudioPopover> createState() => _AudioPopoverState();
}

class _AudioPopoverState extends State<AudioPopover> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.3,
          builder: (_, controller) => Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
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
                            "Audio Quality",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Choose your preferred audio quality",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff545568),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "High Quality",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    Text(
                                      "HQ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.containerone,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 20, bottom: 20),
                                child: Divider(
                                  height: 1,
                                  color: AppColors.lightgrey.withOpacity(0.25),
                                  thickness: 1.5,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Low Quality",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    Text(
                                      "LQ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.containerone,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
