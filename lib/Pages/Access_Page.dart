import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:jaam_q/Pages/AccessList_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Advertises_Page.dart';
import 'ApplicationUsers_Page.dart';
import 'Discount_Page.dart';
import 'Home_Page.dart';
import 'InviteLog_Page.dart';
import 'LoginReport_Page.dart';
import 'Login_Page.dart';
import 'Register_Page.dart';
import 'Transactions_Page.dart';
import 'Notification_Page.dart';
import 'OtherApps_Page.dart';
import 'PanelUsers_Page.dart';
import 'Tickets_Page.dart';
import 'UnauthorizedWords_Page.dart';
import 'AbouteUs_Page.dart';
import 'package:persian_date/persian_date.dart';

class Access extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccessState();
  }
}

class AccessState extends State<Access> {
  final AccessLevelTextBox = TextEditingController();
  List accesses;
  var dio;
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
  bool aboutus = false;
  bool inappitems = false;
  bool awards = false;

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
  bool aboutusCheckBoxValue = false;
  bool InAppItemsCheckBoxValue = false;
  bool AwardsCheckBoxValue = false;

  @override
  void initState() {
    super.initState();
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
                      Padding(padding: EdgeInsets.only(right: 430),
                        child: Container(
                          width: 220,
                          height: 20,
                          child: new Text("User Name", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 12), textAlign: TextAlign.left),
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
                        onTap: (){
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: Home.none())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: ApplicationUsers())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: PanelUsers())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: Register())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: Transactions())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: Advertises())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: Notifications())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: Tickets())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: Discount())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: LoginReport())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: InviteLog())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: UnauthorizedWords())),(Route<dynamic> route) => false);
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: AbouteUs())),(Route<dynamic> route) => false);
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
              Padding(padding: EdgeInsets.only(right: 730, top: 80),
                child: new Text("دسترسی ها", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
              ), // عنوان صفحه
              Padding(padding: EdgeInsets.only(right: 500, top: 203),
                child: new Text("سطح دسترسی", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
              ),// سطح دسترسی
              Padding(padding: EdgeInsets.only(left: 400,right: 620, top: 200),
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
                                child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(20), WhitelistingTextInputFormatter(RegExp("[a-z0-9]")), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: AccessLevelTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "... سطح دسترسی", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                  keyboardType: TextInputType.multiline,
                                  autofocus: true,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر سطح دسترسی
              new Align(alignment: Alignment.center,
                child: Stack(children: <Widget> [
                  Padding(padding: EdgeInsets.only(right: 350, top: 290),
                    child: Container(
                      width: 950,
                      height: 290,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff9370DB),
                      ),
                    ),
                  ),
                  new Align(
                    alignment: Alignment.center,
                    child: Padding(padding: EdgeInsets.only(right: 330, top: 300),
                      child: Column(children: [
                        Padding(padding: EdgeInsets.only(right: 0, top: 20),
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
                  ),// سمت راست
                  new Align(
                    alignment: Alignment.center,
                    child: Padding(padding: EdgeInsets.only(right: 500, top: 320),
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
                  ),// سمت راست
                  new Align(
                    alignment: Alignment.center,
                    child: Padding(padding: EdgeInsets.only(right: 680, top: 320),
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
                  ),// وسط
                  new Align(
                    alignment: Alignment.center,
                    child: Padding(padding: EdgeInsets.only(right: 850, top: 320),
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
                          child: CheckboxListTile(title: Text("پرداخت های درون برنامه", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: InAppItemsCheckBoxValue, onChanged:(bool inappitemsvalue){
                            setState(() {
                              InAppItemsCheckBoxValue = inappitemsvalue;
                              if(InAppItemsCheckBoxValue == true){
                                inappitems = true;
                              }else if(InAppItemsCheckBoxValue == false){
                                inappitems = false;
                              }
                            });
                          },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],),
                    ),
                  ),// سمت چپ
                  new Align(alignment: Alignment.center,
                    child: Padding(padding: EdgeInsets.only(right: 1100, top: 320),
                      child: Column(children: [
                        Padding(padding: EdgeInsets.only(right: 0),
                          child: CheckboxListTile(title: Text("جوایز", style: TextStyle(fontFamily: 'IRANSans', fontSize: 12, color: Colors.white)), activeColor: Colors.deepPurple, value: AwardsCheckBoxValue, onChanged:(bool awardsvalue){
                            setState(() {
                              AwardsCheckBoxValue = awardsvalue;
                              if(AwardsCheckBoxValue == true){
                                awards = true;
                              }else if(AwardsCheckBoxValue == false){
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
                  ),// سمت چپ
                ]),
              ),
              Padding(padding: EdgeInsets.only(right: 750, top: 610),
                child:
                InkWell(child:
                Container(
                  width: 100,
                  height: 30,
                  child: Padding(padding: EdgeInsets.only(right: 20, top: 2),
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
          "transactions": transactions,
          "access": access,
          "advertising": advertising,
          "tournaments": tournaments,
          "unauthorizedwords": unauthorizedwords,
          "questions": questions,
          "notification": notification,
          "tickets": tickets,
          "discounts": discounts,
          "applogintoreports": applogintoreports,
          "appinvitationtoreports": appinvitationtoreports,
          "appavilability": appinvitationtoreports,
          "aboutus": aboutus,
          "inappitems": inappitems,
          "awards": awards,
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
                    new Directionality(textDirection: TextDirection.rtl, child: Home.none())),(Route<dynamic> route) => false),
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
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                  new Directionality(textDirection: TextDirection.rtl, child: AccessList())),(Route<dynamic> route) => false),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
        print(e);
      }
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