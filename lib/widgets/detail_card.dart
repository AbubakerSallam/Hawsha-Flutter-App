import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: const BoxDecoration(
        color: Color(0xff646843),
        // borderRadius: BorderRadius.circular(20),
      ),
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أخرى',
              style: TextStyle(
                color: Color(0xffdee2ff),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'مكان ساحر مخصص للاحتفالات الزفافية، حيث تتميز بالأناقة والفخامة. تصميمها يعكس الذوق الرفيع والاهتمام بأدق التفاصيل لضمان تجربة زفاف لا تُنسى للعروسين وضيوفهم. تتميز هذه القاعة بديكوراتها الرائعة والإضاءة الساحرة التي تُضفي أجواءًا ساحرة ورومانسية على كل حدث.',
              style: TextStyle(
                color: Color(0xffdee2ff),
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
