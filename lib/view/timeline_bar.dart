import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvvm_file_architecture/model/timeline_model.dart';
import 'package:mvvm_file_architecture/view/custom_timeline.dart';
import 'package:mvvm_file_architecture/view_model/auth_view_model.dart';

class TimeLineBar extends StatefulWidget {
  const TimeLineBar({super.key});

  @override
  State<TimeLineBar> createState() => _TimeLineBarState();
}

class _TimeLineBarState extends State<TimeLineBar> {
  AuthViewModel timeLineModel = AuthViewModel();

  @override
  void initState() {
    timeLineModel.fetchTimeLineApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'TimeLine',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent),
      body:

       SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            //     preMix: 10)
            SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  // return const SlideBar(
                  //     delayTime: 0,
                  //     fertigationTime: 20,
                  //     mainPump: 60,
                  //     postMix: 10,
                  //     preMix: 10);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
