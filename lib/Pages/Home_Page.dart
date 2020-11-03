import 'dart:html';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaam_q/Pages/LoginReport_Page.dart';
import 'package:jaam_q/Pages/TournamentTypes_Page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'AbouteUsList_Page.dart';
import 'AbouteUs_Page.dart';
import 'Access_Page.dart';
import 'Advertises_Page.dart';
import 'ApplicationAvilability_Page.dart';
import 'ApplicationUsers_Page.dart';
import 'CreateUnauthorizedWords_Page.dart';
import 'Discount_Page.dart';
import 'InviteLog_Page.dart';
import 'Login_Page.dart';
import 'QuestionsTypes_Page.dart';
import 'Register_Page.dart';
import 'Transactions_Page.dart';
import 'Notification_Page.dart';
import 'OtherApps_Page.dart';
import 'PanelUsers_Page.dart';
import 'Tickets_Page.dart';
import 'UnauthorizedWords_Page.dart';

class Home extends StatefulWidget {
  var UserNameResponse;
  Home(this.UserNameResponse);
  Home.none();

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  bool applicationusers;
  bool panelusers;
  bool register;
  bool transactions;
  bool access;
  bool advertising;
  bool tournaments;
  bool unauthorizedwords;
  bool questions;
  bool notification;
  bool tickets;
  bool discounts;
  bool applogintoreports;
  bool appinvitationtoreports;
  bool aboutus;
  bool InAppItems;
  bool Awards;
  var appscaffold;
  Future loadfuture;
  List panelInformation, accessinformation, ACData;
  var UserName, AccessLevel;

