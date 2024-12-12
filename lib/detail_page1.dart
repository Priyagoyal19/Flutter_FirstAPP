import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailPage1 extends StatefulWidget {
  const DetailPage1({super.key});

  @override
  State<DetailPage1> createState() => _DetailPage1State();
}

class _DetailPage1State extends State<DetailPage1> {
  int currentIndex=0;
  List imageList = [
    {"id": 1, "image_path": "assets/images/car5.jpg"},
    {"id": 2, "image_path": "assets/images/car6.jpg"},
    {"id": 3, "image_path": "assets/images/car7.jpg"},
  ];
  List featuresName =["Color","Gearbox","Seat","Name"];
  List feature=["White","Automatic","4","Feature"];
  final CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(top: 10) ,
        height:70,
        color: Colors.white,
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:65,top:12),
                  child: Text('12 Month',style: TextStyle(color: Colors.black,fontSize:15,fontWeight: FontWeight.bold),),
                ),
                Row(
                  children: [
                    Padding(

                      padding: const EdgeInsets.only(left:20),
                      child: Text("IDR 4,35jt",style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:5),
                      child: Text("per month",style: TextStyle(color: Colors.grey,fontSize:15,),),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,left:40),
              child: TextButton(onPressed: (){},
                child:Text("Select This Car",style: TextStyle(color: Colors.white,fontSize:15,fontWeight:FontWeight.bold),),
                style: TextButton.styleFrom(
                  minimumSize: Size(
                    screenWidth * 0.03,
                    screenHeight * 0.07,
                  ),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(211, 211, 211, 1.0),
     body:  SingleChildScrollView(
       child: Column(
         children: [
           Container(
             color: Colors.white,
             child: Column(
               children: [
                 Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left:15,top: 50),
                      height: screenHeight*0.06,
                      width: screenWidth*0.13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color:Colors.white,
                      ),

                      child: Icon(Icons.arrow_back_ios,color: Colors.black,)
                  ),
                    Container(
                        margin: EdgeInsets.only(left:170,top: 50),
                        height: screenHeight*0.06,
                        width: screenWidth*0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          color:Colors.blue,
                        ),

                        child: Icon(Icons.bookmark_border_outlined,color: Colors.white,)
                    ),
                    Container(
                        margin: EdgeInsets.only(left:15,top: 50),
                        height: screenHeight*0.06,
                        width: screenWidth*0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          color:Colors.white,
                        ),

                        child: Icon(Icons.share,color: Colors.black,)
                    )
                  ],
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 190,top: 15),
                   child: Text("Camaro",style:TextStyle(color: Colors.black,fontSize:40,fontWeight: FontWeight.bold),),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 230),
                   child: Text("Chevrolet",style:TextStyle(color: Colors.grey,fontSize:20,),),
                 ),
               ],
             ),
           ),


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
                       aspectRatio: 1.6,
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
             height:150,
             decoration:BoxDecoration(
               color:Colors.white,
               borderRadius: BorderRadius.only(
                 bottomLeft: Radius.circular(30.0), // Adjust the values as needed
                 bottomRight: Radius.circular(30.0), // Adjust the values as needed
               ),
             ),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(

                     decoration:BoxDecoration(
                       color:Colors.blue,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     height:100 ,
                     width: 100,
                     child:Column(

                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top:10),
                           child: Text("12 Month",style: TextStyle(color: Colors.white),),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top:8),
                           child: Text("4.35jt",style: TextStyle(color: Colors.white,fontSize:25,fontWeight:FontWeight.bold),),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(bottom:9,right: 40),
                           child: Text("IDR",style: TextStyle(color: Colors.white,fontSize:12),),
                         ),
                       ],
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0,),
                   child: Container(
                     decoration:BoxDecoration(
                       boxShadow:[
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.5),
                           spreadRadius: 1,
                           blurRadius: 1,
                           offset: Offset(0, 2), // changes position of shadow
                         ),
                       ],
                       color:Colors.white,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     height:100 ,
                     width: 100,
                     child:Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top:10),
                           child: Text("6 Month",style: TextStyle(color: Colors.black),),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top:8,right: 5),
                           child: Text("4.8jt",style: TextStyle(color: Colors.black,fontSize:25,fontWeight:FontWeight.bold),),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(bottom:9,right: 40),
                           child: Text("IDR",style: TextStyle(color: Colors.black,fontSize:12),),
                         ),
                       ],
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(

                     decoration:BoxDecoration(
                       boxShadow:[
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.5),
                           spreadRadius: 1,
                           blurRadius: 1,
                           offset: Offset(0, 2), // changes position of shadow
                         ),
                       ],
                       color:Colors.white,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     height:100 ,
                     width: 100,
                     child:Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top:10),
                           child: Text("1 Month",style: TextStyle(color: Colors.black),),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top:8,right:5),
                           child: Text("5.1jt",style: TextStyle(color: Colors.black,fontSize:25,fontWeight:FontWeight.bold),),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(bottom:9,right: 40),
                           child: Text("IDR",style: TextStyle(color: Colors.black,fontSize:12),),
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(right:120,top:10),
             child: Text("SPECIFICATIONS",style: TextStyle(color: Colors.grey,fontSize:20),),
           ),
           Container(
             height: 100,
             child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: 4,
                 itemBuilder:  (context, index){
                   return Container(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                       width:150,
                       height:200,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                       ),
                        child:  Padding(
                          padding: const EdgeInsets.only(left:18,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(featuresName[index],style: TextStyle(color: Colors.grey,fontSize:18),),
                              Text(feature[index],style: TextStyle(color: Colors.black,fontSize:22,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                                          ),
                     ),
                   );
                 }),
           ),

         ],
        ),
     ),

    );
  }
}
