// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String imageLocation;
  final String eventName;
  final String eventDetails;
  const EventCard({
    super.key,
    required this.imageLocation,
    required this.eventName,
    required this.eventDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //* Favourite event image
        Container(
          width: 260,
          height: 160,
          margin: const EdgeInsets.only(top: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              this.imageLocation,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 260,
              height: 160,
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black12,
                    Colors.black38,
                    Colors.black87,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.eventName,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    this.eventDetails,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
