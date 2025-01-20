class Lesson {
  final String name;
  final double letterValue;
  final String letter;
  final int creditValue;

  Lesson(
      {required this.name,
      required this.letterValue,
      required this.letter,
      required this.creditValue});

  @override
  String toString() {
    return "$name $letterValue $letter $creditValue";
  }
}
