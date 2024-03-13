import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventPurchaseScreen extends StatefulWidget {
  const EventPurchaseScreen({super.key});

  @override
  EventPurchaseScreenState createState() => EventPurchaseScreenState();
}

class EventPurchaseScreenState extends State<EventPurchaseScreen> {
  List<double> dateCard = [0, 350, 0, 0];
  List<double> detailsCard = [0, 450, 0, 0];
  bool animationStarted = false;
  bool animationStarted2 = false;
  bool animationStarted3 = false;
  bool animationStarted4 = false;
  bool animationStarted5 = false;

  @override
  void initState() {
    super.initState();
    cardAnimation();
  }

  cardAnimation() async {
    await Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        dateCard = [0, 0, MediaQuery.of(context).size.width - 42, 0];
        detailsCard = [MediaQuery.of(context).size.width, 0, 120, 0];
        animationStarted = true;
      });
    });
    await Future.delayed(const Duration(milliseconds: 80), () {
      setState(() {
        animationStarted2 = true;
      });
    });
    await Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        animationStarted3 = true;
      });
    });
    await Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        animationStarted4 = true;
      });
    });
    await Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        animationStarted5 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: MediaQuery.of(context).size.width,
              height: (!animationStarted) ? 400 : 0,
              child: const Image(
                image: AssetImage('lib/assets/m1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            // Event Date Card
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: double.infinity,
              margin: EdgeInsets.fromLTRB(dateCard[0], dateCard[1], 0, 0),
              padding: const EdgeInsets.fromLTRB(42, 32, 0, 0),
              decoration: const BoxDecoration(
                color: Color(0xffE2CAAE),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: (dateCard[2] == 0)
                      ? MediaQuery.of(context).size.width - 42
                      : dateCard[2],
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ...Your date-related Column widgets here
                    ],
                  ),
                ),
              ),
            ),
            // More Details Card
            GestureDetector(
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, detailsCard[1], 0, 0),
                    padding: EdgeInsets.fromLTRB(
                        40, (detailsCard[2] == 0) ? 30 : detailsCard[2], 0, 0),
                    width: (detailsCard[0] == 0)
                        ? MediaQuery.of(context).size.width
                        : detailsCard[0],
                    decoration: const BoxDecoration(
                      // ignore: unnecessary_const
                      color: Color(0xff646843),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.only(
                        left: 30, top: (animationStarted2) ? 118 : 480),
                    child: Text(
                      'تفاصيل أكثر ',
                      style: GoogleFonts.inter(
                        color: const Color(0xffdee2ff),
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.only(
                              left: 30, top: (animationStarted3) ? 150 : 480),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الذهبية',
                                style: TextStyle(
                                  color: Color(0xffdee2ff),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'مكان ساحر مخصص للاحتفالات الزفافية، حيث تتميز بالأناقة والفخامة. تصميمها يعكس الذوق الرفيع والاهتمام بأدق التفاصيل لضمان تجربة زفاف لا تُنسى للعروسين وضيوفهم. تتميز هذه القاعة بديكوراتها الرائعة والإضاءة الساحرة التي تُضفي أجواءًا ساحرة ورومانسية على كل حدث.',
                                style: TextStyle(
                                  color: Color(0xffdee2ff),
                                  fontSize: 16,
                                ),
                              ),
                              // Other widgets...
                            ],
                          ),
                        ),
                        // Other widgets...
                      ],
                    ),
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         width: double.infinity,
//         child: Stack(
//           children: [
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 200),
//               width: MediaQuery.of(context).size.width,
//               height: (!animationStarted) ? 400 : 0,
//               child: const Image(
//                 image: AssetImage('lib/assets/event-1.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             // Event Date Card
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 200),
//               height: double.infinity,
//               margin: EdgeInsets.fromLTRB(dateCard[0], dateCard[1], 0, 0),
//               padding: const EdgeInsets.fromLTRB(42, 32, 0, 0),
//               decoration: const BoxDecoration(
//                 color: Color(0xff212529),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Container(
//                   width: (dateCard[2] == 0)
//                       ? MediaQuery.of(context).size.width - 42
//                       : dateCard[2],
//                   child: const Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Date',
//                             style: TextStyle(
//                               color: Color(0xff879dff),
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Text(
//                             '28.07.2021',
//                             style: TextStyle(
//                                 color: Color(0xffdee2ff),
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w700,
//                                 height: 1.3),
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: 20),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'From',
//                             style: TextStyle(
//                               color: Color(0xff879dff),
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Text(
//                             '7.00PM',
//                             style: TextStyle(
//                                 color: Color(0xffdee2ff),
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w700,
//                                 height: 1.3),
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: 20),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'To',
//                             style: TextStyle(
//                               color: Color(0xff879dff),
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Text(
//                             '11.00PM',
//                             style: TextStyle(
//                                 color: Color(0xffdee2ff),
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w700,
//                                 height: 1.3),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // More Details Card
//             GestureDetector(
//               child: Stack(
//                 children: [
//                   AnimatedContainer(
//                     duration: const Duration(milliseconds: 200),
//                     height: double.infinity,
//                     margin: EdgeInsets.fromLTRB(0, detailsCard[1], 0, 0),
//                     padding: EdgeInsets.fromLTRB(
//                         40, (detailsCard[2] == 0) ? 30 : detailsCard[2], 0, 0),
//                     width: (detailsCard[0] == 0)
//                         ? MediaQuery.of(context).size.width
//                         : detailsCard[0],
//                     decoration: BoxDecoration(
//                       color: const Color(0xff4361ee),
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(50),
//                       ),
//                     ),
//                   ),
//                   AnimatedContainer(
//                     duration: const Duration(milliseconds: 200),
//                     padding: EdgeInsets.only(
//                         left: 30, top: (animationStarted2) ? 118 : 480),
//                     child: Text(
//                       'Event Details',
//                       style: GoogleFonts.inter(
//                         color: const Color(0xffdee2ff),
//                         fontSize: 25,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(top: 10, right: 30),
//                     child: Stack(
//                       children: [
//                        AnimatedContainer(
//   duration: const Duration(milliseconds: 200),
//   padding: EdgeInsets.only(left: 30, top: (animationStarted3) ? 150 : 480),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         'Event Description',
//         style: TextStyle(
//           color: Color(0xffdee2ff),
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       SizedBox(height: 10),
//       Text(
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//         style: TextStyle(
//           color: Color(0xffdee2ff),
//           fontSize: 16,
//         ),
//       ),
//       // Other widgets...
//     ],
//   ),
// ),),],),),)))};