import 'package:flutter/material.dart';
import 'package:restaurant_booking/constants/colors.dart';

class DescriptionText extends StatefulWidget {
  DescriptionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  _DescriptionTextState createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  late String fistHalf;
  late String secondHalf = "";
  bool hiddenText = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      double textHeight = MediaQuery.of(context).size.height / 4;

      if (widget.text.length > textHeight) {
        setState(() {
          fistHalf = widget.text.substring(0, textHeight.toInt());
          secondHalf =
              widget.text.substring(textHeight.toInt() + 1, widget.text.length);
        });
      } else {
        setState(() {
          fistHalf = widget.text;
          secondHalf = "";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(widget.text)
          : Column(
              children: [
                Text(hiddenText ? (fistHalf + "...") : (fistHalf + secondHalf),
                style: TextStyle(fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(children: [
                    Text("see more",
                        style: TextStyle(
                            fontSize: 12, color: Mycolor.primaryColor)),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Mycolor.primaryColor,
                    )
                  ]),
                )
              ],
            ),
    );
  }
}
