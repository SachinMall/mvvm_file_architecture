import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import '../model/timeline_model.dart';

class SlideBar extends StatefulWidget {
  final TimeLineModel timeLineModel;

  const SlideBar({super.key, required this.timeLineModel});

  @override
  State<SlideBar> createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar> {
  late double _lowerValue;
  late double _upperValue;
  late double _lockdistance;
  late double _maxValue;
  @override
  void initState() {
    super.initState();
    _lowerValue = 0;
    _upperValue = widget.timeLineModel.fertigationTime;
    _lockdistance = widget.timeLineModel.fertigationTime;
    _maxValue = widget.timeLineModel.mainPump -
        (widget.timeLineModel.premix + widget.timeLineModel.postmix);
  }

  @override
  Widget build(BuildContext context) {
    double totalSpace = _maxValue;
    double leftBarSpace = _lowerValue;
    double rightBarSpace = totalSpace - _upperValue;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text('Pre mix'),
                const SizedBox(height: 5),
                Text('${widget.timeLineModel.premix} mins'),
              ],
            ),
            Column(
              children: [
                const Text('Fertigation'),
                const SizedBox(height: 5),
                Text('${widget.timeLineModel.fertigationTime} mins'),
              ],
            ),
            Column(
              children: [
                const Text('Post mix'),
                const SizedBox(height: 5),
                Text('${widget.timeLineModel.postmix} mins'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 14,
                width: widget.timeLineModel.premix,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
              ),
              Expanded(
                child: FlutterSlider(
                  foregroundDecoration:
                      const BoxDecoration(color: Colors.transparent),
                  lockHandlers: true,
                  lockDistance: _lockdistance,
                  handler: FlutterSliderHandler(
                    child: Container(),
                    decoration: const BoxDecoration(),
                  ),
                  rightHandler: FlutterSliderHandler(
                    child: Container(),
                    decoration: const BoxDecoration(),
                  ),
                  values: [_lowerValue, _upperValue],
                  rangeSlider: true,
                  max: totalSpace,
                  min: 0,
                  handlerHeight: 0,
                  handlerWidth: 0,
                  handlerAnimation: const FlutterSliderHandlerAnimation(
                    curve: Curves.easeOut,
                    scale: 4,
                    reverseCurve: Curves.easeOut,
                  ),
                  trackBar: FlutterSliderTrackBar(
                    inactiveTrackBarHeight: 14,
                    activeTrackBarHeight: 20,
                    inactiveTrackBar: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    activeTrackBar: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.green.withOpacity(0.8),
                    ),
                  ),
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    _lowerValue = lowerValue;
                    _upperValue = upperValue;
                    setState(() {});
                  },
                ),
              ),
              Container(
                height: 14,
                width: widget.timeLineModel.postmix,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text('Before Time'),
                Text(leftBarSpace.toStringAsFixed(2)),
              ],
            ),
            Column(
              children: [
                const Text('After Time'),
                Text(rightBarSpace.toStringAsFixed(2)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
