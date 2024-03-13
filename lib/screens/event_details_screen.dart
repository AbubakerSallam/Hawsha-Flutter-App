// ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:hosha/screens/calender.dart';
import 'package:hosha/screens/event_purchase_screen.dart';
import 'package:hosha/widgets/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool throughEventPurchaseScreen = false;

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  EventDetailsScreenState createState() => EventDetailsScreenState();
}

class EventDetailsScreenState extends State<EventDetailsScreen> {
  List<double> dateCard = [80, 600, 0, 0];
  List<double> detailsCard = [0, 700, 0, 0];
  bool animationStarted = false;
  bool animationTwoStarted = false;

  @override
  void initState() {
    super.initState();
    cardAnimation();
  }

  cardAnimation() async {
    await Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        dateCard = [0, 350, MediaQuery.of(context).size.width - 42];
        detailsCard = [MediaQuery.of(context).size.width, 450];
        animationStarted = true;
        if (throughEventPurchaseScreen) animationTwoStarted = true;
      });
    });
    await Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        animationTwoStarted = true;
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
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: MediaQuery.of(context).size.width,
              height: (!animationStarted) ? 700 : 400,
              child: Image.asset(
                'lib/assets/mm2.jpg',
                fit: BoxFit.cover,
                height: 700,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: (!animationStarted) ? 1 : 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.fromLTRB(
                    30, (!animationStarted) ? 65 : 0, 30, 0),
                child: InkWell(
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xff646843),
                    size: 25,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: (!animationStarted) ? 1 : 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.fromLTRB(
                    30, (!animationStarted) ? 120 : 0, 30, 0),
                child: Text(
                  '',
                  style: GoogleFonts.inter(
                    color: const Color(0xff646843),
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    height: 1.4,
                  ),
                ),
              ),
            ),
            //* Header Card
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: (!animationStarted) ? 0 : 100,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              padding: const EdgeInsets.fromLTRB(30, 55, 0, 0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xffE2CAAE),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xff646843),
                        size: 20,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'القاعة الذهبية',
                      style: GoogleFonts.inter(
                        color: const Color(0xff646843),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //* Event Date Card
            AnimatedContainer(
              // curve: Curves.elasticIn,
              duration: const Duration(milliseconds: 200),
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(dateCard[0], dateCard[1], 0, 0),
              padding: const EdgeInsets.fromLTRB(42, 32, 0, 0),
              decoration: const BoxDecoration(
                color: Color(0xff212529),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dy > 0) {
                    setState(() {
                      dateCard = [80, 600, 0, 0];
                      detailsCard = [0, 700, 0, 0];
                      animationStarted = false;
                      animationTwoStarted = false;
                    });
                    Navigator.pop(context);
                  }
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 122,
                    child: GestureDetector(
                      child: const SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
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
            ),
            //* More Details Card
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: double.infinity,
              margin: EdgeInsets.fromLTRB(0, detailsCard[1], 0, 0),
              padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
              width: (detailsCard[0] == 0)
                  ? MediaQuery.of(context).size.width * 0.7
                  : detailsCard[0],
              decoration: const BoxDecoration(
                color: Color(0xffE2CAAE),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
              child: GestureDetector(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AnimatedCrossFade(
                          firstChild: Text(
                            'تفاصيل الكوشة',
                            style: GoogleFonts.inter(
                              color: const Color(0xff646843),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          secondChild: Text(
                            'تفاصيل الكوشة',
                            style: GoogleFonts.inter(
                              color: const Color(0xff646843),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          duration: const Duration(milliseconds: 200),
                          crossFadeState: !animationStarted
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                        ),
                        const SizedBox(width: 10),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: (!animationStarted) ? 1 : 0,
                          child: const Icon(
                            Icons.arrow_upward_rounded,
                            color: Color(0x88dee2ff),
                            size: 25,
                          ),
                        )
                      ],
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: (!animationTwoStarted) ? 0 : 1,
                      child: Container(
                        padding: const EdgeInsets.only(top: 10, right: 30),
                        child: const Column(
                          children: [
                            Text(
                              'مكان ساحر مخصص للاحتفالات الزفافية، حيث تتميز بالأناقة والفخامة. تصميمها يعكس الذوق الرفيع والاهتمام بأدق التفاصيل لضمان تجربة زفاف لا تُنسى للعروسين وضيوفهم. تتميز هذه القاعة بديكوراتها الرائعة والإضاءة الساحرة التي تُضفي أجواءًا ساحرة ورومانسية على كل حدث.',
                              style: TextStyle(
                                color: Color(0xff646843),
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 20),
                            DetailCard(),
                            SizedBox(height: 20),
                            DetailCard(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                onPanUpdate: (details) {
                  if (!(details.delta.dy > 0)) {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const EventPurchaseScreen(),
                        transitionDuration: const Duration(seconds: 0),
                      ),
                    );
                  } else {
                    print('aa');
                    // setState(() {
                    //   dateCard = [80, 600, 0, 0];
                    //   detailsCard = [0, 700, 0, 0];
                    //   animationStarted = false;
                    //   animationTwoStarted = false;
                    // });
                  }
                },
              ),
            ),
            //* Ticket Price
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: double.infinity,
              margin: const EdgeInsets.fromLTRB(150, 780, 0, 0),
              padding: const EdgeInsets.fromLTRB(45, 20, 0, 0),
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
