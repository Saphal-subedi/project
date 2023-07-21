import 'package:e_woda/Common/loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.color,
      required this.ontap,
      required this.titleColor});
  final String title;
  final Color titleColor;
  final Color color;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => color)),
        child: Text(
          title,
          style: TextStyle(color: titleColor),
        ),
      ),
    );
  }
}

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => color)),
          child: const Center(child: CustomLoadingIndicator())),
    );
  }
}
