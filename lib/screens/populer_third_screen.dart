// ignore_for_file: file_names

import 'package:hosha/screens/event_inner_screen.dart';
import 'package:hosha/screens/home_screen.dart';
import 'package:hosha/widgets/animated-widgets.dart';
import 'package:hosha/widgets/full-event-card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopulerThirdScreen extends StatefulWidget {
  const PopulerThirdScreen({super.key});

  @override
  PopulerThirdScreenState createState() => PopulerThirdScreenState();
}

class PopulerThirdScreenState extends State<PopulerThirdScreen> {
  double opacity = 1;
  double topPadding = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Hero(
            tag: 'card',
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(30, 60, 0, 0),
              color: const Color(0xffE2CAAE),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* Heading
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            'المصورات',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ), //* Arrow Icon
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.white54,
                          size: 25,
                        )
                      ],
                    ),
                    onHorizontalDragStart: (details) async {
                      setState(() {
                        opacity = 0;
                        topPadding = 200;
                      });

                      await Future.delayed(const Duration(milliseconds: 200),
                          () {
                        Navigator.pop(context);
                      });

                      await Future.delayed(const Duration(milliseconds: 180),
                          () {
                        throughEventsScreen = true;
                        bottomCardMargin1.value = 100;
                        bottomCardMargin2.value = 200;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          //* Event Cards
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: opacity,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.fromLTRB(30, topPadding, 30, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnimatedWidgets(
                      delay: 300,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const MaterialApp(
                                  // create: (context) => animation,
                                  home: EventInnerScreen(),
                                );
                              },
                              transitionDuration:
                                  const Duration(milliseconds: 300),
                            ),
                          );
                        },
                        child: const FullEventCard(
                          imageLocation: 'lib/assets/photo1.jpg',
                          eventName: 'المصورة غدير',
                          eventDetails: 'الأفضل • الأعلى تقييما',
                          category: 'حجز',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const AnimatedWidgets(
                      delay: 300,
                      child: FullEventCard(
                        imageLocation: 'lib/assets/photo1.jpg',
                        eventName: 'المصورة سحر',
                        eventDetails: 'خدمات VIP • احترافية',
                        category: 'حجز',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const AnimatedWidgets(
                      delay: 300,
                      child: FullEventCard(
                        imageLocation: 'lib/assets/photo.png',
                        eventName: 'المصورة رانيا',
                        eventDetails: 'زيد الموشكي • ثاني أكبر تقييم',
                        category: 'حجز',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const AnimatedWidgets(
                      delay: 300,
                      child: FullEventCard(
                        imageLocation: 'lib/assets/photo.png',
                        eventName: 'المصورة سحر',
                        eventDetails: 'خدمات VIP • احترافية',
                        category: 'حجز',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const AnimatedWidgets(
                      delay: 300,
                      child: FullEventCard(
                        imageLocation: 'lib/assets/photo.png',
                        eventName: 'المصورة سحر',
                        eventDetails: 'خدمات VIP • احترافية',
                        category: 'حجز',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
