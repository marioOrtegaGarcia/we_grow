part of note_text_widget;

class _NoteTextDesktop extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color color;
  const _NoteTextDesktop(this.text, this.textAlign, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: color ?? Colors.grey[600],
      ),
    );
  }
}
