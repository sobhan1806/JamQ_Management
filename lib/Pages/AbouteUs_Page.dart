import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaam_q/Pages/Access_Page.dart';
import 'package:jaam_q/Pages/Advertises_Page.dart';
import 'package:jaam_q/Pages/ApplicationAvilability_Page.dart';
import 'package:jaam_q/Pages/ApplicationUsers_Page.dart';
import 'package:jaam_q/Pages/Discount_Page.dart';
import 'package:jaam_q/Pages/Home_Page.dart';
import 'package:jaam_q/Pages/InviteLog_Page.dart';
import 'package:jaam_q/Pages/LoginToAppLog_Page.dart';
import 'package:jaam_q/Pages/Login_Page.dart';
import 'package:jaam_q/Pages/Register_Page.dart';
import 'package:jaam_q/Pages/Transactions_Page.dart';
import 'package:jaam_q/Pages/Notification_Page.dart';
import 'package:jaam_q/Pages/OtherApps_Page.dart';
import 'package:jaam_q/Pages/PanelUsers_Page.dart';
import 'package:jaam_q/Pages/Tickets_Page.dart';
import 'package:jaam_q/Pages/UnauthorizedWords_Page.dart';

class AbouteUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AbouteUsState();
  }
}

class AbouteUsState extends State<AbouteUs> {
  var check = 'assets/images/checked.png';
  var off = 'assets/images/power.png';
  bool CheckBoxValue = false;
  bool IsAvillable = false;
  Image image;
  var picdecode;
  var img64;
  var imageimg64;
  var jsonimg64;
  var ispic;

  List data;
  List AbouteUsDataList;

  TextEditingController SearchTextBox;

  @override
  void intitState() {
    super.initState();

    SearchTextBox = new TextEditingController();
  }
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(child: Scaffold(
      body: Center(
        child: Stack(
            children: [
              Container(
                height: 60,
                color: Color(0xff24026E),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(padding: EdgeInsets.only(right: 80),
                        child: new Text("JamQ", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 40)),
                      ),// JamQ
                    ]),
              ),// بالا
              Padding(padding: EdgeInsets.only(right: 745, top: 80),
                child: new Text("درباره ما", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
              ),// عنوان صفحه
              Padding(padding: EdgeInsets.only(right: 400, top: 190),
                child: new Text("عنوان", style: new TextStyle(color: Colors.deepPurple, fontFamily: 'IRANSans', fontSize: 20)),
              ),// عنوان
              Padding(padding: EdgeInsets.only(left: 330,right: 450, top: 180),
                child: Card(
                  color: Color(0xff9370DB),
                  child: Container(
                    width: width,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Flexible(
                            fit: FlexFit.loose,
                            child: new Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: TextField(style: TextStyle(color: Colors.white),controller: SearchTextBox, textAlign: TextAlign.right, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "... متن مورد نظر را بنویسید", hintStyle: TextStyle(color: Colors.black26)),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 2,
                                  maxLength: 125,
                                  autofocus: true,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر عنوان
              Padding(padding: EdgeInsets.only(right: 410, top: 305),
                child: new Text("متن", style: new TextStyle(color: Colors.deepPurple, fontFamily: 'IRANSans', fontSize: 20)),
              ),// متن
              Padding(padding: EdgeInsets.only(left: 330,right: 450, top: 295),
                child: Card(
                  color: Color(0xff9370DB),
                  child: Container(
                    width: width,
                    height: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Flexible(
                            fit: FlexFit.loose,
                            child: new Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: TextField(style: TextStyle(color: Colors.white),controller: SearchTextBox, textAlign: TextAlign.right, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "... متن مورد نظر را بنویسید", hintStyle: TextStyle(color: Colors.black26)),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 8,
                                  maxLength: 400,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر متن
              Padding(padding: EdgeInsets.only(right: 620, top: 580),
                child:
                Container(
                  width: 100,
                  height: 30,
                  child: Padding(
                    padding: EdgeInsets.only(right: 18, top: 2),
                    child: new Text("ایجاد کردن", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff483D8B),
                  ),
                ),
              ), // ایجاد کردن
              Padding(padding: EdgeInsets.only(right: 760, top: 580),
                child:
                Container(
                  width: 100,
                  height: 30,
                  child: Padding(
                    padding: EdgeInsets.only(right: 32, top: 2),
                    child: new Text("لیست", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff483D8B),
                  ),
                ),
              ), // لیست
            ]),
      ),
    ), onWillPop:  () => Future(() => false));
  }
}