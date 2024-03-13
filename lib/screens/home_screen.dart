// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:hosha/screens/populer_second_screen.dart';
import 'package:hosha/screens/populer_third_screen.dart';
import 'package:hosha/widgets/event_card.dart';
import 'package:hosha/screens/popular_events_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

bool throughEventsScreen = false;
ValueNotifier<double> bottomCardMargin1 = ValueNotifier<double>(100);
ValueNotifier<double> bottomCardMargin2 = ValueNotifier<double>(200);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void navigateToPopularEventsScreen(int page) {
    print('Tapped');
    setState(() {
      bottomCardMargin1.value = 500;
      bottomCardMargin2.value = 500;
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ListenableProvider(
              create: (context) => animation,
              child: page == 1
                  ? const PopularEventsScreen()
                  : page == 2
                      ? const PopulerSecondScreen()
                      : const PopulerThirdScreen(),
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   // actions: [
      //   // GestureDetector(
      //   //   onTap: () {
      //   //     // Handle tap on the image
      //   //   },
      //   //   child: Padding(
      //   //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //   //     child: Image.asset(
      //   //       'lib/assets/logo.png',
      //   //       width: 140, // Adjust width as needed
      //   //       height: 140, // Adjust height as needed
      //   //     ),
      //   //   ),
      //   // ),
      //   // ],
      //   leading: const Icon(
      //     Icons.menu_rounded,
      //     color: Color(0xffA95F44),
      //     size: 36,
      //   ),
      // ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Menu Icon
            Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: const Icon(
                Icons.menu_rounded,
                color: Color(0xffA95F44),
                size: 36,
              ),
            ),
            //* Topic Text
            Container(
              padding: const EdgeInsets.fromLTRB(200, 0, 40, 0),
              child: Image.asset('lib/assets/logo.png'),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(170, 0, 0, 0),
              child: Text(
                '.أفضل الحجوزات بأقل الأسعار',
                style: GoogleFonts.inter(
                  color: const Color(0xffA95F44),
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  height: 1.2,
                ),
              ),
            ),
            Row(
              children: [
                //* Search Section
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(30, 15, 0, 0),
                    decoration: BoxDecoration(
                      color: const Color(0xffA95F44),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'بحث',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.search,
                          color: Color(0xffE2CAAE),
                        )
                      ],
                    ),
                  ),
                ),
                //* Fiter button
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.fromLTRB(10, 15, 30, 0),
                  decoration: BoxDecoration(
                    color: const Color(0xffA95F44),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.sort_rounded,
                    color: Color(0xffE2CAAE),
                  ),
                ),
              ],
            ),
            //* Favourites
            Container(
              padding: const EdgeInsets.fromLTRB(255, 12, 20, 0),
              child: Text(
                'الخدمات الرائجة',
                style: GoogleFonts.inter(
                  color: const Color(0xffA95F44),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            //* Events list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      navigateToPopularEventsScreen(2);
                    },
                    child: const EventCard(
                      imageLocation: 'lib/assets/m3.jpg',
                      eventName: 'منسقات',
                      eventDetails: 'خدمات VIP •أعراس وحفلات',
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      navigateToPopularEventsScreen(1);
                    },
                    child: const EventCard(
                      imageLocation: 'lib/assets/event-1.jpg',
                      eventName: 'قاعات',
                      eventDetails: 'الأفضل • الأعلى تقييما',
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      navigateToPopularEventsScreen(3);
                    },
                    child: const EventCard(
                      imageLocation: 'lib/assets/photo.png',
                      eventName: 'مصورات',
                      eventDetails: 'تصوير احترافي • أكبر تقييم',
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Flexible(
              fit: FlexFit.tight,
              child: Stack(
                children: [
                  //* Popular Events Card
                  Hero(
                    tag: 'card',
                    child: GestureDetector(
                      onHorizontalDragStart: (details) {
                        print('Tapped');

                        setState(() {
                          bottomCardMargin1.value = 500;
                          bottomCardMargin2.value = 500;
                        });

                        Future.delayed(const Duration(milliseconds: 100), () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return ListenableProvider(
                                  create: (context) => animation,
                                  child: const PopularEventsScreen(),
                                );
                              },
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                            ),
                          );
                        });
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.78,
                        height: double.infinity,
                        padding: const EdgeInsets.fromLTRB(30, 36, 0, 0),
                        decoration: const BoxDecoration(
                          color: Color(0xffA95F44),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                'قاعات الأفراح',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.arrow_upward_rounded,
                              color: Colors.white54,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  //* Newest Events Card
                  ValueListenableBuilder<double>(
                      valueListenable: bottomCardMargin1,
                      builder: (BuildContext context, double bottomCardMargin1,
                          child) {
                        print(throughEventsScreen);
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: double.infinity,
                          margin:
                              EdgeInsets.fromLTRB(80, bottomCardMargin1, 0, 0),
                          padding: const EdgeInsets.fromLTRB(42, 36, 0, 0),
                          decoration: const BoxDecoration(
                            color: Color(0xffE2CAAE),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'قاعات مناسبات',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.arrow_upward_rounded,
                                color: Colors.white54,
                                size: 25,
                              )
                            ],
                          ),
                        );
                      }),
                  //* Upcoming Events
                  ValueListenableBuilder<double>(
                    valueListenable: bottomCardMargin2,
                    builder: (BuildContext context, double bottomCardMargin2,
                        child) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: double.infinity,
                        margin: EdgeInsets.fromLTRB(0, bottomCardMargin2, 0, 0),
                        padding: const EdgeInsets.fromLTRB(30, 36, 0, 0),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                          color: Color(0xff646843),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'خدمة العملاء',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset(
                              'lib/assets/R.png', // Replace with your image path

                              width: 35,
                              height: 35,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
