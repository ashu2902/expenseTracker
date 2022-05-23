import 'dart:developer';

import 'package:flutter/material.dart';

class TotalSpentSlider extends StatefulWidget {
  const TotalSpentSlider({Key? key}) : super(key: key);

  @override
  State<TotalSpentSlider> createState() => _TotalSpentSliderState();
}

class _TotalSpentSliderState extends State<TotalSpentSlider> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              valueIndicatorColor: Colors.white,
              showValueIndicator: ShowValueIndicator.onlyForDiscrete,
              valueIndicatorTextStyle: const TextStyle(color: Colors.black),
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              tickMarkShape: SliderTickMarkShape.noTickMark,
              trackShape: GradientRectSliderTrackShape()),
          child: Slider.adaptive(
            label: value.toString(),
            divisions: 10,
            value: value,
            onChanged: (double newVal) {
              setState(() {
                value = newVal;
              });
              log(newVal.toString());
            },
            activeColor: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value.toString(),
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}

class GradientRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  /// Create a slider track that draws two rectangles with rounded outer edges.
  const GradientRectSliderTrackShape();

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(context != null);
    assert(offset != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(enableAnimation != null);
    assert(textDirection != null);
    assert(thumbCenter != null);
    // If the slider [SliderThemeData.trackHeight] is less than or equal to 0,
    // then it makes no difference whether the track is painted or not,
    // therefore the painting  can be a no-op.
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    LinearGradient linearGradient = const LinearGradient(
        colors: <Color>[Color(0xff57D5EF), Color(0xffFB9857)]);
    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);

    final Paint activePaint = Paint()
      ..shader = linearGradient.createShader(trackRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..shader = linearGradient.createShader(trackRect)
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius =
        Radius.circular((trackRect.height + additionalActiveTrackHeight) / 2);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}
