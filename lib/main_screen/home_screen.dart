import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_booking/constants/colors.dart';
import 'package:restaurant_booking/upload/upload_cubit.dart';

import 'package:showcaseview/showcaseview.dart';

import '../cubit/history_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

final TextEditingController textEditingController = TextEditingController();

class HomeScreenState extends State<HomeScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('photo');

// Show Option
  _showOption(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.image,
                        color: Mycolor.primaryColor,
                      ),
                      title: Text("Gallery"),
                      onTap: () {
                        UploadCubit.get(context).imageFromGallery();
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.camera_alt,
                        color: Mycolor.primaryColor,
                      ),
                      title: Text("Camera"),
                      onTap: () {
                        UploadCubit.get(context).imageFromCamera();
                      },
                    )
                  ],
                ),
              ),
            ));
  }

  final GlobalKey globalKeyOne = GlobalKey();
  final GlobalKey globalKeyTwo = GlobalKey();
  final GlobalKey globalKeyThere = GlobalKey();
  final GlobalKey globalKeyFour = GlobalKey();

  Future<void> data() async {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context).startShowCase(
            [globalKeyOne, globalKeyTwo, globalKeyThere, globalKeyFour]));
  }

  final FlutterTts flutterTts = FlutterTts();

  speak(String text) async {
    await flutterTts.setLanguage("en-Us");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  child: UploadCubit.get(context).imageFile != null
                      ? InkWell(
                          onTap: () {
                            _showOption(context);
                          },
                          child: Container(
                            child:
                                Image.file(UploadCubit.get(context).imageFile!),
                          ),
                        )
                      : Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Mycolor.primaryColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: InkWell(
                              onTap: () {
                                _showOption(context);
                              },
                              child: Column(
                                children: [
                                  Lottie.asset("animations/image.json",
                                      height: 220, width: 350),
                                  Text(
                                    "Upload image",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
                SizedBox(height: 35),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      BlocConsumer<UploadCubit, UploadState>(
                        listener: (context, state) {
                          if (state is UploadSucess) {
                            textEditingController.text =
                                state.responseModel.result;
                          }
                        },
                        builder: (context, state) {
                          return ConditionalBuilder(
                            fallback: (context) {
                              return CircularProgressIndicator();
                            },
                            condition: state is! UploadLoading,
                            builder: (context) {
                              return Container(
                                child: TextFormField(
                                  enabled: false,
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    enabledBorder: border(),
                                    // disabledBorder: border(),

                                    border: border(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      GestureDetector(
                        onTap: (() {
                          context.read<UploadCubit>().upload();
                        }),
                        child: Container(
                          height: 55,
                          margin: EdgeInsets.only(left: 40, right: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Mycolor.primaryColor,
                          ),
                          width: 250,
                          child: Center(
                              child: Text(
                            "Tell",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.5),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          speak(textEditingController.text);
                          context
                              .read<HistoryCubit>()
                              .saveValue(textEditingController.text);
                        },
                        child: Container(
                          height: 55,
                          margin: EdgeInsets.only(left: 40, right: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Mycolor.primaryColor,
                          ),
                          width: 250,
                          child: Center(
                              child: Text(
                            "Read",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.5),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

UnderlineInputBorder border() {
  return UnderlineInputBorder(
      borderSide: BorderSide(
    color: Colors.white,
  ));
}
