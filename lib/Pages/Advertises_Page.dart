import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:jaam_q/Pages/AdvertisesInfo_Page.dart';
import 'package:jaam_q/Pages/CreateAdvertises_Page.dart';
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

class Advertises extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdvertisesState();
  }
}

class AdvertisesState extends State<Advertises> {
  final SearchTextBox = TextEditingController();
  var appscaffold;
  Future loadfuture;
  List advertisesInformation;
  bool IsSearch = false;

  @override
  void initState() {
    super.initState();
    loadfuture = GetAdvertises();
  }
  Widget build(BuildContext context) {

    return WillPopScope(child: FutureBuilder(
      future:loadfuture ,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;

        if(IsSearch == true){
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
                    Padding(padding: EdgeInsets.only(right: 750, top: 80),
                      child: new Text("تبلیغات", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                    ),// عنوان صفحه
                    Padding(padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 865, top: 85),
                            child: InkWell(
                              child: Container(
                                width: 120,
                                height: 30,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 17, top: 2),
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
                                    new Directionality(textDirection: TextDirection.rtl, child: Advertises())),(Route<dynamic> route) => false);
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
                          Padding(padding: EdgeInsets.only(right: 10, top: 85),
                            child: InkWell(
                              child: Container(
                                width: 120,
                                height: 30,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 28, top: 2),
                                  child: new Text("ایجاد تبلیغ", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff483D8B),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) =>
                                    new Directionality(textDirection: TextDirection.rtl, child: CreateAdvertises())),(Route<dynamic> route) => false);
                              },
                            ),
                          ), // ایجاد تبلیغ
                        ],
                      ),
                    ), // PDF & Excel
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
                          advertisesInformation.clear();
                          GetAdvertisesByName();
                        },
                      ),
                    ), // دکمه جستجو
                    Padding(padding: EdgeInsets.only(left: 27,right: 410, top: 150),
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
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: SearchTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "... عنوان", hintStyle: TextStyle(color: Colors.grey)),
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
                                    Padding(padding: EdgeInsets.only(right: 25, top: 5),
                                      child: new Text("عنوان", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 160, top: 5),
                                      child: new Text("محل تبلیغ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 100, top: 5),
                                      child: new Text("وضعیت", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 120, top: 5),
                                      child: new Text("تاریخ", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 120, top: 5),
                                      child: new Text("مشخصات کامل", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 180, top: 5),
                                      child: new Text("سازنده", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
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
                            itemCount: advertisesInformation.length,
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
                                        Padding(padding:EdgeInsets.only(right: 25),
                                          child: Container(
                                            width: 120,
                                            height: 20,
                                            child: new Text(advertisesInformation[index]["AdName"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 90),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: new Text(advertisesInformation[index]["AdPlace"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 63),
                                          child: Container(
                                            width: 50,
                                            height: 20,
                                            child: new Text(IsActivate(advertisesInformation[index]["AdIsActivate"]).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 90),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: new Text(PersianDate.fromGregorianString(Convertdate(advertisesInformation[index]["AdCreationDate"])).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.only(right: 60),
                                          child: InkWell(
                                            child: Container(
                                              width: 100,
                                              height: 30,
                                              child: Padding(
                                                padding: EdgeInsets.only(right: 30, top: 4),
                                                child: new Text("مشاهده", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 13)),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0xff483D8B),
                                              ),
                                            ),
                                            onTap: (){
                                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>new Directionality(textDirection: TextDirection.rtl, child: AdvertisesInfo(advertisesInformation[index]["_id"].toString(), advertisesInformation[index]["AdName"].toString()))),(Route<dynamic> route) => false);
                                            },
                                          ),
                                        ), // PDF
                                        Padding(padding:EdgeInsets.only(right: 70),
                                          child: Container(
                                            width: 150,
                                            height: 20,
                                            child: Padding(padding: EdgeInsets.only(right: 80),
                                              child: new Text(advertisesInformation[index]["AdCreatedBy"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
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
        }else if(snapshot.hasData){
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
                    Padding(padding: EdgeInsets.only(right: 750, top: 80),
                      child: new Text("تبلیغات", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                    ),// عنوان صفحه
                    Padding(padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 865, top: 85),
                            child: InkWell(
                              child: Container(
                                width: 120,
                                height: 30,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 17, top: 2),
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
                                    new Directionality(textDirection: TextDirection.rtl, child: Advertises())),(Route<dynamic> route) => false);
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
                          Padding(padding: EdgeInsets.only(right: 10, top: 85),
                            child: InkWell(
                              child: Container(
                                width: 120,
                                height: 30,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 28, top: 2),
                                  child: new Text("ایجاد تبلیغ", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff483D8B),
                                ),
                              ),
                              onTap: (){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) =>
                                    new Directionality(textDirection: TextDirection.rtl, child: CreateAdvertises())),(Route<dynamic> route) => false);
                              },
                            ),
                          ), // ایجاد تبلیغ
                        ],
                      ),
                    ), // PDF & Excel
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
                          advertisesInformation.clear();
                          GetAdvertisesByName();
                        },
                      ),
                    ), // دکمه جستجو
                    Padding(padding: EdgeInsets.only(left: 27,right: 410, top: 150),
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
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: SearchTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "... عنوان", hintStyle: TextStyle(color: Colors.grey)),
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
                                    Padding(padding: EdgeInsets.only(right: 25, top: 5),
                                      child: new Text("عنوان", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 160, top: 5),
                                      child: new Text("محل تبلیغ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 100, top: 5),
                                      child: new Text("وضعیت", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 120, top: 5),
                                      child: new Text("تاریخ", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 120, top: 5),
                                      child: new Text("مشخصات کامل", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 180, top: 5),
                                      child: new Text("سازنده", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
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
                            itemCount: advertisesInformation.length,
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
                                        Padding(padding:EdgeInsets.only(right: 25),
                                          child: Container(
                                            width: 120,
                                            height: 20,
                                            child: new Text(advertisesInformation[index]["AdName"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 90),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: new Text(advertisesInformation[index]["AdPlace"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 63),
                                          child: Container(
                                            width: 50,
                                            height: 20,
                                            child: new Text(IsActivate(advertisesInformation[index]["AdIsActivate"]).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 90),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: new Text(PersianDate.fromGregorianString(Convertdate(advertisesInformation[index]["AdCreationDate"])).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.only(right: 60),
                                          child: InkWell(
                                            child: Container(
                                              width: 100,
                                              height: 30,
                                              child: Padding(
                                                padding: EdgeInsets.only(right: 30, top: 4),
                                                child: new Text("مشاهده", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 13)),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0xff483D8B),
                                              ),
                                            ),
                                            onTap: (){
                                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>new Directionality(textDirection: TextDirection.rtl, child: AdvertisesInfo(advertisesInformation[index]["_id"].toString(), advertisesInformation[index]["AdName"].toString()))),(Route<dynamic> route) => false);
                                            },
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 70),
                                          child: Container(
                                            width: 150,
                                            height: 20,
                                            child: Padding(padding: EdgeInsets.only(right: 80),
                                              child: new Text(advertisesInformation[index]["AdCreatedBy"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
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
  GetAdvertises() async{
    print('GetAdvertises Run...');
    try {
      Response response = await Dio().post("http://jamq.ir:3000/Ads/GetAllAdvertises");
      if(response.data.toString() != 'Advertises Does Not Exist!!!'){
        advertisesInformation = response.data;
        print('advertisesInformation = '+advertisesInformation.toString());
        return advertisesInformation;
      }else{
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: "!!!تبلیغاتی وجود ندارد",
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
  GetAdvertisesByName() async{
    print('GetAdvertisesByName Run...');
    IsSearch = true;
    if(SearchTextBox.text == ''){
      Alert(
        context: context,
        type: AlertType.none,
        title: "پیغام",
        desc: "!!!لطفا عنوان مورد نظر را وارد کنید",
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
          "Name":SearchTextBox.text,
        });
        _openLoadingDialog(context);
        Response response = await Dio().post("http://jamq.ir:3000/Ads/GetAdvertisesByName",options: Options(contentType: 'multipart/form-data'),data:formData);
        if(response.data.toString() != 'Advertises Does Not Exist!!!'){
          Navigator.pop(context);
          advertisesInformation = response.data;
          print('advertisesInformation = '+advertisesInformation.toString());
          setState(() {
            return advertisesInformation;
          });
        }else{
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: "!!!تبلیغی وجود ندارد",
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
                  new Directionality(textDirection: TextDirection.rtl, child: Advertises())),(Route<dynamic> route) => false),
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