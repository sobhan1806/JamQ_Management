import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:jaam_q/Pages/PanelUsersInfo_Page.dart';
import 'package:jalali_date/jalali_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'AbouteUsList_Page.dart';
import 'Access_Page.dart';
import 'Advertises_Page.dart';
import 'ApplicationAvilability_Page.dart';
import 'ApplicationUsers_Page.dart';
import 'Awards_Page.dart';
import 'Discount_Page.dart';
import 'Home_Page.dart';
import 'InAppItems.dart';
import 'InviteLog_Page.dart';
import 'LoginReport_Page.dart';
import 'Login_Page.dart';
import 'QuestionsTypes_Page.dart';
import 'Register_Page.dart';
import 'TournamentTypes_Page.dart';
import 'Transactions_Page.dart';
import 'Notification_Page.dart';
import 'OtherApps_Page.dart';
import 'PanelUsers_Page.dart';
import 'Tickets_Page.dart';
import 'UnauthorizedWords_Page.dart';

class AdvertisesInfo extends StatefulWidget {
  var IdResponse, NameResponse, UserNameResponse;
  AdvertisesInfo(this.IdResponse, this.NameResponse, this.UserNameResponse);
  AdvertisesInfo.none();

  @override
  State<StatefulWidget> createState() {
    return AdvertisesInfoState();

  }
}

class AdvertisesInfoState extends State<AdvertisesInfo> {
  final NameTextBox = TextEditingController();
  final PlaceTextBox = TextEditingController();
  final IsActivatedTextBox = TextEditingController();
  final CreationDateTextBox = TextEditingController();
  final CreateByTextBox = TextEditingController();
  final URLTextBox = TextEditingController();
  var Id, Name;
  bool isactivate;
  var appscaffold;
  Future loadfuture;
  List advInformation;
  var _image;
  var picdecode;
  var img64;
  var imageimg64;
  var jsonimg64;
  bool ispic = false;

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
  bool appavilability;
  bool inappitems;
  bool awards;
  bool aboutus;

  List panelInformation, accessinformation, ACData;
  var UserName, AccessLevel;

