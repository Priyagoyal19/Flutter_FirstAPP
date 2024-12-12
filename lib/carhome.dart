import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fourth_app/detail_page1.dart';
import 'package:fourth_app/notification.dart';
import 'package:fourth_app/profile.dart';
import 'package:fourth_app/search.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Carhome extends StatefulWidget {
  const Carhome({super.key});

  @override
  State<Carhome> createState() => _CarhomeState();
}

class _CarhomeState extends State<Carhome> {


  int currentIndex=0;
  List imageList = [
    {"id": 1, "image_path": 'assets/images/car1.jpg'},
    {"id": 2, "image_path": 'assets/images/car2.jpg'},
    {"id": 3, "image_path": 'assets/images/car3.jpg'},
    {"id": 4, "image_path": 'assets/images/car4.png'}
  ];
  List<String> carList = [
    "https://imgd.aeplcdn.com/370x208/n/cw/ec/130591/fronx-exterior-right-front-three-quarter-109.jpeg?isig=0&q=80",
      "https://imgd.aeplcdn.com/370x208/n/cw/ec/141867/nexon-exterior-right-front-three-quarter-71.jpeg?isig=0&q=80",
    "https://imgd.aeplcdn.com/370x208/n/xrtambb_1688455.jpg?q=80",
      "https://www.carandbike.com/_next/image?url=https%3A%2F%2Fimages.carandbike.com%2Fcar-images%2Fcolors%2Ftata%2Fnexon-ev%2Ftata-nexon-ev-creative-ocean.jpg%3Fv%3D1697525496&w=750&q=75"
  ];
  List<String> time=["Weekly","Montly","Weekly","Montly"];
  List<String> time1=["per week","per month","per week","per month"];
  List<String> name=["Land Rover","Alfa Romeo","Land Rover","Alfa Romeo"];
  List<String> search=["Discover","C4","Discover","C4"];
  List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.greenAccent,

    // Add more colors here if needed
  ];


  List<Color> boxcolors = [
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    // Add more colors here if needed
  ];
  List<String> app=["Hertz","Avis","Hertz","Avis"];
  List<String> offers=["174 offers","126 offers","174 offers","126 offers"];
  final CarouselSliderController carouselController = CarouselSliderController();


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(211, 211, 211, 1.0),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/boy.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: Text(
                  'IDR',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  '17,7jt',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    print(currentIndex);
                  },
                  child: CarouselSlider(
                    items: imageList
                        .map(
                          (item) => Image.asset(
                            item['image_path'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        aspectRatio: 1.9,
                        autoPlay: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        }),
                  ),
                  //
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.asMap().entries.map((entry) {
                      print(entry);
                      print(entry.key);
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 17 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3.0,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? Colors.black
                                  : Colors.grey),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Container(
              height: screenHeight * 0.14,
              width: screenWidth * 1.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  // Adjust the values as needed
                  bottomRight:
                      Radius.circular(40.0), // Adjust the values as needed
                ),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "GTR",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Nissan",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 170, bottom: 20),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'My Garage',
                            style: TextStyle(color: Colors.blue),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text("Available Cars",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          Text("Long term short term",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 100),
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blue,
                          ))
                    ],
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size(
                    screenWidth * 0.3,
                    screenHeight * 0.13,
                  ),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Carhome()),
                  );
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("TOP DEALERS",
                      style: TextStyle(color: Colors.grey, fontSize: 23)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text("More",
                            style: TextStyle(color: Colors.blue, fontSize: 15)),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                        size: 15,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const DetailPage1()),);
                    },
                    child: Container(
                      width:200,
                      height:300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.all(8.0),
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:90,top:10),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[100],
                                ),
                                width:70,
                              child:Center(child: Text(time[index],style:TextStyle(color:Colors.blue),))

                            ),
                          ),
                          Image.network(carList[index],height: 150,),
                          Padding(
                            padding: const EdgeInsets.only(right: 110),
                            child: Text(search[index],style:TextStyle(color:Colors.grey,fontSize:18),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:20),
                            child: Text(name[index],style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:110),
                            child: Text(time1[index],style:TextStyle(color:Colors.grey,fontSize: 15),),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("TOP DEALS",
                      style: TextStyle(color: Colors.grey, fontSize: 25)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 130),
                        child: Text("More",
                            style: TextStyle(color: Colors.blue, fontSize: 15)),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                        size: 15,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },
                    child: Container(
                      width:180,
                      height:200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.all(8.0),
                      child:Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:colors[index],
                                ),
                                child:Center(child: Text(app[index],style: TextStyle(color:boxcolors[index] ,fontSize:20,fontWeight: FontWeight.bold),)),
                                height:80,
                                width: 80,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5),
                              child: Text(app[index],style: TextStyle(color:Colors.black,fontSize:20,fontWeight: FontWeight.bold),),
                            ),
                            Text(offers[index],style: TextStyle(color:Colors.grey,fontSize:15),),
                          ],
                        ),
                      ),
                    ),
                  );

                },
              ),
            ),

          ],

        ),
      ),
    );
  }
}

