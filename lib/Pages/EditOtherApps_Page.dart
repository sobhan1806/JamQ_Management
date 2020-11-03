import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaam_q/Pages/Advertises_Page.dart';
import 'package:jaam_q/Pages/ApplicationUsers_Page.dart';
import 'package:jaam_q/Pages/Discount_Page.dart';
import 'package:jaam_q/Pages/Home_Page.dart';
import 'package:jaam_q/Pages/InviteLog_Page.dart';
import 'package:jaam_q/Pages/Login_Page.dart';
import 'package:jaam_q/Pages/Transactions_Page.dart';
import 'package:jaam_q/Pages/Notification_Page.dart';
import 'package:jaam_q/Pages/OtherApps_Page.dart';
import 'package:jaam_q/Pages/PanelUsers_Page.dart';
import 'package:jaam_q/Pages/Tickets_Page.dart';
import 'package:jaam_q/Pages/UnauthorizedWords_Page.dart';
import 'package:jaam_q/Pages/AbouteUs_Page.dart';
import 'LoginReport_Page.dart';

class EditOtherApps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditOtherAppsState();
  }
}

class EditOtherAppsState extends State<EditOtherApps> {
  var check = 'assets/images/checked.png';
  var off = 'assets/images/power.png';
  bool CheckBoxValue = false;
  bool IsAvillable = false;
  List data;
  Image image;
  var picdecode;
  var img64;
  var imageimg64;
  var jsonimg64;
  var ispic;

  TextEditingController TitleTextBox;
  TextEditingController TextTextBox;
  TextEditingController StateTextBox;
  TextEditingController URLTextBox;

  @override
  void intitState() {
    super.initState();

    TitleTextBox = new TextEditingController();
    TextTextBox = new TextEditingController();
    StateTextBox = new TextEditingController();
    URLTextBox = new TextEditingController();
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
              Padding(padding: EdgeInsets.only(right: 660, top: 80),
                child: new Text("ویرایش دیگر برنامه های ما", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
              ),// عنوان صفحه
              Padding(padding: EdgeInsets.only(right: 430, top: 183),
                child: new Text("عنوان", style: new TextStyle(color: Colors.deepPurple, fontFamily: 'IRANSans', fontSize: 20)),
              ),// عنوان
              Padding(padding: EdgeInsets.only(left: 260,right: 480, top: 180),
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
                                child: TextField(style: TextStyle(color: Colors.white),controller: TitleTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.black26)),
                                  keyboardType: TextInputType.multiline,
                                  autofocus: true,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر عنوان
              Padding(padding: EdgeInsets.only(right: 440, top: 223),
                child: new Text("متن", style: new TextStyle(color: Colors.deepPurple, fontFamily: 'IRANSans', fontSize: 20)),
              ),// متن
              Padding(padding: EdgeInsets.only(left: 260,right: 480, top: 220),
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
                                child: TextField(style: TextStyle(color: Colors.white),controller: TextTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                  keyboardType: TextInputType.multiline,
                                  autofocus: true,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر متن
              Padding(padding: EdgeInsets.only(right: 410, top: 263),
                child: new Text("وضعیت", style: new TextStyle(color: Colors.deepPurple, fontFamily: 'IRANSans', fontSize: 20)),
              ),// وضعیت
              Padding(padding: EdgeInsets.only(left: 260,right: 480, top: 260),
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
                                child: TextField(style: TextStyle(color: Colors.white),controller: StateTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                  keyboardType: TextInputType.multiline,
                                  autofocus: true,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر وضعیت
              Padding(padding: EdgeInsets.only(right: 435, top: 307),
                child: new Text("URL", style: new TextStyle(color: Colors.deepPurple, fontFamily: 'IRANSans', fontSize: 20)),
              ),// URL
              Padding(padding: EdgeInsets.only(left: 260,right: 480, top: 300),
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
              Padding(padding: EdgeInsets.only(right: 1170, top: 185),
                child:
                InkWell(
                    child:
                    CircleAvatar(
                      child: image,
                      backgroundColor: Colors.deepPurple,
                      radius: 70,
                    ),
                    onTap: (){
                    }
                ),
              ),// Circle Avatar
              Padding(padding: EdgeInsets.only(right: 1195, top: 340),
                child:
                Container(
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
              ), // انتخاب
              Padding(padding: EdgeInsets.only(right: 735, top: 370),
                child:
                Container(
                  width: 100,
                  height: 30,
                  child: Padding(
                    padding: EdgeInsets.only(right: 27, top: 2),
                    child: new Text("ویرایش", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff483D8B),
                  ),
                ),
              ), // ویرایش
              Padding(padding: EdgeInsets.only(right: 735, top: 405),
                child:
                Container(
                  width: 100,
                  height: 30,
                  child: Padding(
                    padding: EdgeInsets.only(right: 26, top: 3),
                    child: new Text("بازگشت", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff483D8B),
                  ),
                ),
              ), // بازگشت
            ]),
      ),
    ), onWillPop: () => Future(() => false));
  }
}