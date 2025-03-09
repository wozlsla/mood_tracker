import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Emotion {
  excellent,
  good,
  normal,
  sad,
  annoying,
  bad;

  static Emotion defaltValue = Emotion.excellent;

  static Emotion? formKey(String key) => switch (key) {
    "solidFaceLaughBeam" => Emotion.excellent,
    "solidFaceSmile" => Emotion.good,
    "solidFaceMeh" => Emotion.normal,
    "solidFaceSadTear" => Emotion.sad,
    "solidFaceTired" => Emotion.annoying,
    "solidFaceAngry" => Emotion.bad,
    _ => null,
  };

  String get key => switch (this) {
    Emotion.excellent => "solidFaceLaughBeam",
    Emotion.good => "solidFaceSmile",
    Emotion.normal => "solidFaceMeh",
    Emotion.sad => "solidFaceSadTear",
    Emotion.annoying => "solidFaceTired",
    Emotion.bad => "solidFaceAngry",
  };

  IconData get icon => switch (this) {
    Emotion.excellent => MoodIcon.excellent.iconData,
    Emotion.good => MoodIcon.good.iconData,
    Emotion.normal => MoodIcon.normal.iconData,
    Emotion.sad => MoodIcon.sad.iconData,
    Emotion.annoying => MoodIcon.annoying.iconData,
    Emotion.bad => MoodIcon.bad.iconData,
  };

  Color get tintColor => switch (this) {
    Emotion.excellent => Colors.yellow.shade700,
    Emotion.good => Colors.green.shade700,
    Emotion.normal => Colors.grey.shade700,
    Emotion.sad => Colors.blue.shade700,
    Emotion.annoying => Colors.purple.shade700,
    Emotion.bad => Colors.red.shade700,
  };
}

enum MoodIcon {
  excellent,
  good,
  normal,
  sad,
  annoying,
  bad;

  IconData get iconData => switch (this) {
    MoodIcon.excellent => FontAwesomeIcons.solidFaceLaughBeam,
    MoodIcon.good => FontAwesomeIcons.solidFaceSmile,
    MoodIcon.normal => FontAwesomeIcons.solidFaceMeh,
    MoodIcon.sad => FontAwesomeIcons.solidFaceSadTear,
    MoodIcon.annoying => FontAwesomeIcons.solidFaceTired,
    MoodIcon.bad => FontAwesomeIcons.solidFaceAngry,
  };
}
