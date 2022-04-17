import 'package:flutter/material.dart';

const textstyle1 =
    TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600);
const textstyle2 =
    TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.w700);
const textstyle3 =
    TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600);

class DataContainer extends StatelessWidget {
  const DataContainer({required this.icon, required this.gender});
  final IconData icon;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: textstyle1,
        )
      ],
    );
  }
}
