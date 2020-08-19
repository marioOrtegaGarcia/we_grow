library note_text_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'note_text_mobile.dart';
part 'note_text_tablet.dart';
part 'note_text_desktop.dart';

class NoteTextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color color;
  const NoteTextWidget(this.text, {this.textAlign, this.color});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _NoteTextMobile(this.text, this.textAlign, this.color),
      desktop: _NoteTextDesktop(this.text, this.textAlign, this.color),
      tablet: _NoteTextTablet(this.text, this.textAlign, this.color),
    );
  }
}
