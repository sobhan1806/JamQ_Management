import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
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

class CreateUnauthorizedWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateUnauthorizedWordsState();
  }
}

class CreateUnauthorizedWordsState extends State<CreateUnauthorizedWords> {
  final CursedWordTextBox = TextEditingController();

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
                        onTap: (){
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: OtherApps())),(Route<dynamic> route) => false);
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
              Padding(padding: EdgeInsets.only(right: 690, top: 80),
                child: new Text("ایجاد کلمه غیر مجاز", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
              ),// عنوان صفحه
              Padding(padding: EdgeInsets.only(right: 530, top: 260),
                child: new Text("کلمه", style: new TextStyle(color: Colors.deepPurple, fontFamily: 'IRANSans', fontSize: 20)),
              ),// کلمه
              Padding(padding: EdgeInsets.only(left: 380,right: 580, top: 250),
                child: Card(
                  color: Color(0xff9370DB),
                  child: Container(
                    width: width,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Flexible(
                            fit: FlexFit.loose,
                            child: new Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: TextField(style: TextStyle(color: Colors.white),controller: CursedWordTextBox, textAlign: TextAlign.right, cursorColor: Colors.white,
                                  decoration: new InputDecoration(border: InputBorder.none, hintText: "... کلمه", hintStyle: TextStyle(color: Colors.black26)),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 2,
                                  maxLength: 60,
                                  autofocus: true,
                                ))),
                      ],),
                  ),
                ),
              ), // کادر کلمه
              Padding(padding: EdgeInsets.only(right: 730, top: 400),
                child: InkWell(
                  child: Container(
                    width: 110,
                    height: 30,
                    child: Padding(
                      padding: EdgeInsets.only(right: 23, top: 2),
                      child: new Text("ایجاد کردن", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff483D8B),
                    ),
                  ),
                  onTap: (){
                    CreateCursedword();
                  },
                ),
              ), // ایجاد کردن
              Padding(padding: EdgeInsets.only(right: 730, top: 435),
                child: InkWell(
                  child: Container(
                    width: 110,
                    height: 30,
                    child: Padding(
                      padding: EdgeInsets.only(right: 38, top: 2),
                      child: new Text("لیست", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff483D8B),
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) =>
                        new Directionality(textDirection: TextDirection.rtl, child: UnauthorizedWords())),(Route<dynamic> route) => false);
                  },
                ),
              ), // لیست
            ]),
      ),
    ), onWillPop: () => Future(() => false));
  }
  CreateCursedword() async {
    print('CreateCursedword Run...');
    if(CursedWordTextBox.text == ''){
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
          "CursedWord":CursedWordTextBox.text,
        });
        _openLoadingDialog(context);
        Response response = await Dio().post("http://jamq.ir:3000/Mainuser/CreateCursedWords",options: Options(contentType: 'multipart/form-data'),data:formData);
        print(response.data.toString());
        if(response.data.toString() == 'CursedWords Done!') {
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: "!عملیات با موفقیت انجام شد",
            buttons: [
              DialogButton(
                child: Text(
                  "تایید",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>
                    new Directionality(textDirection: TextDirection.rtl, child: UnauthorizedWords())),(Route<dynamic> route) => false),
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