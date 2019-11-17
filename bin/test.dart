import 'main.dart';
import 'package:test/test.dart';

void main() {
  test("Test case for Matryoshka", () {
    expect(matryoshkaDolls([[3,8,5],[9,1,4], [7,8,1]]), true);
  });
}