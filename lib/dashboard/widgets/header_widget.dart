import 'package:flutter/material.dart';

import 'package:time_tracking_dashboard_ui/colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);
  

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
                  //TODO:Implement
                },
                child: const Text(
                  'Daily',
                  style: TextStyle(
                      color: paleBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () {
                  //TODO:implement
                },
                child: const Text(
                  'Weekly',
                  style: TextStyle(
                      color: paleBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                  onPressed: () {
                    //TODO:implement
                  },
                  child: const Text(
                    'Monthly',
                    style: TextStyle(
                        color: paleBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ))
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
