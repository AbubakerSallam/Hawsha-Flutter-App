// ignore_for_file: sized_box_for_whitespace

import 'package:hosha/screens/calender.dart';
import 'package:hosha/screens/event_details_screen.dart';
import 'package:hosha/widgets/animated-widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventInnerScreen extends StatefulWidget {
  const EventInnerScreen({super.key});

  @override
  EventInnerScreenState createState() => EventInnerScreenState();
}

class EventInnerScreenState extends State<EventInnerScreen> {
  List<double> dateCard = [500, 900];
  List<double> detailsCard = [0, 900];
  List<double> ticketCard = [500, 900];

  @override
  void initState() {
    super.initState();
    bottomCardAnimation();
  }

  bottomCardAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        dateCard = [80, 600];
        detailsCard = [MediaQuery.of(context).size.width * 0.7, 700];
        ticketCard = [150, 780];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            const SizedBox(height: 20.5),
            Hero(
              tag: 'Live in Concert',
              child: Image.asset(
                'lib/assets/mm1.jpg',
                fit: BoxFit.cover,
                height: 700,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 65, 30, 0),
              child: InkWell(
                child: const AnimatedWidgets(
                  delay: 200,
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                onTap: () async {
                  setState(() {
                    dateCard = [500, 900];
                    detailsCard = [0, 900];
                    ticketCard = [500, 900];
                  });
                  await Future.delayed(const Duration(milliseconds: 200), () {
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(
                          'EventInnerScreen'), // Replace '/' with your desired route name
                    );
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(230, 100, 10, 0),
              child: AnimatedWidgets(
                delay: 200,
                child: Text(
                  '',
                  style: GoogleFonts.inter(
                    color: const Color.fromARGB(255, 55, 52, 52),
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    height: 1.4,
                  ),
                ),
              ),
            ),
            //* Event Date Card
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: double.infinity,
              margin: EdgeInsets.fromLTRB(dateCard[0], dateCard[1], 0, 0),
              padding: const EdgeInsets.fromLTRB(42, 32, 0, 0),
              decoration: const BoxDecoration(
                color: Color(0xff212529),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width - 122,
                  child: GestureDetector(
                    child: const SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'التقييم',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.yellow), // Full star
                                  Icon(Icons.star,
                                      color: Colors.yellow), // Full star
                                  Icon(Icons.star,
                                      color: Colors.yellow), // Full star
                                  Icon(Icons.star,
                                      color: Colors.yellow), // Full star
                                  Icon(Icons.star_border,
                                      color: Colors
                                          .yellow), // Empty star or use Icon(Icons.star_half, color: Colors.yellow) for a half-filled star
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 60),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            //  crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'السعر',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '100\$',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onPanUpdate: (details) {
                      if (!(details.delta.dy > 0)) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const EventDetailsScreen(),
                            transitionDuration: const Duration(seconds: 0),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            //* About Event Card
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: double.infinity,
              margin: EdgeInsets.fromLTRB(0, detailsCard[1], 0, 0),
              padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
              width: detailsCard[0],
              decoration: const BoxDecoration(
                color: Color(0xffE2CAAE),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تفاصيل الكوشة',
                      style: GoogleFonts.inter(
                        color: const Color(0xff646843),
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.white,
                      size: 25,
                    )
                  ],
                ),
              ),
            ),
            //* Price Card
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: double.infinity,
              margin: EdgeInsets.fromLTRB(ticketCard[0], ticketCard[1], 0, 0),
              padding: const EdgeInsets.fromLTRB(45, 10, 2, 0),
              decoration: const BoxDecoration(
                color: Color(0xffA95F44),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalendarPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 195,
                    child: Text(
                      ' !!احجز الان',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
