import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:jaam_q/Pages/AccessList_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'AbouteUsList_Page.dart';
import 'Advertises_Page.dart';
import 'ApplicationAvilability_Page.dart';
import 'ApplicationUsers_Page.dart';
import 'Awards_Page.dart';
import 'CreateUnauthorizedWords_Page.dart';
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

class Access extends StatefulWidget {
  var UserNameResponse;
  Access(this.UserNameResponse);
  Access.none();

  @override
  State<StatefulWidget> createState() {
    return AccessState();
  }
}

class AccessState extends State<Access> {
  final AccessLevelTextBox = TextEditingController();
  List accesses;
  var dio;

  bool applicationusers1;
  bool panelusers1;
  bool register1;
  bool transactions1;
  bool access1;
  bool advertising1;
  bool tournaments1;
  bool unauthorizedwords1;
  bool questions1;
  bool notification1;
  bool tickets1;
  bool discounts1;
  bool applogintoreports1;
  bool appinvitationtoreports1;
  bool appavilability1;
  bool inappitems1;
  bool awards1;
  bool aboutus1;

  var appscaffold;
  Future loadfuture;
  List panelInformation, accessinformation, ACData;
  var UserName, AccessLevel;

  bool applicationusers = false;
  bool panelusers = false;
  bool register = false;
  bool access = false;
  bool transactions = false;
  bool advertising = false;
  bool tournaments = false;
  bool unauthorizedwords = false;
  bool questions = false;
  bool notification = false;
  bool tickets = false;
  bool discounts = false;
  bool applogintoreports = false;
  bool appinvitationtoreports = false;
  bool appavilability = false;
  bool inappitems = false;
  bool awards = false;
  bool aboutus = false;

  bool applicationusersCheckBoxValue = false;
  bool panelusersCheckBoxValue = false;
  bool registerCheckBoxValue = false;
  bool accessCheckBoxValue = false;
  bool transactionsCheckBoxValue = false;
  bool advertisingCheckBoxValue = false;
  bool tournamentsCheckBoxValue = false;
  bool unauthorizedwordsCheckBoxValue = false;
  bool questionsCheckBoxValue = false;
  bool notificationCheckBoxValue = false;
  bool ticketsCheckBoxValue = false;
  bool discountsCheckBoxValue = false;
  bool applogintoreportsCheckBoxValue = false;
  bool appinvitationtoreportsCheckBoxValue = false;
  bool appavilabilityCheckBoxValue = false;
  bool inappitemsCheckBoxValue = false;
  bool awardsCheckBoxValue = false;
  bool aboutusCheckBoxValue = false;

