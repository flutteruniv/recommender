import 'package:flutter/material.dart';

class CostPage extends StatelessWidget {
  const CostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('EAE8E4'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '予算を教えてください',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            FilterButton(
              backgroundColor: HexColor('C63030'),
              text: '~ 5,000',
            ),
            const SizedBox(
              height: 20,
            ),
            FilterButton(
                backgroundColor: HexColor('288776'), text: '5,000 ~ 10,000'),
            const SizedBox(
              height: 20,
            ),
            FilterButton(
                backgroundColor: HexColor('C63030'), text: '10,000 ~ 30,000'),
            const SizedBox(
              height: 20,
            ),
            FilterButton(
                backgroundColor: HexColor('288776'), text: '30,000 ~ 50,000'),
            const SizedBox(
              height: 20,
            ),
            FilterButton(
                backgroundColor: HexColor('C63030'), text: '50,000 ~ 100,000'),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required this.backgroundColor,
    required this.text,
  }) : super(key: key);

  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 248,
      height: 68,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(width: 1, color: backgroundColor),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
