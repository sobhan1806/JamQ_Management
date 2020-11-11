import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:jaam_q/Pages/LiveTournamentActive_Page.dart';
import 'package:jaam_q/Pages/LiveType_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'AbouteUsList_Page.dart';
import 'AccessList_Page.dart';
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
import 'Notification_Page.dart';
import 'PanelUsers_Page.dart';
import 'QuestionsTypes_Page.dart';
import 'Register_Page.dart';
import 'Tickets_Page.dart';
import 'Transactions_Page.dart';
import 'UnauthorizedWords_Page.dart';

class LiveManagement extends StatefulWidget{
  var MatchIdResponse, QTimeResponse, UserNameResponse;
  LiveManagement(this.MatchIdResponse, this.QTimeResponse, this.UserNameResponse);
  LiveManagement.none();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LiveManagementState();
  }

}
class LiveManagementState extends State<LiveManagement>{
  final QTimeTextBox = TextEditingController();
  var appscaffold;
  Future loadfuture;
  List playerInformation, questionsInformation, livematchInformation;
  var MatchId, QuestionId, Sended, State, Close, SendQ;
  Socket socket;

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
    connectsocket();
    UserName = widget.UserNameResponse.toString();
    QTimeTextBox.text = widget.QTimeResponse;
    loadfuture =  GetPanelUsersByUserName();
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(child: FutureBuilder(
      future:loadfuture ,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;

        if(playerInformation.length == null){
          appscaffold = Scaffold(
            body: Center(
              child: Stack(
                  children: [
                    new Align(alignment: Alignment.topCenter,
                      child: Container(
                        width: width,
                        height: 60,
                        color: Color(0xff24026E),
                        child: Padding(padding: EdgeInsets.only(right: 80),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Text("JamQ", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 40)),
                                new Text(UserName + ' : نام کاربری', style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 14)),
                                new Text('')
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
                                            child: ApplicationUsers(UserName.toString()))),
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
                                            child: PanelUsers(UserName.toString()))),
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
                                            child: Register(UserName.toString()))),
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
                                            child: AccessList(UserName.toString()))),
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
                                            child: Transactions(UserName.toString()))),
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
                                            child: QuestionsTypes(UserName.toString()))),
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
                                            child: Notifications(UserName.toString()))),
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
                                            child: Tickets(UserName.toString()))),
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
                                            child: Discount(UserName.toString()))),
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
                                            child: LoginReport(UserName.toString()))),
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
                                            child: InviteLog(UserName.toString()))),
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
                                            child: UnauthorizedWords(UserName.toString()))),
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
                                            child: InAppItems(UserName.toString()))),
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
                                            child: Awards(UserName.toString()))),
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
                    new Align(alignment: Alignment.topCenter,
                      child: Padding(padding: EdgeInsets.only(right: 250, top: 80),
                        child: new Text("مدیریت مسابقه Live", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                      ),// عنوان صفحه
                    ),// عنوان صفحه
                    Padding(padding: EdgeInsets.only(left: 200, right: 450, top: 150),
                      child:
                      ListView(children: [
                        Card(
                          child: Container(
                            width: width,
                            height: 40,
                            color: Color(0xff4B0082),
                            child:
                            Column(
                                children: [
                                  Row(children: [
                                    Padding(padding: EdgeInsets.only(right: 30, top: 5),
                                      child: new Text("شناسه مسابقه", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 60, top: 5),
                                      child: new Text("شناسه بازیکن", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 60, top: 5),
                                      child: new Text("جون اضافه", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 60, top: 5),
                                      child: new Text("وضعیت بازیکن", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 80, top: 5),
                                      child: new Text("جایگاه", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                  ]),
                                ]),
                          ),
                        ),
                      ]),
                    ), // عنوان جدول
                    new Align(alignment: Alignment.bottomRight,
                      child: Padding(padding: EdgeInsets.only(right: 650, bottom: 150),
                        child:InkWell(
                          child: Container(
                            width: 130,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 30, top: 2),
                              child: new Text("آغاز مسابقه", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            print('StateStart = '+State);
                            print('Close = '+Close.toString());
                            if(State == '2'){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه مسابقه پایان یافته است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(Close == false){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه بسته است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(State == '1'){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه در حال اجراست",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(State == '0'){
                              StartMatch();
                            }
                          },
                        ),
                      ), // شروع مسابقه
                    ),// آغاز مسابقه
                    new Align(alignment: Alignment.bottomRight,
                      child: Padding(padding: EdgeInsets.only(right: 650, bottom: 110),
                        child: InkWell(
                          child: Container(
                            width: 130,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 26, top: 2),
                              child: new Text("بستن مسابقه", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            print('Close = '+Close.toString());
                            if(Close == false){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه قبلا بسته شده است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show(); // Message
                            }else{
                              CloseMatch();
                            }
                          },
                        ),
                      ), // پایان مسابقه
                    ),//بستن مسابقه
                    new Align(alignment: Alignment.bottomRight,
                      child: Padding(padding: EdgeInsets.only(right: 650, bottom: 70),
                        child: InkWell(
                          child: Container(
                            width: 130,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 26, top: 2),
                              child: new Text("پایان مسابقه", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            print('StateEnd = '+State);
                            print('Close = '+Close.toString());
                            if(Close == true){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!ابتدا مسابقه را ببندید",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(State == '2'){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه قبلا پایان یافته است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(State == '1'){
                              EndMatch();
                            }
                          },
                        ),
                      ), // پایان مسابقه
                    ),// پایان مسابقه
                    new Align(alignment: Alignment.bottomLeft,
                      child: Padding(padding: EdgeInsets.only(left: 330, bottom: 150),
                        child: InkWell(
                          child: Container(
                            width: 200,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 67, top: 2),
                              child: new Text("ارسال سوال", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            State = livematchInformation[0]["LmState"].toString();
                            if(State == '0'){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه آغاز نشده است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(State == '2'){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه پایان یافته است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(Close == false){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه بسته است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else{
                              SendQuestionPopup(context);
                            }
                          },
                        ),
                      ), // پایان مسابقه
                    ),// ارسال سوال
                    new Align(alignment: Alignment.bottomLeft,
                      child: Padding(padding: EdgeInsets.only(left: 280, bottom: 150),
                        child: InkWell(
                          child: Container(
                            width: 200,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 67, top: 2),
                              child: new Text("مشاهده بازیکنان", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            GetMatchPlayers();
                          },
                        ),
                      ), // پایان مسابقه
                    ),// مشاهده بازیکنان
                    new Align(alignment: Alignment.bottomLeft,
                      child: Padding(padding: EdgeInsets.only(left: 330, bottom: 110),
                        child: InkWell(
                          child: Container(
                            width: 200,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 40, top: 2),
                              child: new Text("تغییر زمانبندی پاسخ", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            ChangeQuestionAnsweringTime();
                          },
                        ),
                      ), // پایان مسابقه
                    ),// تغییر زمانبندی پاسخ
                    new Align(alignment: Alignment.bottomLeft,
                      child: Padding(padding: EdgeInsets.only(left: 250,right: 1040, bottom: 105),
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
                                        // ignore: deprecated_member_use
                                        child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(2), WhitelistingTextInputFormatter.digitsOnly, BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: QTimeTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                          decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                          keyboardType: TextInputType.multiline,
                                          autofocus: true,
                                        ))),
                              ],),
                          ),
                        ),
                      ), // کادر سوال
                    ),// کادر زمان سوال
                    new Align(alignment: Alignment.bottomLeft,
                      child: Padding(padding: EdgeInsets.only(left: 330, bottom: 70),
                        child: InkWell(
                          child: Container(
                            width: 200,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 80, top: 2),
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
                                new Directionality(textDirection: TextDirection.rtl,
                                    child: LiveTournamentActive(UserName.toString()))),
                                    (Route<dynamic> route) => false);
                          },
                        ),
                      ), // پایان مسابقه
                    ),// بازگشتا
                  ]),
            ),
          );
        }else{
          appscaffold = Scaffold(
            body: Center(
              child: Stack(
                  children: [
                    new Align(alignment: Alignment.topCenter,
                      child: Container(
                        width: width,
                        height: 60,
                        color: Color(0xff24026E),
                        child: Padding(padding: EdgeInsets.only(right: 80),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Text("JamQ", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 40)),
                                new Text(UserName + ' : نام کاربری', style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 14)),
                                new Text('')
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
                                            child: ApplicationUsers(UserName.toString()))),
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
                                            child: PanelUsers(UserName.toString()))),
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
                                            child: Register(UserName.toString()))),
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
                                            child: AccessList(UserName.toString()))),
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
                                            child: Transactions(UserName.toString()))),
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
                                            child: QuestionsTypes(UserName.toString()))),
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
                                            child: Notifications(UserName.toString()))),
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
                                            child: Tickets(UserName.toString()))),
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
                                            child: Discount(UserName.toString()))),
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
                                            child: LoginReport(UserName.toString()))),
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
                                            child: InviteLog(UserName.toString()))),
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
                                            child: UnauthorizedWords(UserName.toString()))),
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
                                            child: InAppItems(UserName.toString()))),
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
                                            child: Awards(UserName.toString()))),
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
                    new Align(alignment: Alignment.topCenter,
                      child: Padding(padding: EdgeInsets.only(right: 250, top: 80),
                        child: new Text("مدیریت مسابقه Live", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                      ),// عنوان صفحه
                    ),// عنوان صفحه
                    Padding(padding: EdgeInsets.only(left: 200, right: 450, top: 150),
                      child:
                      ListView(children: [
                        Card(
                          child: Container(
                            width: width,
                            height: 40,
                            color: Color(0xff4B0082),
                            child:
                            Column(
                                children: [
                                  Row(children: [
                                    Padding(padding: EdgeInsets.only(right: 30, top: 5),
                                      child: new Text("شناسه مسابقه", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 60, top: 5),
                                      child: new Text("شناسه بازیکن", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 60, top: 5),
                                      child: new Text("جون اضافه", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 60, top: 5),
                                      child: new Text("وضعیت بازیکن", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 80, top: 5),
                                      child: new Text("جایگاه", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                  ]),
                                ]),
                          ),
                        ),
                      ]),
                    ), // عنوان جدول
                    Padding(padding: EdgeInsets.only(left: 200,right: 450, top: 200),
                      child: Container(
                        width: width,
                        height: 200,
                        child: new ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: playerInformation.length,
                            itemBuilder: (BuildContext context,int index){
                              return Padding(padding: EdgeInsets.only(left: 0,right: 0),
                                child:
                                Card(
                                  child:
                                  Container(
                                    width: width,
                                    height: 50,
                                    color: Color(0xff9370DB),
                                    child: Row(
                                      children: [
                                        Padding(padding:EdgeInsets.only(right: 20),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: Center(
                                              child: new Text(playerInformation[index]["LM_MatchID"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 40),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: Center(
                                              child: new Text(playerInformation[index]["LM_PlayerId"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 55),
                                          child: Container(
                                            width: 80,
                                            height: 20,
                                            child: Center(
                                              child: new Text(UsedLife(playerInformation[index]["LM_UsedLife"]), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 65),
                                          child: Container(
                                            width: 70,
                                            height: 20,
                                            child: new Text(IsInGame(playerInformation[index]["LM_IsInGame"]), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 55),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: Center(
                                              child: new Text(playerInformation[index]["LM_Place"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ); // جدول
                            }
                        ),
                      ),
                    ), // جدول
                    new Align(alignment: Alignment.bottomRight,
                      child: Padding(padding: EdgeInsets.only(right: 650, bottom: 150),
                        child:InkWell(
                          child: Container(
                            width: 130,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 30, top: 2),
                              child: new Text("آغاز مسابقه", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            print('StateStart = '+State);
                            print('Close = '+Close.toString());
                            if(State == '2'){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه مسابقه پایان یافته است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(Close == false){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه بسته است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(State == '1'){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه در حال اجراست",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(State == '0'){
                              StartMatch();
                            }
                          },
                        ),
                      ), // شروع مسابقه
                    ),// آغاز مسابقه
                    new Align(alignment: Alignment.bottomRight,
                      child: Padding(padding: EdgeInsets.only(right: 650, bottom: 110),
                        child: InkWell(
                          child: Container(
                            width: 130,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 26, top: 2),
                              child: new Text("بستن مسابقه", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            print('Close = '+Close.toString());
                            if(Close == false){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه قبلا بسته شده است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show(); // Message
                            }else{
                              CloseMatch();
                            }
                          },
                        ),
                      ), // پایان مسابقه
                    ),//بستن مسابقه
                    new Align(alignment: Alignment.bottomRight,
                      child: Padding(padding: EdgeInsets.only(right: 650, bottom: 70),
                        child: InkWell(
                          child: Container(
                            width: 130,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 26, top: 2),
                              child: new Text("پایان مسابقه", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            print('StateEnd = '+State);
                            print('Close = '+Close.toString());
                            if(Close == true){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!ابتدا مسابقه را ببندید",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(State == '2'){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه قبلا پایان یافته است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(State == '1'){
                              EndMatch();
                            }
                          },
                        ),
                      ), // پایان مسابقه
                    ),// پایان مسابقه
                    new Align(alignment: Alignment.bottomLeft,
                      child: Padding(padding: EdgeInsets.only(left: 330, bottom: 150),
                        child: InkWell(
                          child: Container(
                            width: 200,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 67, top: 2),
                              child: new Text("ارسال سوال", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            State = livematchInformation[0]["LmState"].toString();
                            if(State == '0'){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه آغاز نشده است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(State == '2'){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه پایان یافته است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else if(Close == false){
                              Alert(
                                context: context,
                                type: AlertType.none,
                                title: "پیغام",
                                desc: "!!!مسابقه بسته است",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "تایید",
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color(0xffD3D3D3),
                                  )
                                ],
                              ).show();
                            }else{
                              SendQuestionPopup(context);
                            }
                          },
                        ),
                      ), // پایان مسابقه
                    ),// ارسال سوال
                    new Align(alignment: Alignment.bottomLeft,
                      child: Padding(padding: EdgeInsets.only(left: 280, bottom: 150),
                        child: InkWell(
                          child: Container(
                            width: 200,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 67, top: 2),
                              child: new Text("مشاهده بازیکنان", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            GetMatchPlayers();
                          },
                        ),
                      ), // پایان مسابقه
                    ),// مشاهده بازیکنان
                    new Align(alignment: Alignment.bottomLeft,
                      child: Padding(padding: EdgeInsets.only(left: 330, bottom: 110),
                        child: InkWell(
                          child: Container(
                            width: 200,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 40, top: 2),
                              child: new Text("تغییر زمانبندی پاسخ", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff483D8B),
                            ),
                          ),
                          onTap: (){
                            ChangeQuestionAnsweringTime();
                          },
                        ),
                      ), // پایان مسابقه
                    ),// تغییر زمانبندی پاسخ
                    new Align(alignment: Alignment.bottomLeft,
                      child: Padding(padding: EdgeInsets.only(left: 250,right: 1040, bottom: 105),
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
                                        // ignore: deprecated_member_use
                                        child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(2), WhitelistingTextInputFormatter.digitsOnly, BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: QTimeTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                          decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                          keyboardType: TextInputType.multiline,
                                          autofocus: true,
                                        ))),
                              ],),
                          ),
                        ),
                      ), // کادر سوال
                    ),// کادر زمان سوال
                    new Align(alignment: Alignment.bottomLeft,
                      child: Padding(padding: EdgeInsets.only(left: 330, bottom: 70),
                        child: InkWell(
                          child: Container(
                            width: 200,
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(right: 80, top: 2),
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
                                new Directionality(textDirection: TextDirection.rtl,
                                    child: LiveTournamentActive(UserName.toString()))),
                                    (Route<dynamic> route) => false);
                          },
                        ),
                      ), // پایان مسابقه
                    ),// بازگشتا
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
  connectsocket() async {
    socket = io('http://jamq.ir:3000/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false, // optional
    });
    socket.connect();
    socket.on('connect', (_) {
      print('Connected');
    });
  }
  StartMatch() async {
    print('StartMatch Run...');
    MatchId = widget.MatchIdResponse;
    print('MatchId = '+MatchId);

    try {
      FormData formData = FormData.fromMap({
        "id":MatchId,
      });
      _openLoadingDialog(context);
      Response response = await Dio().post("http://jamq.ir:3000/LiveMatch/StartMatch",options: Options(contentType: 'multipart/form-data'),data:formData);
      print(response.data.toString());
      if(response.data.toString() == "StartMatch Done!") {
        Navigator.pop(context);
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: ".مسابقه با موفقیت آغاز شد",
          buttons: [
            DialogButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                  new Directionality(textDirection: TextDirection.rtl, child: LiveManagement(MatchId, QTimeTextBox.text, UserName.toString()))),(Route<dynamic> route) => false),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
      }
      else
      {
        Navigator.pop(context);
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: "!!!برنامه با خطا مواجه شده است",
          buttons: [
            DialogButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
      }
      return true;
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
  CloseMatch() async {
    print('CloseMatch Run...');
    MatchId = widget.MatchIdResponse;
    print('MatchId = '+MatchId);

    try {
      FormData formData = FormData.fromMap({
        "id":MatchId,
      });
      _openLoadingDialog(context);
      Response response = await Dio().post("http://jamq.ir:3000/LiveMatch/CloseMatch",options: Options(contentType: 'multipart/form-data'),data:formData);
      print(response.data.toString());
      if(response.data.toString() == "CloseMatch Done!") {
        Navigator.pop(context);
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: ".مسابقه با موفقیت بسته شد",
          buttons: [
            DialogButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                  new Directionality(textDirection: TextDirection.rtl, child: LiveManagement(MatchId, QTimeTextBox.text, UserName.toString()))),(Route<dynamic> route) => false),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
      }
      else
      {
        Navigator.pop(context);
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: "!!!برنامه با خطا مواجه شده است",
          buttons: [
            DialogButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
      }
      return true;
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
  EndMatch() async {
    print('EndMatch Run...');

    _openLoadingDialog(context);
    MatchId = widget.MatchIdResponse;
    print('MatchId = '+MatchId);

    Map<String, dynamic> Endmatch = new Map();
    Endmatch['Matchid'] = MatchId;
    socket.emit('EndMatch', [jsonEncode(Endmatch)]);

    GetQuestionsByMatchId();
    Navigator.pop(context);
    Alert(
      context: context,
      type: AlertType.none,
      title: "پیغام",
      desc: ".مسابقه با موفقیت پایان یافت",
      buttons: [
        DialogButton(
          child: Text(
            "تایید",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>
              new Directionality(textDirection: TextDirection.rtl, child: LiveManagement(MatchId, QTimeTextBox.text, UserName.toString()))),(Route<dynamic> route) => false),
          color: Color(0xffD3D3D3),
        )
      ],
    ).show();
  }
  SendQuestion() async {
    print('EndMatch Run...');

    _openLoadingDialog(context);

    MatchId = widget.MatchIdResponse;
    print('MatchId = '+MatchId);

    Map<String, dynamic> Sendq = new Map();
    Sendq['LMQ_QuestionID'] = QuestionId;
    Sendq['LMQ_Matchid'] = MatchId;
    socket.emit('SendQuestiontoUser',[jsonEncode(Sendq)]);

    GetQuestionsByMatchId();
    Navigator.pop(context);
    Alert(
      context: context,
      type: AlertType.none,
      title: "پیغام",
      desc: ".سوال با موفقیت ارسال شد",
      buttons: [
        DialogButton(
          child: Text(
            "تایید",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xffD3D3D3),
        )
      ],
    ).show();
  }
  ChangeQuestionAnsweringTime() async {
    print('ChangeQuestionAnsweringTime Run...');
    MatchId = widget.MatchIdResponse;
    print('MatchId = '+MatchId);

    try {
      FormData formData = FormData.fromMap({
        "id":MatchId,
        "LmAnsweringTime":QTimeTextBox.text,
      });
      _openLoadingDialog(context);
      Response response = await Dio().post("http://jamq.ir:3000/LiveMatch/ChangeQuestionAnsweringTime",options: Options(contentType: 'multipart/form-data'),data:formData);
      print(response.data.toString());
      if(response.data.toString() == "Changed Match!") {
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
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
      }
      else
      {
        Navigator.pop(context);
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: "!!!برنامه با خطا مواجه شده است",
          buttons: [
            DialogButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
      }
      return true;
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
  GetMatchPlayers() async{
    print('GetMatchPlayers Run...');
    MatchId = widget.MatchIdResponse.toString();
    try {
      FormData formData = FormData.fromMap({
        "MatchID":MatchId,
      });
      Response response = await Dio().post("http://jamq.ir:3000/LiveMatch/GetMatchPlayers",options: Options(contentType: 'multipart/form-data'),data:formData);
      if(response.data != 'NoPlayer'){
        playerInformation = response.data;
        print('GetMatchPlayers = '+playerInformation.toString());
        return playerInformation;
      }else if(response.data == 'NoPlayer'){
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: "!!!هیچ بازیکنی به مسابقه ملحق نشده است",
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
                new Directionality(textDirection: TextDirection.rtl, child: LiveTournamentActive(UserName.toString()))),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  void SendQuestionPopup(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    showSlideDialog(
      context: context,
      child: Align(alignment: Alignment.bottomCenter,
        child: Stack(children: [
          new Align(alignment: Alignment.topRight,
            child: Padding(padding: EdgeInsets.only(right: 640),
              child: new Text("ارسال سوالات", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 18)),
            ),// عنوان صفحه
          ),// عنوان
          new Align(alignment: Alignment.bottomCenter,
            child: Padding(padding: EdgeInsets.only(left: 200,right: 200, top: 50),
              child: Container(
                width: width,
                height: 320,
                child: new ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: questionsInformation.length,
                    itemBuilder: (BuildContext context,int index){
                      return Card(
                        child:
                        Container(
                          width: width,
                          height: 50,
                          color: Color(0xff9370DB),
                          child: Row(
                            children: [
                              Padding(padding:EdgeInsets.only(left: 20),
                                child: Card(
                                  child: InkWell(
                                    child: Container(
                                      width: 90,
                                      height: 30,
                                      color: Color(0xff483D8B),
                                      child: Padding(padding: EdgeInsets.only(left: 16, top: 4),
                                        child: new Text("ارسال سوال", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 13)),
                                      ),
                                    ),
                                    onTap: (){
                                      Sended = questionsInformation[index]["LMQ_Sended"];
                                      print('Sended = '+Sended.toString());
                                      if(Sended == true){
                                        Alert(
                                          context: context,
                                          type: AlertType.none,
                                          title: "پیغام",
                                          desc: "!!!این سوال قبلا ارسال شده است",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "تایید",
                                                style: TextStyle(color: Colors.black, fontSize: 18),
                                              ),
                                              onPressed: () => Navigator.pop(context),
                                              color: Color(0xffD3D3D3),
                                            )
                                          ],
                                        ).show();
                                      }else{
                                        QuestionId = questionsInformation[index]["_id"].toString();
                                        SendQuestion();
                                      }
                                    },
                                  ),
                                ),
                              ),// ارسال سوال
                              Padding(padding:EdgeInsets.only(left: 120),
                                child: Container(
                                  width: 700,
                                  height: 20,
                                  child: new Directionality(textDirection: TextDirection.rtl,
                                    child: Text(questionsInformation[index]["LMQ_Question"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                  ),
                                ),
                              ),// متن سوال
                            ],
                          ),
                        ),
                      );// جدول
                    }
                ),
              ),
            ), // جدول
          ),// جدول
        ]),
      ),
      barrierColor: Colors.white.withOpacity(0.7),
      pillColor: Color(0xff2E0273),
      backgroundColor: Colors.white,
    );
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
                  new Directionality(textDirection: TextDirection.rtl, child: LiveTypes(UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: LiveTypes(UserName.toString()))),(Route<dynamic> route) => false),
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
        FillInfoo(response.data);
        GetQuestionsByMatchId();
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
                  new Directionality(textDirection: TextDirection.rtl, child: LiveTypes(UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: LiveTypes(UserName.toString()))),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  FillInfoo(var response) async{
    print('FillInfo Run...');
    try {
      ACData = accessinformation[0]["OCAccesses"];
      print('ACData = '+ACData.toString());
      applicationusers = ACData[0]["Applicationusers"];
      panelusers = ACData[1]["Panelusers"];
      register = ACData[2]["Register"];
      access = ACData[3]["Access"];
      transactions = ACData[4]["Transactions"];
      advertising = ACData[5]["Advertising"];
      tournaments = ACData[6]["Tournaments"];
      unauthorizedwords = ACData[7]["Unauthorizedwords"];
      questions = ACData[8]["Questions"];
      notification = ACData[9]["Notification"];
      tickets = ACData[10]["Tickets"];
      discounts = ACData[11]["Discounts"];
      applogintoreports = ACData[12]["Applogintoreports"];
      appinvitationtoreports = ACData[13]["Appinvitationtoreports"];
      appavilability = ACData[14]["AppAvilability"];
      inappitems = ACData[15]["Inappitems"];
      awards = ACData[16]["Awards"];
      aboutus = ACData[17]["Aboutus"];
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
                new Directionality(textDirection: TextDirection.rtl, child: LiveTypes(UserName.toString()))),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  GetQuestionsByMatchId() async{
    print('GetQuestionsByMatchId Run...');
    MatchId = widget.MatchIdResponse;
    print('MatchId = '+MatchId);
    try {
      FormData formData = FormData.fromMap({
        "MId":MatchId,
      });
      Response response = await Dio().post("http://jamq.ir:3000/LiveMatch/GetQuestionsByMatchId",options: Options(contentType: 'multipart/form-data'),data:formData);
      if(response.data.toString() != 'Question Does Not Exist!!!'){
        questionsInformation = response.data;
        print('GetQuestionsByMatchId = '+questionsInformation.toString());
        GetLiveMatchByMId();
        return questionsInformation;
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
                  new Directionality(textDirection: TextDirection.rtl, child: LiveTypes(UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: LiveTypes(UserName.toString()))),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  GetLiveMatchByMId() async{
    print('GetLiveMatchByMId Run...');
    MatchId = widget.MatchIdResponse;
    print('MatchId = '+MatchId);
    try {
      FormData formData = FormData.fromMap({
        "Id":MatchId,
      });
      Response response = await Dio().post("http://jamq.ir:3000/LiveMatch/GetLiveMatchByMId",options: Options(contentType: 'multipart/form-data'),data:formData);
      if(response.data.toString() != 'LiveMatch Does Not Exist!!!'){
        livematchInformation = response.data;
        print('GetQuestionsByMatchId = '+livematchInformation.toString());
        State = livematchInformation[0]["LmState"].toString();
        Close = livematchInformation[0]["LmIsOpend"];
        return livematchInformation;
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
                  new Directionality(textDirection: TextDirection.rtl, child: LiveTypes(UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: LiveTypes(UserName.toString()))),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  UsedLife(var state){
    if(state == false){
      return "استفاده نکرده";
    }else{
      return "استفاده کرده";
    }
  }
  IsInGame(var state){
    if(state == false){
      return "پایان بازی";
    }else if(state == true){
      return "در حال بازی";
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