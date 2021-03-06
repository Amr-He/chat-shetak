import 'dart:io';

import 'package:chatnewss/Services/auth.dart';
import 'package:chatnewss/VIews/Home.dart';
import 'package:chatnewss/VIews/Signin.dart';
import 'package:chatnewss/allConstants/color_constants.dart';
import 'package:chatnewss/helperfunctions/shardpref_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Dashbord extends StatefulWidget {
  final String chatWithUsername;

  const Dashbord({Key key, this.chatWithUsername}) : super(key: key);
  @override
  _DashbordState createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {

  @override


  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("Exit App"),
        content: Text("Do you want to exit an App?"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          )

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffb7dcea),Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: NavDrawer(),
          appBar: AppBar(
            brightness: Brightness.dark,
            //remove bcakgroundcolor from appbar
            backgroundColor: Colors.transparent,
            //remove shadwo frome app bar
            elevation: 0 ,
            flexibleSpace:Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(30) ),
                gradient: LinearGradient(
                  colors: [HexColor("#80b1fe"),HexColor("#3D50E7")],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            title: Text('Home',style: TextStyle(color: Colors.white),),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "myName",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                        Text(
                          "Welcome To Sehetk!!",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xff80B1FE),),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("myProfilePic"),
                  ) ,
                ),
              ),
              SizedBox(height: 50,),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/icons8_shopping_cart_240px_1 1.png",),
                                  Text('Online Pharmacy',style: TextStyle(fontSize: 12,color: Colors.white),),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: ()=>Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home())),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/chat.png",height: 60,),
                                  Text('Online Consultation',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/icons8_home_80px 1.png",height: 60,),
                                  Text('Home Examinations',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/icons8_timesheet_128px 1.png",height: 60,),
                                  Text('Book An Appointment',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/icons8_health_checkup_100px 1.png",height: 60,),
                                  Text('Intial Diagnosis',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff80B1FE),
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: (){},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset("assets/lottie/image 5.png",height: 60,),
                                  Text('SOS',style: TextStyle(fontSize: 12,color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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




class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage('',),
                ),
                Text("Amr Helmy",style:
                TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
                Text("+201009152403",style:
                TextStyle(fontSize: 12,color: Colors.grey[600]),)
              ],
            ),
          ),

          ListTile(
            leading: Image.asset("assets/lottie/setuser.png"),
            title: Text('Account settings',style: TextStyle(color: HexColor("#807C7C")),),
            onTap: () => {},
          ),
          ListTile(
            leading:  Image.asset("assets/lottie/setting.png"),
            title: Text('Setting',style: TextStyle(color: HexColor("#807C7C")),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Image.asset("assets/lottie/Group.png"),
            title: Text('Feedback & Contact us',style: TextStyle(color: HexColor("#807C7C")),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Divider(
              color: HexColor("#E5E5E9"),
          ),
          ListTile(
            leading: Image.asset("assets/lottie/share 1.png"),
            title: Text('Tell your friend',style: TextStyle(color: HexColor("#807C7C")),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Image.asset("assets/lottie/Logout.png"),
            title: Text('Sign out',style: TextStyle(color: HexColor("#807C7C")),),
            onTap: () {
                AuthMethods().signOut().then((s) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => SignIN()));
                });
              },
            ),
        ],
      ),
    );
  }
}