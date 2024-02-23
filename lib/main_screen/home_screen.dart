import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_booking/constants/colors.dart';
import 'package:restaurant_booking/cubit/upload/image_cubit.dart';
import 'package:restaurant_booking/cubit/upload/image_state.dart';
import 'package:restaurant_booking/main_screen/custom_buttom.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

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
              child: BlocConsumer<ImageCubit, ImageState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Column(
                      children: [
                        Container(
                          height: 400,
                          width: double.infinity,
                          child: state.imageFile != null
                              ? InkWell(
                                  onTap: () {
                                    _showOption(context);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.file(state.imageFile!,fit: BoxFit.cover,),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Mycolor.primaryColor),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(18),
                                      onTap: () {
                                        _showOption(context);
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Lottie.asset("animations/image.json",
                                              height: 220, width: 350),
                                          Text(
                                            "Upload Image",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18),
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
                              if (state.status == ImageStateStatus.loading) ...[
                                Lottie.asset(
                                  "animations/loading (2).json",
                                  height: 100,
                                ),
                              ],
                              
                           if (state.status == ImageStateStatus.success)...[  Container(
                                child: TextFormField(
                                  enabled: true,
                                  controller: context
                                      .read<ImageCubit>()
                                      .textEditingController,
                                  decoration: InputDecoration(
                                    enabledBorder: border(),
                                    border: border(),
                                  ),
                                ),
                              ),
                           ],
                           SizedBox(height: 20,),
                              CustomTextButton(
                                onPressed: () {
                                  context
                                      .read<ImageCubit>()
                                      .upload(context: context);
                                },
                                text: "Tell",
                                fontSize: 13,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextButton(
                                onPressed: () {
                                  context.read<ImageCubit>().speak();
                                },
                              
                                text: "Read",
                                  fontSize: 13,
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  })),
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
                ImageCubit.get(context).imageFromGallery();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: Mycolor.primaryColor,
              ),
              title: Text("Camera"),
              onTap: () {
                ImageCubit.get(context).imageFromCamera();
              },
            )
          ],
        ),
      ),
    ),
  );
}
