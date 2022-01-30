import 'package:flutter/material.dart';

import 'package:time_tracking_dashboard_ui/colors.dart';

// ignore: must_be_immutable
class HeaderWidget extends StatelessWidget {
  Function onPressed;
  int index;
  HeaderWidget({Key? key, required this.onPressed, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 200,
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  onPressed(0);
                },
                child: Text(
                  'Daily',
                  style: TextStyle(
                      color: index == 0 ? Colors.white : paleBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
              ),
              TextButton(
                onPressed: () {
                  onPressed(1);
                },
                child: Text(
                  'Weekly',
                  style: TextStyle(
                      color: index == 1 ? Colors.white : paleBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
              ),
              TextButton(
                onPressed: () {
                  onPressed(2);
                },
                child: Text(
                  'Monthly',
                  style: TextStyle(
                      color: index == 2 ? Colors.white : paleBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
              )
            ],
          ),
        ),
        Container(
            decoration: BoxDecoration(
                color: blue, borderRadius: BorderRadius.circular(20)),
            height: 150,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                child: Image.asset('assets/images/image-jeremy.png'),
                radius: 50,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Report for ',
                      style: TextStyle(color: paleBlue, fontSize: 18),
                    ),
                    Text(
                      'Jeremy Robson',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w300),
                    )
                  ])
            ])),
      ]),
    );
  }
}
