// ignore_for_file: unnecessary_this, file_names

import 'package:flutter/material.dart';

class FullEventCard extends StatelessWidget {
  final String imageLocation;
  final String eventName;
  final String eventDetails;
  final String category;
  const FullEventCard({
    super.key,
    required this.imageLocation,
    required this.eventName,
    required this.eventDetails,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //* Event image
        Container(
          width: double.infinity,
          height: 220,
          margin: const EdgeInsets.only(top: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: eventName,
              child: Image.asset(
                this.imageLocation,
                fit: BoxFit.cover,
                // height: 300,
                // alignment: Alignment.enter,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              height: 220,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //* Event Name
                      Text(
                        this.eventName,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                     const  SizedBox(height: 5),
                      //* Event Details
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 15, 4),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      this.category,
                      style: const TextStyle(color: Colors.black),
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
