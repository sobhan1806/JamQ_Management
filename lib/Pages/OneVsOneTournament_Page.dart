import 'package:dio/dio.dart';
import 'package:jalali_date/jalali_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'AbouteUs_Page.dart';
import 'Advertises_Page.dart';
import 'Discount_Page.dart';
import 'Home_Page.dart';
import 'InviteLog_Page.dart';
import 'LoginReport_Page.dart';
import 'Login_Page.dart';
import 'Notification_Page.dart';
import 'PanelUsers_Page.dart';
import 'Register_Page.dart';
import 'Tickets_Page.dart';
import 'TournamentTypes_Page.dart';
import 'Transactions_Page.dart';
import 'UnauthorizedWords_Page.dart';

class OneVsOneTournament extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OneVsOneTournamentState();
  }

}
class OneVsOneTournamentState extends State<OneVsOneTournament>{
  final SearchTextBox = TextEditingController();
  var appscaffold;
  Future loadfuture;
  List tournamentInformation;
  bool IsSearch = false;

  @override
  void initState() {
    super.initState();
    loadfuture =  GetOneVsOneTournament();
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(child: FutureBuilder(
      future:loadfuture ,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;

        if(snapshot.hasData){
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
                    Padding(padding: EdgeInsets.only(right: 710, top: 80),
                      child: new Text("مسابقات یک به یک", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                    ),// عنوان صفحه
                    Padding(padding: EdgeInsets.only(left: 250, right: 500, top: 200),
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
                                      child: new Text("بازیکن اول", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 60, top: 5),
                                      child: new Text("بازیکن دوم", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 60, top: 5),
                                      child: new Text("تاریخ", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                    Padding(padding: EdgeInsets.only(right: 80, top: 5),
                                      child: new Text("برنده", style: new TextStyle(color: Colors.white, fontFamily: 'IRANSans', fontWeight: FontWeight.normal, fontSize: 15)),
                                    ),
                                  ]),
                                ]),
                          ),
                        ),
                      ]),
                    ), // عنوان جدول
                    Padding(padding: EdgeInsets.only(left: 250,right: 500, top: 250),
                      child: Container(
                        width: width,
                        height: 350,
                        child: new ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: tournamentInformation.length,
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
                                              child: new Text(tournamentInformation[index]["_id"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 35),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: Center(
                                              child: new Text(tournamentInformation[index]["MPone"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 35),
                                          child: Container(
                                            width: 80,
                                            height: 20,
                                            child: Center(
                                              child: new Text(tournamentInformation[index]["MPtwo"].toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 38),
                                          child: Container(
                                            width: 70,
                                            height: 20,
                                            child: new Text(PersianDate.fromGregorianString(Convertdate(tournamentInformation[index]["MDateTime"])).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        Padding(padding:EdgeInsets.only(right: 20),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            child: Center(
                                              child: new Text(StateTour(tournamentInformation[index]["MWinner"]).toString(), style: new TextStyle(color: Color(0xff2E0273), fontFamily: 'IRANSans', fontWeight: FontWeight.bold, fontSize: 13)),
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
        ) : new Center(child: CircularProgressIndicator());
      },
    ), onWillPop: () => Future(() => false));
  }
  GetOneVsOneTournament() async{
    print('GetOneVsOneTournament Run...');
    try {
      Response response = await Dio().post("http://jamq.ir:3000/Management/GetOneVsOneTournament");
      if(response.data.toString() != 'OneVsOneMatches Not Exist!!!'){
        tournamentInformation = response.data;
        print('tournamentInformation = '+tournamentInformation.toString());
        return tournamentInformation;
      }else{
        Alert(
          context: context,
          type: AlertType.none,
          title: "پیغام",
          desc: "!!!مسابقه ای وجود ندارد",
          buttons: [
            DialogButton(
              child: Text(
                "تایید",
                style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
              ),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) =>
                  new Directionality(textDirection: TextDirection.rtl, child: TournamentTypes())),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: TournamentTypes())),(Route<dynamic> route) => false),
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
  StateTour(var state){
    if(state == 'NotDefined' || state == null){
      return "نامشخص";
    }
  }
}