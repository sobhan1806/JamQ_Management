import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:jaam_q/Pages/EditAbouteUs_Page.dart';
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

class AbouteUsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AbouteUsListState();
  }
}

class AbouteUsListState extends State<AbouteUsList> {
  final SearchTextBox = TextEditingController();
  var appscaffold;
  Future loadfuture;
  List aboutusInformation;
  List SearchInformation;
  bool IsSearch = false;

  @override
  void initState() {
    super.initState();
    loadfuture = GetAboutUs();
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
                    Padding(padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 1125, top: 85),
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
                                    new Directionality(textDirection: TextDirection.rtl, child: LoginToAppLog())),(Route<dynamic> route) => false);
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
                    Padding(padding: EdgeInsets.only(right: 745, top: 80),
                      child: new Text("درباره ما", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
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
                                    Padding(padding: EdgeInsets.only(right: 150, top: 5),
                                      child: new Text("نسخه اپلیکیشن", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 100, top: 5),
                                      child: new Text("وب سایت", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 150, top: 5),
                                      child: new Text("ایمیل", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 100, top: 5),
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
                                            width: 70,
                                            height: 20,
                                            child: Center(
                                              child: new Text(aboutusInformation[index]["AUTitle"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 110),
                                          child: Container(
                                            width: 70,
                                            height: 20,
                                            child: Center(
                                              child: new Text(aboutusInformation[index]["AUText"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 155),
                                          child: Container(
                                            width: 40,
                                            height: 20,
                                            child: Center(
                                              child: new Text("V." + aboutusInformation[index]["AUAppversion"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 100),
                                          child: Container(
                                            width: 130,
                                            height: 20,
                                            child: Center(
                                              child: new Text(aboutusInformation[index]["AUWebsite"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 40),
                                          child: Container(
                                            width: 180,
                                            height: 20,
                                            child: Center(
                                              child: new Text(aboutusInformation[index]["AUEmail"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 25),
                                          child: Card(
                                            child: InkWell(
                                              child: Container(
                                                width: 90,
                                                height: 30,
                                                color: Color(0xff483D8B),
                                                child: Padding(padding: EdgeInsets.only(right: 25, top: 2),
                                                  child: new Text("ویرایش", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 13)),
                                                ),
                                              ),
                                              onTap: (){
                                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditAbouteUs(aboutusInformation[index]["AUUrl"].toString()))),(Route<dynamic> route) => false);
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
  GetAboutUs() async{
    print('GetAboutUs Run...');
    try {
      Response response = await Dio().post("http://jamq.ir:3000/Mainapp/GetAboutUs");
      if(response.data.toString() != 'AboutUs Does Not Exist!!!'){
        aboutusInformation = response.data;
        print('aboutusInformation = '+aboutusInformation.toString());
        return aboutusInformation;
      }else{
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: "!!!درباره ما وجود ندارد",
          buttons: [
            DialogButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
              ),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                  new Directionality(textDirection: TextDirection.rtl, child: AbouteUsList())),(Route<dynamic> route) => false),
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
  Convertdate(String Date){
    var DateArray =  Date.split('/');
    var DateForConvert = DateArray[0]+''+DateArray[1]+''+DateArray[2];
    //print('DADD');
    //print(DateForConvert);
    return DateForConvert;
  }
}