  @override
  void initState() {
    super.initState();
    UserName = widget.UserNameResponse.toString();
    loadfuture =  GetPanelUsersByUserName();
  }
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(child: Scaffold(
      body: Center(
        child: Stack(
            children: [
              new Align(alignment: Alignment.topCenter,
                child: Container(
                  width: width,
                  height: 60,
                  color: Color(0xff24026E),
                  child: Padding(padding: EdgeInsets.only(right: 80, left: 10),
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
                child: Padding(padding: EdgeInsets.only(right: 240, top: 70),
                  child: new Text("دسترسی ها", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                ), // عنوان صفحه
              ),// عنوان صفحه
              new Align(alignment: Alignment.center,
                child: Row(children: [
                  Padding(padding: EdgeInsets.only(right: 530, bottom: 256),
                    child: new Text("سطح دسترسی", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                  ),// سطح دسترسی
                  Padding(padding: EdgeInsets.only(bottom: 250),
                    child: Card(
                      color: Color(0xff9370DB),
                      child: Container(
                        width: 300,
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Flexible(
                                fit: FlexFit.loose,
                                child: new Padding(padding: EdgeInsets.fromLTRB(10, 14, 10, 0),
                                    // ignore: deprecated_member_use
                                    child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(20), WhitelistingTextInputFormatter(RegExp("[a-z0-9]")), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: AccessLevelTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                      decoration: new InputDecoration(border: InputBorder.none, hintText: "... سطح دسترسی", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                      keyboardType: TextInputType.multiline,
                                      autofocus: true,
                                    ))),
                          ],),
                      ),
                    ),
                  ), // کادر سطح دسترسی
                ]),
              ),// سطح دسترسی
              new Align(alignment: Alignment.center,
                child: Padding(padding: EdgeInsets.only(right: 280, top: 100),
                  child: Container(
                    width: 810,
                    height: 290,
                    child: Stack(children: <Widget>[
                      Padding(padding: EdgeInsets.only(right: 0, top: 30),
                        child: Column(children: [
                          Padding(padding: EdgeInsets.only(right: 0, top: 0),
                            child: new CheckboxListTile(title: Text("کاربران اپلیکیشن", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: applicationusersCheckBoxValue, onChanged:(bool applicationusersvalue){
                              setState(() {
                                applicationusersCheckBoxValue = applicationusersvalue;
                                if(applicationusersCheckBoxValue == true){
                                  applicationusers = true;
                                }else if(applicationusersCheckBoxValue == false){
                                  applicationusers = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: CheckboxListTile(title: Text("کاربران پنل", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: panelusersCheckBoxValue, onChanged:(bool panelusersvalue){
                              setState(() {
                                panelusersCheckBoxValue = panelusersvalue;
                                if(panelusersCheckBoxValue == true){
                                  panelusers = true;
                                }else if(panelusersCheckBoxValue == false){
                                  panelusers = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: CheckboxListTile(title: Text("ثبت نام کاربر پنل", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: registerCheckBoxValue, onChanged:(bool registervalue){
                              setState(() {
                                registerCheckBoxValue = registervalue;
                                if(registerCheckBoxValue == true){
                                  register = true;
                                }else if(registerCheckBoxValue == false){
                                  register = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: CheckboxListTile(title: Text("دسترسی ها", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: accessCheckBoxValue, onChanged:(bool accessvalue){
                              setState(() {
                                accessCheckBoxValue = accessvalue;
                                if(accessCheckBoxValue == true){
                                  access = true;
                                }else if(accessCheckBoxValue == false){
                                  access = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ],),
                      ),
                      Padding(padding: EdgeInsets.only(right: 150, top: 30),
                        child: Column(children: [
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: new CheckboxListTile(title: Text("تراکنش ها", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: transactionsCheckBoxValue, onChanged:(bool transactionsvalue){
                              setState(() {
                                transactionsCheckBoxValue = transactionsvalue;
                                if(transactionsCheckBoxValue == true){
                                  transactions = true;
                                }else if(transactionsCheckBoxValue == false){
                                  transactions = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: new CheckboxListTile(title: Text("تبلیغات", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: advertisingCheckBoxValue, onChanged:(bool advertisingvalue){
                              setState(() {
                                advertisingCheckBoxValue = advertisingvalue;
                                if(advertisingCheckBoxValue == true){
                                  advertising = true;
                                }else if(advertisingCheckBoxValue == false){
                                  advertising = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: CheckboxListTile(title: Text("مسابقات", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: tournamentsCheckBoxValue, onChanged:(bool tournamentsvalue){
                              setState(() {
                                tournamentsCheckBoxValue = tournamentsvalue;
                                if(tournamentsCheckBoxValue == true){
                                  tournaments = true;
                                }else if(tournamentsCheckBoxValue == false){
                                  tournaments = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: new CheckboxListTile(title: Text("سوالات", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: questionsCheckBoxValue, onChanged:(bool questionsvalue){
                              setState(() {
                                questionsCheckBoxValue = questionsvalue;
                                if(questionsCheckBoxValue == true){
                                  questions = true;
                                }else if(questionsCheckBoxValue == false){
                                  questions = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ],),
                      ),
                      Padding(padding: EdgeInsets.only(right: 270, top: 30),
                        child: Column(children: [
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: new CheckboxListTile(title: Text("نوتیفیکیشن", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: notificationCheckBoxValue, onChanged:(bool notificationvalue){
                              setState(() {
                                notificationCheckBoxValue = notificationvalue;
                                if(notificationCheckBoxValue == true){
                                  notification = true;
                                }else if(notificationCheckBoxValue == false){
                                  notification = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0, top: 0),
                            child: new CheckboxListTile(title: Text("تیکت های پشتیبانی", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: ticketsCheckBoxValue, onChanged:(bool ticketsvalue){
                              setState(() {
                                ticketsCheckBoxValue = ticketsvalue;
                                if(ticketsCheckBoxValue == true){
                                  tickets = true;
                                }else if(ticketsCheckBoxValue == false){
                                  tickets = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: CheckboxListTile(title: Text("تخفیف ها", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: discountsCheckBoxValue, onChanged:(bool discountsvalue){
                              setState(() {
                                discountsCheckBoxValue = discountsvalue;
                                if(discountsCheckBoxValue == true){
                                  discounts = true;
                                }else if(discountsCheckBoxValue == false){
                                  discounts = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: new CheckboxListTile(title: Text("گزاشات ورود به پنل", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: applogintoreportsCheckBoxValue, onChanged:(bool applogintoreportsvalue){
                              setState(() {
                                applogintoreportsCheckBoxValue = applogintoreportsvalue;
                                if(applogintoreportsCheckBoxValue == true){
                                  applogintoreports = true;
                                }else if(applogintoreportsCheckBoxValue == false){
                                  applogintoreports = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ],),
                      ),
                      Padding(padding: EdgeInsets.only(right: 440, top: 30),
                        child: Column(children: [
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: new CheckboxListTile(title: Text("گزارشات دعوت به اپلیکیشن", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: appinvitationtoreportsCheckBoxValue, onChanged:(bool appinvitationtoreportsvalue){
                              setState(() {
                                appinvitationtoreportsCheckBoxValue = appinvitationtoreportsvalue;
                                if(appinvitationtoreportsCheckBoxValue == true){
                                  appinvitationtoreports = true;
                                }else if(appinvitationtoreportsCheckBoxValue == false){
                                  appinvitationtoreports = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: new CheckboxListTile(title: Text("کلمات غیر مجاز", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: unauthorizedwordsCheckBoxValue, onChanged:(bool unauthorizedwordsvalue){
                              setState(() {
                                unauthorizedwordsCheckBoxValue = unauthorizedwordsvalue;
                                if(unauthorizedwordsCheckBoxValue == true){
                                  unauthorizedwords = true;
                                }else if(unauthorizedwordsCheckBoxValue == false){
                                  unauthorizedwords = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: CheckboxListTile(title: Text("فعال/غیرفعال سازی اپلیکیشن", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: appavilabilityCheckBoxValue, onChanged:(bool appavilabilityvalue){
                              setState(() {
                                appavilabilityCheckBoxValue = appavilabilityvalue;
                                if(appavilabilityCheckBoxValue == true){
                                  appavilability = true;
                                }else if(appavilabilityCheckBoxValue == false){
                                  appavilability = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: CheckboxListTile(title: Text("پرداخت های درون برنامه", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: inappitemsCheckBoxValue, onChanged:(bool inappitemsvalue){
                              setState(() {
                                inappitemsCheckBoxValue = inappitemsvalue;
                                if(inappitemsCheckBoxValue == true){
                                  inappitems = true;
                                }else if(inappitemsCheckBoxValue == false){
                                  inappitems = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ],),
                      ),
                      Padding(padding: EdgeInsets.only(right: 670, top: 30),
                        child: Column(children: [
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: CheckboxListTile(title: Text("جوایز", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: awardsCheckBoxValue, onChanged:(bool awardsvalue){
                              setState(() {
                                awardsCheckBoxValue = awardsvalue;
                                if(awardsCheckBoxValue == true){
                                  awards = true;
                                }else if(awardsCheckBoxValue == false){
                                  awards = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0),
                            child: CheckboxListTile(title: Text("درباره ما", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: aboutusCheckBoxValue, onChanged:(bool aboutusvalue){
                              setState(() {
                                aboutusCheckBoxValue = aboutusvalue;
                                if(aboutusCheckBoxValue == true){
                                  aboutus = true;
                                }else if(aboutusCheckBoxValue == false){
                                  aboutus = false;
                                }
                              });
                            },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ]),
                      ),
                    ]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff9370DB),
                    ),
                  ),
                ),
              ),// دسترسی ها
              new Align(alignment: Alignment.center,
                child: Padding(padding: EdgeInsets.only(right: 150, top: 590),
                  child:
                  InkWell(child:
                  Container(
                    width: 100,
                    height: 30,
                    child: Padding(padding: EdgeInsets.only(right: 17, top: 2),
                      child: new Text("ایجاد کردن", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff483D8B),
                    ),
                  ),
                    onTap: (){
                      RegisterOrganizationalChart();
                    },
                  ),
                ),// ایجاد کردن
              ),// ایجاد کردن
              new Align(alignment: Alignment.center,
                child: Padding(padding: EdgeInsets.only(right: 360, top: 590),
                  child:
                  InkWell(child:
                  Container(
                    width: 100,
                    height: 30,
                    child: Padding(padding: EdgeInsets.only(right: 27, top: 2),
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
                          new Directionality(
                              textDirection: TextDirection.rtl,
                              child: AccessList(UserName.toString()))),
                              (Route<dynamic> route) => false);
                    },
                  ),
                ),// ایجاد کردن
              ),// بازگشت
            ]),
      ),
    ), onWillPop: () => Future(() => false));
  }
  RegisterOrganizationalChart() async {
    print('RegisterOrganizationalChart Run...');
    if(AccessLevelTextBox.text == ''){
      Alert(
        context: context,
        type: AlertType.none,
        title: "پیغام",
        desc: "!!!لطفا فیلد خالی را پر کنید",
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
      try {
        FormData formData = FormData.fromMap({
          "AccessLevel":AccessLevelTextBox.text,
          "applicationusers": applicationusers,
          "panelusers": panelusers,
          "register": register,
          "access": access,
          "transactions": transactions,
          "advertising": advertising,
          "tournaments": tournaments,
          "unauthorizedwords": unauthorizedwords,
          "questions": questions,
          "notification": notification,
          "tickets": tickets,
          "discounts": discounts,
          "applogintoreports": applogintoreports,
          "appinvitationtoreports": appinvitationtoreports,
          "appavilability": appavilability,
          "inappitems": inappitems,
          "awards": awards,
          "aboutus": aboutus,
        });
        print('applicationusers = '+applicationusers.toString());
        _openLoadingDialog(context);
        Response response = await Dio().post("http://jamq.ir:3000/Register/RegisterOrganizationalChart",options: Options(contentType: 'multipart/form-data'),data:formData);
        print(response.data.toString());
        if(response.data.toString() == "OrganizationalChart Registred!"){
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
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>
                    new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
                color: Color(0xffD3D3D3),
              )
            ],
          ).show(); // Message
        }else if(response.data.toString() == "Access Exist!!!"){
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: "!!!سطح دسترسی وجود دارد",
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
      applicationusers1 = ACData[0]["Applicationusers"];
      panelusers1 = ACData[1]["Panelusers"];
      register1 = ACData[2]["Register"];
      access1 = ACData[3]["Access"];
      transactions1 = ACData[4]["Transactions"];
      advertising1 = ACData[5]["Advertising"];
      tournaments1 = ACData[6]["Tournaments"];
      unauthorizedwords1 = ACData[7]["Unauthorizedwords"];
      questions1 = ACData[8]["Questions"];
      notification1 = ACData[9]["Notification"];
      tickets1 = ACData[10]["Tickets"];
      discounts1 = ACData[11]["Discounts"];
      applogintoreports1 = ACData[12]["Applogintoreports"];
      appinvitationtoreports1 = ACData[13]["Appinvitationtoreports"];
      appavilability1 = ACData[14]["AppAvilability"];
      inappitems1 = ACData[15]["Inappitems"];
      awards1 = ACData[16]["Awards"];
      aboutus1 = ACData[17]["Aboutus"];

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