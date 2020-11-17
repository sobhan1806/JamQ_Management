import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/helpers/show_radio_picker.dart';
import 'AbouteUsList_Page.dart';
import 'Access_Page.dart';
import 'ApplicationAvilability_Page.dart';
import 'Awards_Page.dart';
import 'CreateLiveMatch_Page.dart';
import 'InAppItems.dart';
import 'LiveManagement_Page.dart';
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
import 'QuestionsTypes_Page.dart';
import 'Register_Page.dart';
import 'Transactions_Page.dart';
import 'Notification_Page.dart';
import 'PanelUsers_Page.dart';
import 'Tickets_Page.dart';
import 'UnauthorizedWords_Page.dart';

class CreateTournamentQuestions extends StatefulWidget {
  var NameResponse, QuestionCountResponse, PlayerCountResponse, AnsweringTimeResponse, UserNameResponse;
  CreateTournamentQuestions(this.NameResponse, this.QuestionCountResponse, this.PlayerCountResponse, this.AnsweringTimeResponse, this.UserNameResponse);
  CreateTournamentQuestions.none();

  @override
  State<StatefulWidget> createState() {
    return CreateTournamentQuestionsState();
  }
}

class CreateTournamentQuestionsState extends State<CreateTournamentQuestions> {
  var selectedUsState;
  List<String> TrueAnswer = <String>[
    'گزینه اول',
    'گزینه دوم',
    'گزینه سوم',
  ];
  final QuestionsCountTextBox = TextEditingController();
  final QuestionTextBox = TextEditingController();
  final TrueAnswerTextBox = TextEditingController();
  final Choice1TextBox = TextEditingController();
  final Choice2TextBox = TextEditingController();
  final Choice3TextBox = TextEditingController();
  var appscaffold;
  Future loadfuture;
  var livequestioninfo;
  var Trueanswer;
  int QuestionCount;
  int Counter = 0;
  int co = 0;
  bool create = false;
  bool Qcreate = false;
  var MatchId;
  var name;
  int playercount, questioncount, answeringtime;

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
    questioncount = widget.QuestionCountResponse;
    QuestionsCountTextBox.text = questioncount.toString();
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
                child: Padding(padding: EdgeInsets.only(right: 750, top: 80),
                  child: new Text("ایجاد سوال تورنمنت", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                ),// عنوان صفحه
              ),// عنوان
              Padding(padding: EdgeInsets.only(right: 340, top: 232),
                child: new Text("تعداد سوالات", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
              ),// تعداد سوالات
              Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 229),
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
                                child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)], style: TextStyle(color: Colors.white),controller: QuestionsCountTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                  keyboardType: TextInputType.multiline,
                                  autofocus: true,
                                  enabled: false,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر تعداد سوالات
              Padding(padding: EdgeInsets.only(right: 410, top: 272),
                child: new Text("سوال", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
              ),// سوال
              Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 269),
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
                                child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)], style: TextStyle(color: Colors.white),controller: QuestionTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                  keyboardType: TextInputType.multiline,
                                  autofocus: true,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر سوال
              Padding(padding: EdgeInsets.only(right: 375, top: 313),
                child: new Text("گزینه اول", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
              ),// گزینه اول
              Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 310),
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
                                child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)], style: TextStyle(color: Colors.white),controller: Choice1TextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                  keyboardType: TextInputType.multiline,
                                  autofocus: true,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر گزینه اول
              Padding(padding: EdgeInsets.only(right: 370, top: 354),
                child: new Text("گزینه دوم", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
              ),// گزینه دوم
              Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 351),
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
                                child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)], style: TextStyle(color: Colors.white),controller: Choice2TextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                  keyboardType: TextInputType.multiline,
                                  autofocus: true,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر گزینه دوم
              Padding(padding: EdgeInsets.only(right: 365, top: 394),
                child: new Text("گزینه سوم", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
              ),// گزینه سوم
              Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 391),
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
                                child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)], style: TextStyle(color: Colors.white),controller: Choice3TextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                  keyboardType: TextInputType.multiline,
                                  autofocus: true,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر گزینه سوم
              Padding(padding: EdgeInsets.only(right: 348, top: 434),
                child: new Text("گزینه صحیح", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
              ),// گزینه صحیح
              Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 431),
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
                            child: InkWell(
                              // ignore: deprecated_member_use
                              child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(80), WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: TrueAnswerTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                decoration: new InputDecoration(border: InputBorder.none, hintText: "...یک گزینه را انتخاب کنید", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                keyboardType: TextInputType.multiline,
                                autofocus: true,
                                enabled: false,
                              ),
                              onTap: (){
                                showMaterialRadioPicker(
                                  context: context,
                                  cancelText: 'لغو',
                                  headerTextColor: Colors.white,
                                  confirmText: 'تایید',
                                  buttonTextColor: Colors.black,
                                  title: "گزینه صحیح",
                                  headerColor: Colors.deepPurple,
                                  items: TrueAnswer,
                                  selectedItem: selectedUsState,
                                  onChanged: (value) => setState(() =>   TrueAnswerTextBox.text = value),
                                );
                              },
                            ),),),
                      ],),
                  ),
                ),
              ), // کادر گزینه صحیح
              Padding(padding: EdgeInsets.only(right: 530, top: 580),
                child: InkWell(
                  child: Container(
                    width: 100,
                    height: 30,
                    child: Padding(
                      padding: EdgeInsets.only(right: 11, top: 2),
                      child: new Text("ایجاد مسابقه", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff483D8B),
                    ),
                  ),
                  onTap: (){
                    if(create == false){
                      CreateMatch();
                    }else{
                      Alert(
                        context: context,
                        type: AlertType.none,
                        title: "پیغام",
                        desc: "!!!مسابقه قبلا ساخته شده است",
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
                  },
                ),
              ), // ایجاد مسابقه
              Padding(padding: EdgeInsets.only(right: 640, top: 580),
                child: InkWell(
                  child: Container(
                    width: 100,
                    height: 30,
                    child: Padding(
                      padding: EdgeInsets.only(right: 18, top: 2),
                      child: new Text("ایجاد سوال", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff483D8B),
                    ),
                  ),
                  onTap: (){
                    if(QuestionTextBox.text == '' || TrueAnswerTextBox.text == '' || Choice1TextBox.text == '' || Choice2TextBox.text == '' || Choice3TextBox.text == ''){
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
                            color: Color(0xffD3D3D3),
                          )
                        ],
                      ).show(); // Message
                    }else{
                      if (create == true) {
                        QuestionCount = widget.QuestionCountResponse;
                        if (Counter != QuestionCount) {
                          setState(() {
                            Counter++;
                          });
                          CreateLiveQuestions();
                        } else {
                          Alert(
                            context: context,
                            type: AlertType.none,
                            title: "پیغام",
                            desc: "!!!درج سوال بیش از حد تعیین شده می باشد",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "تایید",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                onPressed: () => Navigator.pop(context),
                                color: Color(0xffD3D3D3),
                              )
                            ],
                          ).show();
                        }
                      }else if(create == false) {
                        Alert(
                          context: context,
                          type: AlertType.none,
                          title: "پیغام",
                          desc: "!!!ابتدا مسابقه را ایجاد کنید",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "تایید",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: Color(0xffD3D3D3),
                            )
                          ],
                        ).show();
                      }
                    }
                  },
                ),
              ), // ایجاد سوال
              Padding(padding: EdgeInsets.only(right: 750, top: 580),
                child: InkWell(
                  child: Container(
                    width: 100,
                    height: 30,
                    child: Padding(
                      padding: EdgeInsets.only(right: 35, top: 2),
                      child: new Text("ادامه", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff483D8B),
                    ),
                  ),
                  onTap: (){
                    if(Counter == QuestionCount){
                      co = Counter;
                    }
                    if(co == QuestionCount){
                      answeringtime = widget.AnsweringTimeResponse;
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) =>
                          new Directionality(textDirection: TextDirection.rtl, child: LiveManagement(MatchId, answeringtime.toString(), UserName.toString()))),(Route<dynamic> route) => false);
                    }else{
                      Alert(
                        context: context,
                        type: AlertType.none,
                        title: Counter.toString() + " : تعداد سوال ساخته شده",
                        desc: "!!!تعداد سوال های ساخته شده کمتر از حد مجاز است",
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
                  },
                ),
              ), // ادامه
              Padding(padding: EdgeInsets.only(right: 860, top: 580),
                child: InkWell(
                  child: Container(
                    width: 100,
                    height: 30,
                    child: Padding(
                      padding: EdgeInsets.only(right: 27, top: 2),
                      child: new Text("بازگشت", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff483D8B),
                    ),
                  ),
                  onTap: (){
                    name = widget.NameResponse;
                    questioncount = widget.QuestionCountResponse;
                    playercount = widget.PlayerCountResponse;
                    answeringtime = widget.AnsweringTimeResponse;
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) =>
                        new Directionality(textDirection: TextDirection.rtl, child: CreateLiveMatch(name, questioncount, playercount, answeringtime, UserName.toString()))),(Route<dynamic> route) => false);
                  },
                ),
              ), // بازگشت
            ]),
      ),
    ), onWillPop: () => Future(() => false));
  }
  CreateMatch() async {
    print('CreateLiveMatch Run...');
    name = widget.NameResponse;
    questioncount = widget.QuestionCountResponse;
    playercount = widget.PlayerCountResponse;
    answeringtime = widget.AnsweringTimeResponse;

    try {
      FormData formData = FormData.fromMap({
        "LmName": name,
        "LmQuestionsCount": questioncount,
        "LmPlayerNumbers": playercount,
        "LmAnsweringTime": answeringtime,
      });
      _openLoadingDialog(context);
      Response response = await Dio().post("http://jamq.ir:3000/LiveMatch/CreateMatch", options: Options(contentType: 'multipart/form-data'), data: formData);
      print(response.data.toString());
      if (response.data.toString() == "Created Match!") {
        create = true;
        Navigator.pop(context);
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: ".مسابقه با موفقیت ایجاد شد",
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
        GetLiveMatchByName();
      }
      else {
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
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  CreateLiveQuestions() async {
    print('CreateQuestions Run...');

    if(TrueAnswerTextBox.text == 'گزینه اول'){
      Trueanswer = '1';
    }else if(TrueAnswerTextBox.text == 'گزینه دوم'){
      Trueanswer = '2';
    }else if(TrueAnswerTextBox.text == 'گزینه سوم'){
      Trueanswer = '3';
    }

    if(create == false){
      Alert(
        context: context,
        type: AlertType.none,
        title: "پیغام",
        desc: "!!!ابتدا مسابقه را ایجاد کنید",
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
      try {
        print('Trueanswer = ' + Trueanswer);
        FormData formData = FormData.fromMap({
          "LMQ_Matchid": MatchId,
          "LMQ_Question": QuestionTextBox.text,
          "LMQ_Choice1": Choice1TextBox.text,
          "LMQ_Choice2": Choice2TextBox.text,
          "LMQ_Choice3": Choice3TextBox.text,
          "LMQ_TrueAnswer": Trueanswer,
        });
        _openLoadingDialog(context);
        Response response = await Dio().post(
            "http://jamq.ir:3000/LiveMatch/AddQuestionToMatch",
            options: Options(contentType: 'multipart/form-data'),
            data: formData);
        print(response.data.toString());
        if (response.data.toString() == "Question Added!") {
          //Qcreate = true;
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: ".سوال با موفقیت ایجاد شد",
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
          QuestionTextBox.text = '';
          Choice1TextBox.text = '';
          Choice2TextBox.text = '';
          Choice3TextBox.text = '';
          TrueAnswerTextBox.text = '';
        }
        else {
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
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'IRANSans'),
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
  GetLiveMatchByName() async{
    print('GetLiveMatchByName Run...');
    name = widget.NameResponse;
    questioncount = widget.QuestionCountResponse;
    playercount = widget.PlayerCountResponse;
    answeringtime = widget.AnsweringTimeResponse;
    print('name = '+name);

    try {
      FormData formData = FormData.fromMap({
        "Name":name,
      });

      Response response = await Dio().post("http://jamq.ir:3000/LiveMatch/GetLiveMatchByName",options: Options(contentType: 'multipart/form-data'),data:formData);
      if(response.data.toString() != 'LiveMatchs Does Not Exist!!!'){
        livequestioninfo = response.data;
        print('GetMatchByName = '+livequestioninfo.toString());
        MatchId = livequestioninfo[0]["_id"].toString();
        print('MatchId = '+MatchId);
        return livequestioninfo;
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
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                  new Directionality(textDirection: TextDirection.rtl, child: CreateLiveMatch(name, questions, playercount, answeringtime, UserName.toString()))),(Route<dynamic> route) => false),
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
                  new Directionality(textDirection: TextDirection.rtl, child: CreateLiveMatch(name, questioncount, playercount, answeringtime, UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: CreateLiveMatch(name, questioncount, playercount, answeringtime, UserName.toString()))),(Route<dynamic> route) => false),
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
                  new Directionality(textDirection: TextDirection.rtl, child: CreateLiveMatch(name, questioncount, playercount, answeringtime, UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: CreateLiveMatch(name, questioncount, playercount, answeringtime, UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: CreateLiveMatch(name, questioncount, playercount, answeringtime, UserName.toString()))),(Route<dynamic> route) => false),
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