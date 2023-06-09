import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_booking/constants/colors.dart';

import 'package:restaurant_booking/model/team_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TeamScreen extends StatefulWidget {
  TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  bool If = true;
  PageController controller = PageController(viewportFraction: 0.8);

  Color Pink = Colors.white;
  List<Team> team = [
    Team(
        Text: "Mahmoud Ahmed",
        image: "images/mahmoud.jpeg",
        Gmail: "mahmoud12120012@gmail.com",
        Followers: 255,
        Ranking: 4.5,
        following: 3000,
        about:
            "About\n\n Ateacher at GDSC EELU Menoufia, and a\n developer of mobile applications using flutter"),
    Team(
        Text: "Ola Ayman",
        image: "images/Ola.jpeg",
        Gmail: "Oaldaoshy@gmail.com",
        Followers: 255,
        Ranking: 4.5,
        following: 3000,
        about:
            "About\n\nhave a Bachelor's degree in Computers and Information from The Egyptian University for E-Learning (EELU)."),
    Team(
        Text: "Mohab Mohammed",
        image: "images/mohab.jpg",
        Gmail: "mohab.moh2020@gmail.com",
        Followers: 255,
        Ranking: 4.5,
        following: 3000,
        about:
            "About\n\nA self taught Web Developer with hands on experience of\nbuild Websites.\nMy name is Mohab, Junior Front-end developer. have a Bachelor's degree in Computers and Information from The Egyptian University for E-Learning (EELU)."),
    Team(
        Text: "Bassma Mohammed",
        image: "images/Bassma.jpeg",
        Gmail: "basmamahaamed@gmail.com",
        Followers: 255,
        Ranking: 4.5,
        following: 3000,
        about:
            "About\n\nhave a Bachelor's degree in Computers and Information from The Egyptian University for E-Learning (EELU)."),
    Team(
        Text: "Bassant ElSobky",
        image: "images/bassant.jpg",
        Gmail: "basantheshem9@gmail.com",
        Followers: 255,
        Ranking: 4.5,
        following: 3000,
        about:
            "About\n\nFront-end developer.\nhave a Bachelor's degree in Computers and Information\nfrom The Egyptian University for E-Learning (EELU)."),
    Team(
        Text: " Heba Almowalled",
        image: "images/Heba.PNG",
        Gmail: "almowalledh@gmail.com",
        Followers: 255,
        Ranking: 4.5,
        following: 3000,
        about:
            "About\n\nhave a Bachelor's degree in Computers and Information from The Egyptian University for E-Learning (EELU)."),
    Team(
        Text: "Menna sharaf",
        image: "images/menna.jpeg",
        Gmail: "Mennakutbsharaf@gmail.com",
        Followers: 255,
        Ranking: 4.5,
        following: 3000,
        about:
            "About\n\nhave a Bachelor's degree in Computers and Information from The Egyptian University for E-Learning (EELU)."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pink,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              AnimatedCrossFade(
                firstChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        "images/tell pink.png",
                        width: 150,
                        height: 150,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "About Tell",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Mycolor.primaryColor),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: Text(
                            "Welcome to our image caption generation app!\n\nOur app is designed to help users quickly and\neasily generate captions for their images. Whether\nyou're a social media influencer, a marketer, or just\nsomeone looking to add a little extra context to\nyour personal photos, our app makes it easy to\ncreate engaging and accurate captions.\n\nOur app uses state-of-the-art AI and machine\nlearning algorithms to analyze the content of an\nimage and generate a caption that accurately\ndescribes it. Whether the image is of a landscape,\na person, or an object, our app can understand its\ncontents and generate a caption that accurately\ndescribes it.\n\nOur user interface is intuitive and easy to use,\nmaking it accessible to users of all levels of\ntechnical expertise. Simply upload an image, and\nour app will generate a caption in seconds. You\ncan also edit and refine the generated caption to\nsuit your needs.\n\nWe understand the importance of privacy and\nsecurity, so we take great care to ensure that all\nimages and captions are handled securely and\nconfidentially.\n\nOur app is constantly being updated and improved\nto ensure that we provide the best possible\nexperience for our users. We are dedicated to\nproviding an accurate, fast and user-friendly\nservice.\n\nThank you for choosing our image caption\ngeneration app, we hope you find it useful and\nenjoy using it.",
                            style: TextStyle(fontSize: 17),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Image.asset(
                          "images/line.png",
                          color: Mycolor.primaryColor,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Tell Team",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Mycolor.primaryColor),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              If = !If;
                              Pink = Mycolor.primaryColor;
                            });
                          },
                          child: Container(
                            child: Center(
                              widthFactor: 1.4,
                              heightFactor: 1.4,
                              child: Lottie.asset(
                                "animations/team.json",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            widthFactor: 1.4,
                            heightFactor: 1.4,
                            child: Text(
                              "Welcome to tell Team",
                              style: TextStyle(color: Mycolor.primaryColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ],
                ),
                secondChild: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Mycolor.primaryColor,
                        height: 690,
                        width: double.infinity,
                        child: ListView.builder(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: team.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  child: ClipOval(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage("${team[index].image}"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${team[index].Text}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${team[index].Gmail}",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: (() {}),
                                        child: Image.asset(
                                          "images/facebook.png",
                                          width: 35,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: (() {}),
                                        child: Image.asset(
                                          "images/linkedIn.png",
                                          width: 35,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: (() {}),
                                        child: Image.asset(
                                          "images/instgram.png",
                                          width: 35,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: (() {}),
                                        child: Image.asset(
                                          "images/youTube.png",
                                          width: 35,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "${team[index].Ranking}",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "Ranking",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 22,
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${team[index].following}",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Following",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 22,
                                      child: VerticalDivider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${team[index].Followers}",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Followers",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  // margin: EdgeInsets.symmetric(horizontal: 7),
                                  height: 200,
                                  width: 400,
                                  child: Text(
                                    "${team[index].about}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SmoothPageIndicator(
                        controller: controller,
                        count: team.length,
                        effect: WormEffect(
                          activeDotColor: Color.fromARGB(255, 73, 2, 159),
                          dotHeight: 13,
                          dotWidth: 13,
                          dotColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                crossFadeState:
                    If ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 1000),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
