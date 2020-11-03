import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaam_q/Pages/Advertises_Page.dart';
import 'package:jaam_q/Pages/ApplicationUsers_Page.dart';
import 'package:jaam_q/Pages/Discount_Page.dart';
import 'package:jaam_q/Pages/Home_Page.dart';
import 'package:jaam_q/Pages/InviteLog_Page.dart';
import 'LoginReport_Page.dart';
import 'package:jaam_q/Pages/Login_Page.dart';
import 'package:jaam_q/Pages/Transactions_Page.dart';
import 'package:jaam_q/Pages/Notification_Page.dart';
import 'package:jaam_q/Pages/OtherApps_Page.dart';
import 'package:jaam_q/Pages/PanelUsers_Page.dart';
import 'package:jaam_q/Pages/Tickets_Page.dart';
import 'package:jaam_q/Pages/UnauthorizedWords_Page.dart';
import 'package:jaam_q/Pages/AbouteUs_Page.dart';

class OtherAppsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OtherAppsListState();
  }
}

class OtherAppsListState extends State<OtherAppsList> {
  var check = 'assets/images/checked.png';
  var off = 'assets/images/power.png';
  bool CheckBoxValue = false;
  bool IsAvillable = false;
  List data;
  List OtherAppsListDataList;

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
              Padding(padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 1212, top: 85),
                      child:
                      Container(
                        width: 120,
                        height: 30,
                        child: Padding(
                          padding: EdgeInsets.only(right: 27, top: 2),
                          child: new Text("ایجاد کردن", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff483D8B),
                        ),
                      ),
                    ), // ایجاد کردن
                  ],
                ),
              ),// ایجاد کردن
              Container(
                height: 60,
                color: Color(0xff24026E),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(padding: EdgeInsets.only(right: 80),
                        child: new Text("JamQ", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 40)),
                      ),// JamQ
                      Padding(padding: EdgeInsets.only(right: 100),
                        child: new Text("فعال/غیرفعال کردن اپلیکیشن", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontSize: 15)),
                      ),// فعال/غیرفعال کردن اپلیکیشن
                      Padding(padding: EdgeInsets.only(right: 0),
                        child: Switch(activeColor: Color(0xff31B404), value: CheckBoxValue, onChanged:(bool value){
                          setState(() {
                            CheckBoxValue = value;
                            if(CheckBoxValue == true){
                              IsAvillable = true;
                            }else if(CheckBoxValue == false){
                              IsAvillable = false;
                            }
                          });
                        },
                          activeThumbImage: NetworkImage(check),
                          inactiveThumbImage: NetworkImage(off),
                        ),
                      ),// Switch
                      Padding(padding: EdgeInsets.only(right: 200),
                        child: new Text("به جام کیو خوش آمدید", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontSize: 15)),
                      ),// به جام کیو خوش آمدید
                      Padding(padding: EdgeInsets.only(right: 420),
                        child: Container(
                          child: new Text("User Name", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontSize: 15)),
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
                        title: new Text("گزارشات ورود به اپلیکیشن",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
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
                        title: new Text("گزارشات دعوت به پنل",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
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
                        leading: Icon(FontAwesomeIcons.list, color: Colors.white, size: 21),
                        title: new Text("دیگر برنامه های ما",style: TextStyle(fontFamily: 'IRANSans', fontSize: 16, color: Colors.white)),
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
              Padding(padding: EdgeInsets.only(right: 700, top: 80),
                child: new Text("دیگر برنامه های ما", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
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
                              Padding(padding: EdgeInsets.only(right: 30, top: 5),
                                child: new Text("عنوان", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)),
                              ),
                              Padding(padding: EdgeInsets.only(right: 150, top: 5),
                                child: new Text("متن", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                              ),
                              Padding(padding: EdgeInsets.only(right: 170, top: 5),
                                child: new Text("وضعیت", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                              ),
                              Padding(padding: EdgeInsets.only(right: 130, top: 5),
                                child: new Text("URL", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                              ),
                              Padding(padding: EdgeInsets.only(right: 150, top: 5),
                                child: new Text("تاریخ ایجاد", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                              ),
                              Padding(padding: EdgeInsets.only(right: 95, top: 5),
                                child: new Text("ویرایش داده ها", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
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
                      itemCount: 1,
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
                                  Padding(padding:EdgeInsets.only(right: 10),
                                    child: Container(
                                      width: 150,
                                      height: 20,
                                      child: new Text("0000-00-00T00:00:000Z", style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                    ),
                                  ),
                                  Padding(padding:EdgeInsets.only(right: 15),
                                    child: Container(
                                      width: 150,
                                      height: 20,
                                      child: new Text("0000-00-00T00:00:000Z", style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                    ),
                                  ),
                                  Padding(padding:EdgeInsets.only(right: 90),
                                    child: Container(
                                      width: 40,
                                      height: 20,
                                      child: new Text("غیرفعال", style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                    ),
                                  ),
                                  Padding(padding:EdgeInsets.only(right: 100),
                                    child: Container(
                                      width: 130,
                                      height: 20,
                                      child: new Text("www.technocell.ir", style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                    ),
                                  ),
                                  Padding(padding:EdgeInsets.only(right: 40),
                                    child: Container(
                                      width: 180,
                                      height: 20,
                                      child: new Text("0000-00-00T00:00:000Z", style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                    ),
                                  ),
                                  Padding(padding:EdgeInsets.only(right: 25),
                                    child: Card(
                                      child: Container(
                                        width: 90,
                                        height: 30,
                                        color: Color(0xff483D8B),
                                        child: Padding(padding: EdgeInsets.only(right: 25, top: 2),
                                          child: new Text("ویرایش", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 13)),
                                        ),
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
    ), onWillPop: () => Future(() => false));
  }
}