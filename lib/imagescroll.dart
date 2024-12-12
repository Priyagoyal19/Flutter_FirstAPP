import 'package:carousel_slider/carousel_controller.dart' ;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fourth_app/carhome.dart';
import 'package:fourth_app/forgetpage.dart';
import 'package:fourth_app/signInpage.dart';
import 'navbar_view.dart';

class Imagescroll extends StatefulWidget {
  const Imagescroll({super.key});

  @override
  State<Imagescroll> createState() => _ImagescrollState();
}

class _ImagescrollState extends State<Imagescroll> {
  String name ="";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateEmail(value)
  {
    if(value!.isEmpty)
    {
      return 'please enter an email';
    }
    RegExp emailRegEXp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if(!emailRegEXp.hasMatch(value)){
      return 'please enter a valid email';
    }
    return null;
  }
  String? _validatePassword(value)
  {
    if(value!.isEmpty)
    {
      return 'please enter  password';
    }
    if(value.length<8)
    {
      return 'please enter atleast 8 digit password';
    }
  }

  List imageList=[
    {"id":1,"image_path":'assets/images/rent1.jpg'},
    {"id":2,"image_path":'assets/images/rent2.jpg'},
    {"id":3,"image_path":'assets/images/rent3.jpg'}
  ];
  final CarouselSliderController carouselController = CarouselSliderController();

  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor:  Color.fromRGBO(211, 211, 211,1.0),
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(5.0),
     child:  AppBar(
        backgroundColor:Colors.white,
    ),
      ),
    body:SingleChildScrollView(
        child: Column(
          children: [
            Stack(
            children: [
             InkWell(
               onTap: (){
                 print(currentIndex);
               },
                   child: CarouselSlider(
                     items:imageList.map(
                         (item)=>Image.asset(
                           item['image_path'],
                           fit: BoxFit.cover,
                           width: double.infinity,

                         ),
                     )
                         .toList(),
                     carouselController: carouselController,
                     options:CarouselOptions(
                       scrollPhysics: const BouncingScrollPhysics(),
                       aspectRatio: 1.9,
                       autoPlay:true,
                       viewportFraction: 1,
                       onPageChanged: (index,reason)
                         {
                           setState(() {
                             currentIndex=index;
                           });
                         }
                     ),

                   ),
                  //

             ),
              Positioned(
              bottom:10,
                left:0,
                right: 0,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:imageList.asMap().entries.map((entry)
                  {
                    print(entry);
                    print(entry.key);
                    return GestureDetector(
                      onTap: ()=>carouselController.animateToPage(entry.key),
                      child:Container(
                        width: currentIndex == entry.key?17:7,
                        height:7.0,
                        margin:const EdgeInsets.symmetric(
                          horizontal:3.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color:currentIndex == entry.key?Colors.black:Colors.grey
                        ),
                      ),

                    );
                  }
                  ).toList(),
                ),
              ),
          ],
        ),
            Container(

              height: screenHeight*0.16,
              width:screenWidth*1.0,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0), // Adjust the values as needed
                  bottomRight: Radius.circular(40.0), // Adjust the values as needed
                ),
                color:Colors.white,
              ),
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10,top: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Welcome!",style: TextStyle(fontSize:25,fontWeight:FontWeight.bold),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10),
                    child: Text("Travel and live the new exprience of rent the cars from your home",style: TextStyle(color: Colors.grey,fontSize:17),),
                  )

                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                autovalidateMode:AutovalidateMode.onUserInteraction,
                decoration:InputDecoration(
                    hintText:"Enter your email",
                    labelText:"Email"
                ),
                validator:_validateEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                autovalidateMode:AutovalidateMode.onUserInteraction,
                obscureText: true,
                decoration:InputDecoration(
                    hintText:"*********",
                    labelText:"Password"
                ),
                validator: _validatePassword,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child:Text("Forget your password?",style:TextStyle( color: Colors.blue,fontSize:15),),
                style:TextButton.styleFrom(minimumSize: Size(120,40)),
                onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Forgetpage()),);
                },

              ),
            ),
            SizedBox(
              height:10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child:TextButton(
                child:Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text("Sign In",style:TextStyle( color: Colors.white,fontSize:20)),
                        Container(
                            margin: EdgeInsets.only(left:197),
                           height: screenHeight*0.06,
                            width: screenWidth*0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:Colors.white,
                            ),

                            child: Icon(Icons.arrow_forward_ios,color: Colors.blue,)
                        )
                      ],
                    ),
                ),
                style:TextButton.styleFrom(
                    minimumSize: Size( screenWidth*0.3, screenHeight*0.08,),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),

                onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const NavBarView()),);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:50),
              child: Row(
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed:(){
                       Navigator.push(context,MaterialPageRoute(builder: (context) => Signinpage()),);
                      },
                      child: Text("Sign up for free",style:TextStyle( color: Colors.blue,),))
                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
