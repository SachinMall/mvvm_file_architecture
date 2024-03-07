// To parse this JSON data, do
//
//     final timeLineModel = timeLineModelFromJson(jsonString);

import 'dart:convert';

List<TimeLineModel> timeLineModelFromJson(String str) => List<TimeLineModel>.from(json.decode(str).map((x) => TimeLineModel.fromJson(x)));

String timeLineModelToJson(List<TimeLineModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TimeLineModel {
    double mainPump;
    double fertigationTime;
    double delaytime;
    double premix;
    double postmix;

    TimeLineModel({
        required this.mainPump,
        required this.fertigationTime,
        required this.delaytime,
        required this.premix,
        required this.postmix,
    });

    factory TimeLineModel.fromJson(Map<String, dynamic> json) => TimeLineModel(
        mainPump: json["main_pump"],
        fertigationTime: json["fertigation_time"],
        delaytime: json["delaytime"],
        premix: json["premix"],
        postmix: json["postmix"],
    );

    Map<String, dynamic> toJson() => {
        "main_pump": mainPump,
        "fertigation_time": fertigationTime,
        "delaytime": delaytime,
        "premix": premix,
        "postmix": postmix,
    };
}