  @override
  void initState() {
    super.initState();
    UserName = widget.UserNameResponse.toString();
    loadfuture =  GetAdvertisesByName();
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
                    new Align(alignment: Alignment.topCenter,
                      child: Container(
                        width: width,
                        height: 60,
                        color: Color(0xff24026E),
                        child: Padding(padding: EdgeInsets.only(left: 400, right: 80),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Text("JamQ", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 40)),
                                new Text(UserName + ' : نام کاربری', style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 14)),
                              ]),
                        ),
                      ),
                    ),// بالا
                    new Align(alignment: Alignment.centerRight,
                      child: Padding(padding: EdgeInsets.only(top: 60),
                        child: Container(
                          width: 280,
                          height: height,
                          color: Color(0xff2E0273),
                          child: ListView(
                            children: [
                              new ListTile(
                                leading: Icon(Icons.home, color: Colors.white, size: 26),
                                title: new Text("خانه",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                                onTap: (){
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) =>
                                      new Directionality(textDirection: TextDirection.rtl,
                                          child: Home(UserName.toString()))),
                                          (Route<dynamic> route) => false);
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
                                title: new Text("کاربران اپلیکیشن",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                                onTap: (){
                                  if(applicationusers == false){
                                    Alert(
                                      context: context,
                                      type: AlertType.none,
                                      title: "پیغام",
                                      desc: "!!!مجوز دسترسی به کاربران اپلیکیشن را ندارید",
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
                                      desc: "!!!مجوز دسترسی به کاربران پنل را ندارید",
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
                                      desc: "!!!مجوز دسترسی به ثبت نام کاربر پنل را ندارید",
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
                                      desc: "!!!مجوز دسترسی به دسترسی ها را ندارید",
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
                                            child: Access(UserName.toString()))),
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
                                      desc: "!!!مجوز دسترسی به تراکنش ها را ندارید",
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
                                      desc: "!!!مجوز دسترسی به تبلیغات را ندارید",
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
                                            child: Advertises(UserName.toString()))),
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
                                      desc: "!!!مجوز دسترسی به مسابقات را ندارید",
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
                                            child: TournamentTypes(UserName.toString()))),
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
                                      desc: "!!!مجوز دسترسی به سوالات را ندارید",
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
                                      desc: "!!!مجوز دسترسی به نوتیفیکیشن را ندارید",
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
                                      desc: "!!!مجوز دسترسی به تیکت های پشتیبانی را ندارید",
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
                                      desc: "!!!مجوز دسترسی به تخفیف ها را ندارید",
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
                                      desc: "!!!مجوز دسترسی به گزارشات ورود به پنل را ندارید",
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
                                      desc: "!!!مجوز دسترسی به گزارشات دعوت به اپلیکیشن را ندارید",
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
                                      desc: "!!!مجوز دسترسی به کلمات غیر مجاز را ندارید",
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
                                            child: UnauthorizedWords())),
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
                                  if(appavilability == false){
                                    Alert(
                                      context: context,
                                      type: AlertType.none,
                                      title: "پیغام",
                                      desc: "!!!مجوز دسترسی به فعال/غیرفعال کردن اپلیکیشن را ندارید",
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
                                            child: ApplicationAvilability(UserName.toString()))),
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
                                leading: Icon(Icons.payment, color: Colors.white, size: 21),
                                title: new Text("پرداخت های درون برنامه",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                                onTap: (){
                                  if(inappitems == false){
                                    Alert(
                                      context: context,
                                      type: AlertType.none,
                                      title: "پیغام",
                                      desc: "!!!مجوز دسترسی به پرداخت های درون برنامه را ندارید",
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
                                            child: InAppItems())),
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
                                leading: Icon(FontAwesomeIcons.award, color: Colors.white, size: 21),
                                title: new Text("جوایز",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
                                onTap: (){
                                  if(awards == false){
                                    Alert(
                                      context: context,
                                      type: AlertType.none,
                                      title: "پیغام",
                                      desc: "!!!مجوز دسترسی به جوایز را ندارید",
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
                                            child: Awards())),
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
                                      desc: "!!!مجوز دسترسی به درباره ما را ندارید",
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
                                            child: AbouteUsList(UserName.toString()))),
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
                    ),// سمت راست
                    Padding(padding: EdgeInsets.only(right: 710, top: 80),
                      child: new Text("مشاهده تبلیغات", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                    ),// عنوان صفحه
                    Padding(padding: EdgeInsets.only(right: 405, top: 183),
                      child: new Text("عنوان", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// عنوان
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 180),
                      child: Card(
                        color: Color(0xff9370DB),
                        child: Container(
                          width: width,
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Flexible(
                                  fit: FlexFit.loose,
                                  child: new Padding(padding: EdgeInsets.fromLTRB(10, 14, 10, 0),
                                      child: TextField(style: TextStyle(color: Colors.white),controller: NameTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر عنوان
                    Padding(padding: EdgeInsets.only(right: 365, top: 223),
                      child: new Text("مکان تبلیغ", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// مکان تبلیغ
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 220),
                      child: Card(
                        color: Color(0xff9370DB),
                        child: Container(
                          width: width,
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Flexible(
                                  fit: FlexFit.loose,
                                  child: new Padding(padding: EdgeInsets.fromLTRB(10, 14, 10, 0),
                                      child: TextField(style: TextStyle(color: Colors.white),controller: PlaceTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر مکان تبلیغ
                    Padding(padding: EdgeInsets.only(right: 385, top: 265),
                      child: new Text("وضعیت", style: new TextStyle(color: Colors.deepPurple, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// وضعیت
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 260),
                      child: Card(
                        color: Color(0xff9370DB),
                        child: Container(
                          width: width,
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Flexible(
                                  fit: FlexFit.loose,
                                  child: new Padding(padding: EdgeInsets.fromLTRB(10, 14, 10, 0),
                                      child: TextField(enabled: false, style: TextStyle(color: Colors.white),controller: IsActivatedTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر وضعیت
                    Padding(padding: EdgeInsets.only(right: 360, top: 307),
                      child: new Text("تاریخ ایجاد", style: new TextStyle(color: Colors.deepPurple, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// تاریخ ایجاد
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 300),
                      child: Card(
                        color: Color(0xff9370DB),
                        child: Container(
                          width: width,
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Flexible(
                                  fit: FlexFit.loose,
                                  child: new Padding(padding: EdgeInsets.fromLTRB(10, 14, 10, 0),
                                      child: TextField(enabled: false, style: TextStyle(color: Colors.white),controller: CreationDateTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر تاریخ ایجاد
                    Padding(padding: EdgeInsets.only(right: 398, top: 345),
                      child: new Text("سازنده", style: new TextStyle(color: Colors.deepPurple, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// سازنده
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 340),
                      child: Card(
                        color: Color(0xff9370DB),
                        child: Container(
                          width: width,
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Flexible(
                                  fit: FlexFit.loose,
                                  child: new Padding(padding: EdgeInsets.fromLTRB(10, 14, 10, 0),
                                      child: TextField(enabled: false, style: TextStyle(color: Colors.white),controller: CreateByTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر سازنده
                    Padding(padding: EdgeInsets.only(right: 415, top: 387),
                      child: new Text("URL", style: new TextStyle(color: Colors.deepPurple, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// URL
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 380),
                      child: Card(
                        color: Color(0xff9370DB),
                        child: Container(
                          width: width,
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Flexible(
                                  fit: FlexFit.loose,
                                  child: new Padding(padding: EdgeInsets.fromLTRB(10, 14, 10, 0),
                                      child: TextField(style: TextStyle(color: Colors.white),controller: URLTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر URL
                    new Align(alignment: Alignment.centerLeft,
                      child: Padding(padding: EdgeInsets.only(left: 67, bottom: 145),
                        child: CircleAvatar(
                          radius: 70,
                          child: _image,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),// Circle Avatar
                    new Align(alignment: Alignment.centerLeft,
                      child: Padding(padding: EdgeInsets.only(left: 88, top: 50),
                        child: InkWell(
                          child: Container(
                            width: 100,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 30, top: 2),
                              child: new Text("انتخاب", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            SelectFilePic();
                          },
                        ),
                      ), // انتخاب
                    ),// انتخاب
                    Padding(padding: EdgeInsets.only(right: 710, top: 480),
                      child: InkWell(
                        child: Container(
                          width: 150,
                          height: 30,
                          child: Padding(
                            padding: EdgeInsets.only(right: 18, top: 2),
                            child: new Text("فعال/غیرفعال سازی", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff483D8B),
                          ),
                        ),
                        onTap: (){
                          AdvertisesIsActivate();
                        },
                      ),
                    ), // فعال/غیرفعال سازی
                    Padding(padding: EdgeInsets.only(right: 710, top: 515),
                      child: InkWell(
                        child: Container(
                          width: 150,
                          height: 30,
                          child: Padding(
                            padding: EdgeInsets.only(right: 50, top: 2),
                            child: new Text("ویرایش", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff483D8B),
                          ),
                        ),
                        onTap: (){
                          EditAdvertises();
                        },
                      ),
                    ), // ویرایش
                    Padding(padding: EdgeInsets.only(right: 710, top: 550),
                      child: InkWell(
                        child: Container(
                          width: 150,
                          height: 30,
                          child: Padding(
                            padding: EdgeInsets.only(right: 50, top: 2),
                            child: new Text("بازگشت", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff483D8B),
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: Advertises(UserName.toString()))),(Route<dynamic> route) => false);
                        },
                      ),
                    ), // بازگشت
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
  GetAdvertisesByName() async{
    print('GetAdvertisesByName Run...');
    Name = widget.NameResponse.toString();
    print('Name = '+Name);
    try {
      FormData formData = FormData.fromMap({
        "Name":Name,
      });
      Response response = await Dio().post("http://jamq.ir:3000/Ads/GetAdvertisesByName",options: Options(contentType: 'multipart/form-data'),data:formData);
      if(response.data.toString() != 'Advertises Does Not Exist!!!'){
        advInformation = response.data;
        print('GetAdvertisesByName = '+advInformation.toString());
        FillInfo();
        return advInformation;
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
                  new Directionality(textDirection: TextDirection.rtl, child: Advertises(UserName.toString()))),(Route<dynamic> route) => false),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
      }
    } catch (e) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>
          new Directionality(textDirection: TextDirection.rtl, child: Advertises(UserName.toString()))),(Route<dynamic> route) => false);
      print(e);
    }
  }
  AdvertisesIsActivate() async{
    print('AdvertisesIsActivate Run...');
    Name = widget.NameResponse.toString();
    if(advInformation[0]["AdIsActivate"] == false){
      isactivate = true;
    }else{
      isactivate = false;
    }
    try {
      FormData formData = FormData.fromMap({
        "Name":Name,
        "IsActivate":isactivate,
      });
      _openLoadingDialog(context);
      Response response = await Dio().post("http://jamq.ir:3000/Ads/AdvertisesIsActivate",options: Options(contentType: 'multipart/form-data'),data:formData);
      if(response.data.toString() == 'AdvertisesIsActivate Done!'){
        if(isactivate == false){
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: ".غیرفعال سازی با موفقیت انجام شد",
            buttons: [
              DialogButton(
                child: Text(
                  "تایید",
                  style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                ),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>
                    new Directionality(textDirection: TextDirection.rtl, child: Advertises(UserName.toString()))),(Route<dynamic> route) => false),
                color: Color(0xffD3D3D3),
              )
            ],
          ).show(); // Message
        }else{
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: ".فعال سازی با موفقیت انجام شد",
            buttons: [
              DialogButton(
                child: Text(
                  "تایید",
                  style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                ),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>
                    new Directionality(textDirection: TextDirection.rtl, child: Advertises(UserName.toString()))),(Route<dynamic> route) => false),
                color: Color(0xffD3D3D3),
              )
            ],
          ).show(); // Message
        }
      }else{
        Navigator.pop(context);
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
              onPressed: () => Navigator.pop(context),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
      }
    } catch (e) {
      Navigator.pop(context);
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
            onPressed: () => Navigator.pop(context),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  EditAdvertises() async{
    print('EditAdvertises Run...');
    if(NameTextBox.text == '' || PlaceTextBox.text == '' || URLTextBox.text == ''){
      Alert(
        context: context,
        type: AlertType.none,
        title: "پیغام",
        desc: "!!!لطفا فیلد های خالی را پر کنید",
        buttons: [
          DialogButton(
            child: Text(
              "تایید",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.grey,
          )
        ],
      ).show(); // Message
    }else{
      Id = widget.IdResponse;
      print('Id = '+Id);
      try {
        FormData formData = FormData.fromMap({
          "id":Id,
          "Name":NameTextBox.text,
          "Place":PlaceTextBox.text,
          "Image":jsonimg64,
          "AdvertisesURL":URLTextBox.text,
        });
        _openLoadingDialog(context);
        Response response = await Dio().post("http://jamq.ir:3000/Ads/UpdateAdvertises",options: Options(contentType: 'multipart/form-data'),data:formData);
        print('response = '+response.toString());
        if(response.data.toString() == 'Advertises Updated!'){
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: ".عملیات با موفقیت انجام شد",
            buttons: [
              DialogButton(
                child: Text(
                  "تایید",
                  style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                ),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>
                    new Directionality(textDirection: TextDirection.rtl, child: Advertises(UserName.toString()))),(Route<dynamic> route) => false),
                color: Color(0xffD3D3D3),
              )
            ],
          ).show(); // Message
        }else{
          Navigator.pop(context);
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
                onPressed: () => Navigator.pop(context),
                color: Color(0xffD3D3D3),
              )
            ],
          ).show(); // Message
        }
      } catch (e) {
        Navigator.pop(context);
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
              onPressed: () => Navigator.pop(context),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
        print(e);
      }
    }
  }
  SelectFilePic() async{
    Uint8List imagee  = await ImagePickerWeb.getImage(outputType: ImageType.bytes);
    img64 = base64Encode(imagee);
    jsonimg64 = jsonEncode(img64);
    picdecode = base64Decode(img64);
    _image = new Image.memory(picdecode);
    setState(() {
    });
    ispic = true;
  }
  FillInfo() async{
    print('FillInfo Run...');
    try {
      NameTextBox.text = advInformation[0]["AdName"].toString();
      PlaceTextBox.text = advInformation[0]["AdPlace"].toString();
      IsActivatedTextBox.text = IsActivate(advInformation[0]["AdIsActivate"]);
      CreationDateTextBox.text = PersianDate.fromGregorianString(Convertdate(advInformation[0]["AdCreationDate"])).toString();
      CreateByTextBox.text = advInformation[0]["AdCreatedBy"].toString();
      URLTextBox.text = advInformation[0]["AdAdvertisesURL"].toString();
      _image = advInformation[0]["AdImage"];
      print('_image = '+_image);
      if(_image == "" || _image == null){
        _image = Image.asset('assets/images/Advdef.png');
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
                new Directionality(textDirection: TextDirection.rtl, child: Advertises(UserName.toString()))),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  Convertdate(String Date){
    var DateArray =  Date.split('/');
    var DateForConvert = DateArray[0]+''+DateArray[1]+''+DateArray[2];
    //print('DADD');
    //print(DateForConvert);
    return DateForConvert;
  }
  IsActivate(var state){
    if(state == false || state == "" || state == null){
      return "غیرفعال";
    }else{
      return "فعال";
    }
  }
  void _openLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.only(top: 20,left: 10),child:  Text('...لطفا صبر کنید',style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'IRANSans'),),)
                ],
              )
          ),
        );
      },
    );
  }
}