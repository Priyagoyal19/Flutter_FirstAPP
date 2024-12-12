import 'package:flutter/material.dart';
import 'package:fourth_app/imagescroll.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  String name ="";
  TextEditingController _confirmpassword = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _submitForm()
  {
    if(_formKey.currentState!.validate())
    {}

  }
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
  String? _validatePhoneNumber(value)
  {
    if(value!.isEmpty)
    {
      return 'please enter  phone number';
    }
    if(value.length!=10)
    {
      return 'please enter a 10-digit phone number ';
    }
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _password.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(5.0),
        child:  AppBar(
          backgroundColor:Colors.white,
        ),
      ),
      backgroundColor:  Color.fromRGBO(211, 211, 211,1.0),
      body: SingleChildScrollView(
        child: Form(
          key:_formKey,
          child: Column(
            children: [
              Container(

                height: screenHeight*0.15,
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
                      padding: const EdgeInsets.only(left: 15),

                      child: Align(
                          alignment: Alignment.centerLeft,

                          child: Text("Sign Up",style: TextStyle(fontSize:30,fontWeight:FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text("Travel and live the new exprience of rent the cars from your home",style: TextStyle(color: Colors.grey,fontSize:18),),
                    )

                  ],
                ),

              ),
              Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(

          autovalidateMode:AutovalidateMode.onUserInteraction,
          decoration:InputDecoration(
          hintText:"Enter your name",
          labelText:"Name",
          ),
          onChanged:(value){
          name = value;
          setState(() {
          });
          } ,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
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
                  decoration:InputDecoration(
                      hintText:"Enter Mobile Number",
                      labelText:"Mobile Number"
                  ),
                  validator:_validatePhoneNumber,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  autovalidateMode:AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  controller: _password,
                  decoration:InputDecoration(
                      hintText:"************",
                      labelText:"Password"
                  ),
                  validator: _validatePassword,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  autovalidateMode:AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  controller:_confirmpassword,
                  decoration:InputDecoration(
                      hintText:"***************",
                      labelText:"Confirm Password"
                  ),
                  validator: _validateConfirmPassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("By signing up, I agree to the Car Rental Aoo's User Agreement and Privacy Policy."),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  child:Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text("Submit",style:TextStyle( color: Colors.white,fontSize:20)),
                        Container(
                            margin: EdgeInsets.only(left:200),
                            height: screenHeight*0.06,
                            width: screenWidth*0.11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:Colors.white,
                            ),

                            child: Icon(Icons.arrow_forward_ios,color: Colors.blue,))
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
                  onPressed:_submitForm,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:50),
                child: Row(
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                        onPressed:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Imagescroll()),);
                        },
                        child: Text("Sign in",style:TextStyle( color: Colors.blue,),))
                  ],

                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