  @override
  void initState() {
    super.initState();
    UserName = widget.UserNameResponse.toString();
    loadfuture =  GetPanelUsersByUserName();
  }
  Widget build(BuildContext context) {

    return WillPopScope(child: FutureBuilder(
      future:loadfuture ,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;

        if(snapshot.hasData){
          appscaffold = Scaffold(
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
                            ),
                            Padding(padding: EdgeInsets.only(right: 450),
                              child: Center(
                                child: Text(' : نام کاربری', style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 14), textAlign: TextAlign.left),
                              ),
                            ),// نام کاربری
                            Padding(padding: EdgeInsets.only(top: 15),
                              child: Container(
                                width: 220,
                                height: 35,
                                child: new Text(UserName, style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 14), textAlign: TextAlign.right),
                              ),
                            ),// User Name
                          ]),
                    ),// بالا
                    Padding(padding: EdgeInsets.only(left: 1090, top: 60),
                      child: Container(
                        height: height,
                        width: width,
                        color: Color(0xff2E0273),
                        child: ListView(
                          children: [
                            new ListTile(
                              leading: Icon(Icons.home, color: Colors.white, size: 26),
                              title: new Text("خانه",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(Icons.supervised_user_circle, color: Colors.white, size: 26),
                              title: new Text("کاربران اپلیکیشن",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(applicationusers == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else{
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(textDirection: TextDirection.rtl,
                                          child: ApplicationUsers())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(Icons.supervised_user_circle, color: Colors.white, size: 26),
                              title: new Text("کاربران پنل",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(panelusers == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: PanelUsers())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(Icons.person_add, color: Colors.white, size: 26),
                              title: new Text("ثبت نام کاربر پنل",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(register == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Register())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(Icons.drag_handle, color: Colors.white, size: 26),
                              title: new Text("دسترسی ها",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(register == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Access())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(FontAwesomeIcons.funnelDollar, color: Colors.white, size: 24),
                              title: new Text("تراکنش ها",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(transactions == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Transactions())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(Icons.picture_in_picture, color: Colors.white, size: 25),
                              title: new Text("تبلیغات",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(advertising == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Advertises())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(FontAwesomeIcons.medapps, color: Colors.white, size: 26),
                              title: new Text("مسابقات",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(tournaments == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: TournamentTypes())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(Icons.question_answer, color: Colors.white, size: 26),
                              title: new Text("سوالات",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(questions == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: QuestionsTypes())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(Icons.message, color: Colors.white, size: 23),
                              title: new Text("نوتیفیکیشن",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(notification == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Notifications())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(Icons.sticky_note_2, color: Colors.white, size: 26),
                              title: new Text("تیکت های پشتیبانی",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(tickets == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Tickets())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(FontAwesomeIcons.percent, color: Colors.white, size: 18),
                              title: new Text("تخفیف ها",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(discounts == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Discount())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(Icons.featured_play_list, color: Colors.white, size: 22),
                              title: new Text("گزارشات ورود به پنل",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(applogintoreports == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: LoginReport())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(Icons.featured_play_list, color: Colors.white, size: 22),
                              title: new Text("گزارشات دعوت به اپلیکیشن",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(appinvitationtoreports == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: InviteLog())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(FontAwesomeIcons.fileWord, color: Colors.white, size: 26),
                              title: new Text("کلمات غیر مجاز",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(unauthorizedwords == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: CreateUnauthorizedWords())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(FontAwesomeIcons.toggleOff, color: Colors.white, size: 21),
                              title: new Text("فعال/غیرفعال کردن اپلیکیشن",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(applogintoreports == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Tickets())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(FontAwesomeIcons.listAlt, color: Colors.white, size: 22),
                              title: new Text("درباره ما",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                if(aboutus == false){
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "پیغام",
                                    desc: "!!!به این بخش دسترسی ندارید",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "تایید",
                                          style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color(0xffD3D3D3),
                                      )
                                    ],
                                  ).show();
                                }else {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: AbouteUsList())),
                                          (Route<dynamic> route) => false);
                                }
                              },
                            ),
                            Container(
                              height: 1,
                              child: Divider(
                                thickness: 0.1,
                                color: Colors.grey,
                              ),
                            ),
                            new ListTile(
                              leading: Icon(Icons.exit_to_app, color: Colors.white, size: 27),
                              title: new Text("خروج",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                              onTap: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) =>
                                    new Directionality(textDirection: TextDirection.rtl, child: Login())),(Route<dynamic> route) => false);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),// سمت راست
                  ]),
            ),
          );
        }
        return snapshot.hasData ?  new Scaffold(
          body: appscaffold,
        ) : new Center(child: CircularProgressIndicator(),);
      },
    ), onWillPop: () => Future(() => false));
  }
  GetPanelUsersByUserName() async{
    print('GetPanelUsersByUserName Run...');
    UserName = widget.UserNameResponse;
    print('UserName = '+UserName);

      try {
        FormData formData = FormData.fromMap({
          "UserName":UserName,
        });
        Response response = await Dio().post("http://jamq.ir:3000/Management/GetPanelUserByUserName",options: Options(contentType: 'multipart/form-data'),data:formData);
        if(response.data.toString() != 'User Does Not Exist!!!'){
          panelInformation = response.data;
          print('GetPanelUsersByUserName = '+panelInformation.toString());
          AccessLevel = panelInformation[0]["AdmAccessLevel"];
          print('AccessLevel = '+AccessLevel);
          GetOChartByAccessLevel();
          return panelInformation;
        }else{
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: "!!!کاربر یافت نشد",
            buttons: [
              DialogButton(
                child: Text(
                  "تایید",
                  style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                ),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>
                    new Directionality(textDirection: TextDirection.rtl, child: Login())),(Route<dynamic> route) => false),
                color: Color(0xffD3D3D3),
              )
            ],
          ).show(); // Message
        }
      } catch (e) {
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: "!!!ارتباط با سرور برقرار نیست",
          buttons: [
            DialogButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
              ),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                  new Directionality(textDirection: TextDirection.rtl, child: Login())),(Route<dynamic> route) => false),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
        print(e);
      }
  }
  GetOChartByAccessLevel() async{
    print('GetOChartByAccessLevel Run...');

    try {
      FormData formData = FormData.fromMap({
        "AccessLevel":AccessLevel,
      });
      Response response = await Dio().post("http://jamq.ir:3000/Management/GetOChartByAccessLevel",options: Options(contentType: 'multipart/form-data'),data:formData);
      if(response.data.toString() != 'Ochart Does Not Exist!!!'){
        accessinformation = response.data;
        FillInfo(response.data);
        return accessinformation;
      }else{
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: "!!!برنامه با مشکل مواجه شده است",
          buttons: [
            DialogButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
              ),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                  new Directionality(textDirection: TextDirection.rtl, child: Login())),(Route<dynamic> route) => false),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
      }
    } catch (e) {
      Alert(
        context: context,
        type: AlertType.none,
        title: "پیغام",
        desc: "!!!ارتباط با سرور برقرار نیست",
        buttons: [
          DialogButton(
            child: Text(
              "تایید",
              style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
            ),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) =>
                new Directionality(textDirection: TextDirection.rtl, child: Login())),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  FillInfo(var response) async{
    print('FillInfo Run...');
    try {
      ACData = accessinformation[0]["OCAccesses"];
      print('ACData = '+ACData.toString());
      applicationusers = ACData[0]["Applicationusers"];
      panelusers = ACData[1]["Panelusers"];
      panelusers = ACData[1]["Register"];
      transactions = ACData[2]["Transactions"];
      access = ACData[3]["Access"];
      advertising = ACData[4]["Advertising"];
      tournaments = ACData[5]["Tournaments"];
      unauthorizedwords = ACData[6]["Unauthorizedwords"];
      questions = ACData[7]["Questions"];
      notification = ACData[8]["Notification"];
      tickets = ACData[9]["Tickets"];
      discounts = ACData[10]["Discounts"];
      applogintoreports = ACData[11]["Applogintoreports"];
      appinvitationtoreports = ACData[12]["Appinvitationtoreports"];
      aboutus = ACData[13]["Aboutus"];
      InAppItems = ACData[14]["Inappitems"];
      Awards = ACData[15]["Awards"];

    } catch (e) {
      Alert(
        context: context,
        type: AlertType.none,
        title: "پیغام",
        desc: "!!!ارتباط با سرور برقرار نیست",
        buttons: [
          DialogButton(
            child: Text(
              "تایید",
              style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
            ),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) =>
                new Directionality(textDirection: TextDirection.rtl, child: Login())),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
}