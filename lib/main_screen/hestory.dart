import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_booking/cubit/history_cubit/history_cubit.dart';
import '../constants/colors.dart';


class History extends StatefulWidget {
  History({
    Key? key,
  }) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {


  @override
  void initState() {
    super.initState();

    context.read<HistoryCubit>().loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 300,
                child: Lottie.asset("animations/history.json"),
              ),
              Text(
                "History",
                style: TextStyle(color: Mycolor.primaryColor, fontSize: 30,
                fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<HistoryCubit, List<String>>(
                builder: (context, state) {
                  return Column(
                    children: state.map((item) {
                      return CustomProcess(
                        title: item,
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomProcess extends StatelessWidget {
  const CustomProcess({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        height: heightScreen * 0.11,
        width: widthScreen,
        padding: EdgeInsets.all(widthScreen * 0.03),
        decoration: BoxDecoration(
          color: Mycolor.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$title",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
