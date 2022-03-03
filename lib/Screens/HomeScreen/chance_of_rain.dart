import 'package:flutter/material.dart';

import '../../Const/constants.dart';

class ChanceOfRain extends StatelessWidget {
  const ChanceOfRain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Chance of rain",
                  style: subtitle,
                ),
              ),
            ),
            Expanded(
              flex: 80,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Sunny',
                                style: subText,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Rainy',
                                style: subText,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Heavy Rain',
                                softWrap: true,
                                style: subText,
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child:
                                          LayoutBuilder(builder: (context, c) {
                                        return SizedBox(
                                          height: c.minHeight * 0.01,
                                          child: Container(
                                            width: 12,
                                            decoration: BoxDecoration(
                                              color: overlayColor.withAlpha(50),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                25,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '4AM',
                                      style: subText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child:
                                          LayoutBuilder(builder: (context, c) {
                                        return SizedBox(
                                          height: c.minHeight * 0.01,
                                          child: Container(
                                            width: 12,
                                            decoration: BoxDecoration(
                                              color: overlayColor.withAlpha(50),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                25,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '4AM',
                                      style: subText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child:
                                          LayoutBuilder(builder: (context, c) {
                                        return SizedBox(
                                          height: c.minHeight * 0.01,
                                          child: Container(
                                            width: 12,
                                            decoration: BoxDecoration(
                                              color: overlayColor.withAlpha(50),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                25,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '4AM',
                                      style: subText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child:
                                          LayoutBuilder(builder: (context, c) {
                                        return SizedBox(
                                          height: c.minHeight * 0.01,
                                          child: Container(
                                            width: 12,
                                            decoration: BoxDecoration(
                                              color: Colors.amber,
                                              // .withAlpha(50),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                25,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '4AM',
                                      style: subText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child:
                                          LayoutBuilder(builder: (context, c) {
                                        return SizedBox(
                                          height: c.minHeight * 0.01,
                                          child: Container(
                                            width: 12,
                                            decoration: BoxDecoration(
                                              color: overlayColor.withAlpha(50),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                25,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '4AM',
                                      style: subText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child:
                                          LayoutBuilder(builder: (context, c) {
                                        return SizedBox(
                                          height: c.minHeight * 0.01,
                                          child: Container(
                                            width: 12,
                                            decoration: BoxDecoration(
                                              color: overlayColor.withAlpha(50),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                25,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '4AM',
                                      style: subText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
