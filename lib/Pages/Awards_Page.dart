import 'package:dio/dio.dart';
import 'package:jaam_q/Pages/CreateAward_Page.dart';
import 'package:jaam_q/Pages/EditAward_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'AbouteUsList_Page.dart';
import 'AccessList_Page.dart';
import 'Advertises_Page.dart';
import 'ApplicationAvilability_Page.dart';
import 'ApplicationUsers_Page.dart';
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
import 'PanelUsers_Page.dart';
import 'Tickets_Page.dart';
import 'UnauthorizedWords_Page.dart';

class Awards extends StatefulWidget {
  var UserNameResponse;
  Awards(this.UserNameResponse);
  Awards.none();

  @override
  State<StatefulWidget> createState() {
    return AwardsState();
  }
}

class AwardsState extends State<Awards> {
  final SearchTextBox = TextEditingController();
  var appscaffold;
  Future loadfuture;
  List awardsInformation;

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
    loadfuture = GetAward();
  }
  Widget build(BuildContext context) {

    return WillPopScope(child: FutureBuilder(
      future:loadfuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;

        if(snapshot.hasData){
          appscaffold = Scaffold(
            body: Center(
              child: Stack(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10, right: 1000, top: 160),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 0),
                            child:
                            Container(
                              width: 100,
                              height: 30,
                              child: Padding(
                                padding: EdgeInsets.only(right: 38, top: 4),
                                child: new Text("PDF", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff483D8B),
                              ),
                            ),
                          ), // PDF
                          Padding(padding: EdgeInsets.only(right: 10),
                            child:
                            Container(
                              width: 100,
                              height: 30,
                              child: Padding(
                                padding: EdgeInsets.only(right: 32, top: 4),
                                child: new Text("Excel", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff483D8B),
                              ),
                            ),
                          ), // Excel
                          Padding(padding: EdgeInsets.only(right: 10),
                            child: InkWell(
                              child: Container(
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
                              onTap: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) =>
                                    new Directionality(textDirection: TextDirection.rtl, child: CreateAward(UserName.toString()))),(Route<dynamic> route) => false);
                              },
                            ),
                          ), // بازگشت
                        ],
                      ),
                    ),// Excel & PDF
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
                    Padding(padding: EdgeInsets.only(right: 780, top: 80),
                      child: new Text("جوایز", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                    ),// عنوان صفحه
                    Padding(padding: EdgeInsets.only(left: 400, right: 598, top: 230),
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
                                      child: new Text("نوع", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 110, top: 5),
                                      child: new Text("مبلغ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 80, top: 5),
                                      child: new Text("ویرایش", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                  ]),
                                ]),
                          ),
                        ),
                      ]),
                    ), // عنوان جدول
                    Padding(padding: EdgeInsets.only(left: 400,right: 598, top: 280),
                      child: Container(
                        width: width,
                        height: 350,
                        child: new ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: awardsInformation.length,
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
                                        Padding(padding:EdgeInsets.only(right: 0),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: Padding(padding: EdgeInsets.only(right: 0),
                                              child: Center(
                                                child: new Text(awardsInformation[index]["AwType"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 30),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: Padding(padding: EdgeInsets.only(right: 0),
                                              child: Center(
                                                child: new Text("تومان" + " " + awardsInformation[index]["AwAmount"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.only(right: 10),
                                          child: InkWell(
                                            child: Container(
                                              width: 100,
                                              height: 30,
                                              child: Padding(
                                                padding: EdgeInsets.only(right: 30, top: 4),
                                                child: new Text("ویرایش", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 13)),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0xff483D8B),
                                              ),
                                            ),
                                            onTap: (){
                                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditAward(awardsInformation[index]["_id"].toString(), UserName.toString()))),(Route<dynamic> route) => false);
                                            },
                                          ),
                                        ),
                                      ]),
                                  ),
                                ),
                              ); // جدول
                            }
                        ),
                      ),
                    ), // جدول
                  ]),
            ),
          );
        }
        return snapshot.hasData?
        new Scaffold(
          body: appscaffold,
        ) : new Center(child: CircularProgressIndicator());
      },
    ), onWillPop: () => Future(() => false));
  }
  GetAward() async{
    print('GetAward Run...');
    try {
      Response response = await Dio().post("http://jamq.ir:3000/Mainapp/GetAwards");
      if(response.data.toString() == 'Awards Does Not Exist!!!'){
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: "!!!اطلاعاتی وجود ندارد",
          buttons: [
            DialogButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
              ),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                  new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
        print('response: '+response.data);
      }else{
        awardsInformation = response.data;
        print('awardsInformation = '+awardsInformation.toString());
        GetPanelUsersByUserName();
        return awardsInformation;
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
                new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
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
                  new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
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
                  new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
}