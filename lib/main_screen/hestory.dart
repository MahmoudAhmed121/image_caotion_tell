import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors.dart';
import '../cubit/history_cubit.dart';

class Hestory extends StatefulWidget {
  Hestory({
    Key? key,
  }) : super(key: key);

  @override
  State<Hestory> createState() => _HestoryState();
}

class _HestoryState extends State<Hestory> {
  Stream<BoxEvent>? boxEventStream;

  @override
  void initState() {
    super.initState();

    context.read<HistoryCubit>().loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Lottie.asset("animations/history.json"),
            Text(
              "History",
              style: TextStyle(color: Mycolor.primaryColor, fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<HistoryCubit, List<String>>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      String item = state[index];
                      return ListTile(
                        title: Text(item),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
