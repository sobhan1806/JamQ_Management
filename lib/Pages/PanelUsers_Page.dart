import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:jaam_q/Pages/PanelUsersInfo_Page.dart';
import 'package:jalali_date/jalali_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Advertises_Page.dart';
import 'ApplicationUsers_Page.dart';
import 'Discount_Page.dart';
import 'Home_Page.dart';
import 'InviteLog_Page.dart';
import 'LoginToAppLog_Page.dart';
import 'Login_Page.dart';
import 'Register_Page.dart';
import 'Transactions_Page.dart';
import 'Notification_Page.dart';
import 'OtherApps_Page.dart';
import 'PanelUsers_Page.dart';
import 'Tickets_Page.dart';
import 'UnauthorizedWords_Page.dart';
import 'AbouteUs_Page.dart';

class PanelUsers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PanelUsersState();
  }
}

class PanelUsersState extends State<PanelUsers> {
  final SearchTextBox = TextEditingController();
  var appscaffold;
  Future loadfuture;
  List panelInformation;
  bool IsSearch = false;

  @override
  void initState() {
    super.initState();
    loadfuture = GetPanelUsers();
  }
  Widget build(BuildContext context) {

    return WillPopScope(child: FutureBuilder(
      future:loadfuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;

        if(IsSearch == true){
          appscaffold = Scaffold(
            body: Center(
              child: Stack(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 1000, top: 85),
                            child: InkWell(
                              child: Container(
                                width: 130,
                                height: 30,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 22, top: 2),
                                  child: new Text("بارگذاری مجدد", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff483D8B),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) =>
                                    new Directionality(textDirection: TextDirection.rtl, child: PanelUsers())),(Route<dynamic> route) => false);
                              },
                            ),
                          ), // بارگذاری مجدد
                          Padding(padding: EdgeInsets.only(right: 10, top: 85),
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
                          Padding(padding: EdgeInsets.only(right: 10, top: 85),
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
                        ],
                      ),
                    ),// Excel & PDF
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
                                    new Directionality(textDirection: TextDirection.rtl, child: Home())),(Route<dynamic> route) => false);
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
                    Padding(padding: EdgeInsets.only(right: 735, top: 80),
                      child: new Text("کاربران پنل", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                    ),// عنوان صفحه
                    Padding(padding: EdgeInsets.only(right: 300, top: 160),
                      child: InkWell(
                        child: Container(
                          width: 100,
                          height: 30,
                          child: Padding(
                            padding: EdgeInsets.only(right: 27, top: 2),
                            child: new Text("جستجو", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff483D8B),
                          ),
                        ),
                        onTap: (){
                          panelInformation.clear();
                          GetPanelUsersByUserName();
                        },
                      ),
                    ), // دکمه جستجو
                    Padding(padding: EdgeInsets.only(left: 29,right: 410, top: 150),
                      child: Card(
                        color: Color(0xff9370DB),
                        child: Container(
                          width: width,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Flexible(
                                  fit: FlexFit.loose,
                                  child: new Padding(padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                                      // ignore: deprecated_member_use
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50), WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: SearchTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "نام کاربری", hintStyle: TextStyle(color: Colors.grey)),
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر جستجو
                    Padding(padding: EdgeInsets.only(left: 26, right: 295, top: 230),
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
                                    Padding(padding: EdgeInsets.only(right: 20, top: 5),
                                      child: new Text("نام کاربری", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 180, top: 5),
                                      child: new Text("کلمه عبور", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 100, top: 5),
                                      child: new Text("تاریخ ثبت نام", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 100, top: 5),
                                      child: new Text("وضعیت", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 70, top: 5),
                                      child: new Text("تاریخ آخرین ورود", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 110, top: 5),
                                      child: new Text("مشخصات کامل", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                  ]),
                                ]),
                          ),
                        ),
                      ]),
                    ), // عنوان جدول
                    Padding(padding: EdgeInsets.only(left: 24,right: 295, top: 280),
                      child: Container(
                        width: width,
                        height: 350,
                        child: new ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: panelInformation.length,
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
                                            width: 180,
                                            height: 20,
                                            child: new Text(panelInformation[index]["AdmUserName"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 40),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: new Text(panelInformation[index]["AdmPassword"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 85),
                                          child: Container(
                                            width: 70,
                                            height: 20,
                                            child: new Text(PersianDate.fromGregorianString(Convertdate(panelInformation[index]["AdmCreationDate"])).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 115),
                                          child: Container(
                                            width: 50,
                                            height: 20,
                                            child: new Text(IsActivate(panelInformation[index]["AdmIsActivate"]).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 75),
                                          child: Container(
                                            width: 70,
                                            height: 20,
                                            child: new Text(PersianDate.fromGregorianString(Convertdate(panelInformation[index]["AdmLastLogin"])).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 125),
                                          child: Card(
                                            child: InkWell(
                                              child: Container(
                                                width: 90,
                                                height: 30,
                                                color: Color(0xff483D8B),
                                                child: Padding(padding: EdgeInsets.only(right: 24, top: 4),
                                                  child: new Text("مشاهده", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 13)),
                                                ),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>new Directionality(textDirection: TextDirection.rtl, child: PanelUsersInfo(panelInformation[index]["_id"].toString(), panelInformation[index]["AdmUserName"].toString()))),(Route<dynamic> route) => false);
                                              },
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
                  ]),
            ),
          );
        }else if(snapshot.hasError){
          appscaffold = Scaffold(
            body: Center(
              child: Stack(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 1000, top: 85),
                            child: InkWell(
                              child: Container(
                                width: 130,
                                height: 30,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 22, top: 2),
                                  child: new Text("بارگذاری مجدد", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff483D8B),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) =>
                                    new Directionality(textDirection: TextDirection.rtl, child: ApplicationUsers())),(Route<dynamic> route) => false);
                              },
                            ),
                          ), // بارگذاری مجدد
                          Padding(padding: EdgeInsets.only(right: 10, top: 85),
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
                          Padding(padding: EdgeInsets.only(right: 10, top: 85),
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
                        ],
                      ),
                    ),// Excel & PDF
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
                                    new Directionality(textDirection: TextDirection.rtl, child: Home())),(Route<dynamic> route) => false);
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
                    Padding(padding: EdgeInsets.only(right: 735, top: 80),
                      child: new Text("کاربران پنل", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                    ),// عنوان صفحه
                    Padding(padding: EdgeInsets.only(left: 26, right: 295, top: 230),
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
                                    Padding(padding: EdgeInsets.only(right: 20, top: 5),
                                      child: new Text("نام کاربری", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 180, top: 5),
                                      child: new Text("کلمه عبور", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 100, top: 5),
                                      child: new Text("تاریخ ثبت نام", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 100, top: 5),
                                      child: new Text("وضعیت", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 70, top: 5),
                                      child: new Text("تاریخ آخرین ورود", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 120, top: 5),
                                      child: new Text("دسترسی ها", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                  ]),
                                ]),
                          ),
                        ),
                      ]),
                    ), // عنوان جدول
                  ]),
            ),
          );
        }else if(snapshot.hasData){
          appscaffold = Scaffold(
            body: Center(
              child: Stack(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 1000, top: 85),
                            child: InkWell(
                              child: Container(
                                width: 130,
                                height: 30,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 22, top: 2),
                                  child: new Text("بارگذاری مجدد", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff483D8B),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) =>
                                    new Directionality(textDirection: TextDirection.rtl, child: PanelUsers())),(Route<dynamic> route) => false);
                              },
                            ),
                          ), // بارگذاری مجدد
                          Padding(padding: EdgeInsets.only(right: 10, top: 85),
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
                          Padding(padding: EdgeInsets.only(right: 10, top: 85),
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
                        ],
                      ),
                    ),// Excel & PDF
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
                                    new Directionality(textDirection: TextDirection.rtl, child: Home())),(Route<dynamic> route) => false);
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
                    Padding(padding: EdgeInsets.only(right: 735, top: 80),
                      child: new Text("کاربران پنل", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                    ),// عنوان صفحه
                    Padding(padding: EdgeInsets.only(right: 300, top: 160),
                      child: InkWell(
                        child: Container(
                          width: 100,
                          height: 30,
                          child: Padding(
                            padding: EdgeInsets.only(right: 27, top: 2),
                            child: new Text("جستجو", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff483D8B),
                          ),
                        ),
                        onTap: (){
                          panelInformation.clear();
                          GetPanelUsersByUserName();
                        },
                      ),
                    ), // دکمه جستجو
                    Padding(padding: EdgeInsets.only(left: 29,right: 410, top: 150),
                      child: Card(
                        color: Color(0xff9370DB),
                        child: Container(
                          width: width,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Flexible(
                                  fit: FlexFit.loose,
                                  child: new Padding(padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                                      // ignore: deprecated_member_use
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50), WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: SearchTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "نام کاربری", hintStyle: TextStyle(color: Colors.grey)),
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر جستجو
                    Padding(padding: EdgeInsets.only(left: 26, right: 295, top: 230),
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
                                    Padding(padding: EdgeInsets.only(right: 20, top: 5),
                                      child: new Text("نام کاربری", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 180, top: 5),
                                      child: new Text("کلمه عبور", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 100, top: 5),
                                      child: new Text("تاریخ ثبت نام", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 100, top: 5),
                                      child: new Text("وضعیت", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 70, top: 5),
                                      child: new Text("تاریخ آخرین ورود", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 110, top: 5),
                                      child: new Text("مشخصات کامل", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                  ]),
                                ]),
                          ),
                        ),
                      ]),
                    ), // عنوان جدول
                    Padding(padding: EdgeInsets.only(left: 24,right: 295, top: 280),
                      child: Container(
                        width: width,
                        height: 350,
                        child: new ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: panelInformation.length,
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
                                            width: 180,
                                            height: 20,
                                            child: new Text(panelInformation[index]["AdmUserName"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 40),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: new Text(panelInformation[index]["AdmPassword"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 85),
                                          child: Container(
                                            width: 70,
                                            height: 20,
                                            child: new Text(PersianDate.fromGregorianString(Convertdate(panelInformation[index]["AdmCreationDate"])).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 115),
                                          child: Container(
                                            width: 50,
                                            height: 20,
                                            child: new Text(IsActivate(panelInformation[index]["AdmIsActivate"]).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 75),
                                          child: Container(
                                            width: 70,
                                            height: 20,
                                            child: new Text(PersianDate.fromGregorianString(Convertdate(panelInformation[index]["AdmLastLogin"])).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 125),
                                          child: Card(
                                            child: InkWell(
                                              child: Container(
                                                width: 90,
                                                height: 30,
                                                color: Color(0xff483D8B),
                                                child: Padding(padding: EdgeInsets.only(right: 24, top: 4),
                                                  child: new Text("مشاهده", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 13)),
                                                ),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>new Directionality(textDirection: TextDirection.rtl, child: PanelUsersInfo(panelInformation[index]["_id"].toString(), panelInformation[index]["AdmUserName"].toString()))),(Route<dynamic> route) => false);
                                              },
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
  GetPanelUsers() async{
    print('GetPanelUsers Run...');
    try {
      Response response = await Dio().post("http://jamq.ir:3000/Management/GetAllPanelUsers");
      if(response.data.toString() != 'User Does Not Exist!!!'){
          panelInformation = response.data;
          print('panelInformation = '+panelInformation.toString());
          return panelInformation;
      }else{
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: "!!!کاربری وجود ندارد",
          buttons: [
            DialogButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
              ),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                  new Directionality(textDirection: TextDirection.rtl, child: Home())),(Route<dynamic> route) => false),
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
            new Directionality(textDirection: TextDirection.rtl, child: Home())),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  GetPanelUsersByUserName() async{
    print('GetPanelUsersByUserName Run...');
    IsSearch = true;
    if(SearchTextBox.text == ''){
      Alert(
        context: context,
        type: AlertType.none,
        title: "پیغام",
        desc: "!!!لطفا نام کاربری مورد نظر را وارد کنید",
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
    }else{
      try {
        FormData formData = FormData.fromMap({
          "UserName":SearchTextBox.text,
        });
        _openLoadingDialog(context);
        Response response = await Dio().post("http://jamq.ir:3000/Management/GetPanelUserByUserName",options: Options(contentType: 'multipart/form-data'),data:formData);
        if(response.data.toString() != 'User Does Not Exist!!!'){
          Navigator.pop(context);
          panelInformation = response.data;
          print('GetPanelUsersByUserName = '+panelInformation.toString());
          setState(() {
            return panelInformation;
          });
        }else{
          Navigator.pop(context);
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
                  new Directionality(textDirection: TextDirection.rtl, child: PanelUsers())),(Route<dynamic> route) => false),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
        print(e);
      }
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
      return "غیر فعال";
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