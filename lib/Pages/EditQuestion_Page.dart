import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/helpers/show_radio_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:jaam_q/Pages/PanelUsersInfo_Page.dart';
import 'package:jaam_q/Pages/QuestionsTypes_Page.dart';
import 'package:jaam_q/Pages/Questions_Page.dart';
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

class EditQuestion extends StatefulWidget {
  var IdResponse;
  EditQuestion(this.IdResponse);
  EditQuestion.none();

  @override
  State<StatefulWidget> createState() {
    return EditQuestionState();
  }
}

class EditQuestionState extends State<EditQuestion> {
  var selectedUsState;
  List<String> Category = <String>[];
  List<String> CId = <String>[];
  List<String> TrueAnswer = <String>[
    'گزینه اول',
    'گزینه دوم',
    'گزینه سوم',
    'گزینه چهارم',
  ];
  List<String> Difficulty = <String>[
    'آسان',
    'متوسط',
    'سخت',
  ];
  final TextTextBox = TextEditingController();
  final TypeTextBox = TextEditingController();
  final CategoryTextBox = TextEditingController();
  final TrueAnswerTextBox = TextEditingController();
  final DifficultyTextBox = TextEditingController();
  final DescriptiveAnswerTextBox = TextEditingController();
  final Choice1TextBox = TextEditingController();
  final Choice2TextBox = TextEditingController();
  final Choice3TextBox = TextEditingController();
  final Choice4TextBox = TextEditingController();
  final StateTextBox = TextEditingController();
  var Id, CatId, CatName;
  bool isactivate;
  var questioninformation, categoryinformation, catnameinformation;
  var appscaffold;
  Future loadfuture;
  var Operator = '';
  var Trueanswer, difficulty, Trueanswer1, difficulty1, categoryname, categoryId;

  @override
  void initState() {
    super.initState();
    loadfuture = GetQuestionByid();
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
                    Padding(padding: EdgeInsets.only(right: 750, top: 80),
                      child: new Text("ویرایش سوال", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 25)),
                    ),// عنوان صفحه
                    Padding(padding: EdgeInsets.only(right: 417, top: 153),
                      child: new Text("متن", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// متن
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 150),
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
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)], style: TextStyle(color: Colors.white),controller: TextTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر متن
                    Padding(padding: EdgeInsets.only(right: 420, top: 193),
                      child: new Text("نوع", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// نوع
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 190),
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
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)], style: TextStyle(color: Colors.white),controller: TypeTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر نوع
                    Padding(padding: EdgeInsets.only(right: 360, top: 233),
                      child: new Text("دسته بندی", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// دسته بندی
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 230),
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
                                    child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(80), WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: CategoryTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                      decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
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
                                        title: "دسته بندی",
                                        headerColor: Colors.deepPurple,
                                        items: Category,
                                        selectedItem: selectedUsState,
                                        onChanged: (value) => setState(() =>   CategoryTextBox.text = value),
                                      );
                                    },
                                  ),),),
                            ],),
                        ),
                      ),
                    ), // کادر دسته بندی
                    Padding(padding: EdgeInsets.only(right: 370, top: 274),
                      child: new Text("توضیحات", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// توضیحات
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 271),
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
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)], style: TextStyle(color: Colors.white),controller: DescriptiveAnswerTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر توضیحات
                    Padding(padding: EdgeInsets.only(right: 375, top: 313),
                      child: new Text("گزینه اول", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// گزینه اول
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 311),
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
                    Padding(padding: EdgeInsets.only(right: 355, top: 434),
                      child: new Text("گزینه چهارم", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// گزینه چهارم
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
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)], style: TextStyle(color: Colors.white),controller: Choice4TextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر گزینه چهارم
                    Padding(padding: EdgeInsets.only(right: 348, top: 474),
                      child: new Text("گزینه صحیح", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// گزینه صحیح
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 471),
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
                                      decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
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
                    Padding(padding: EdgeInsets.only(right: 400, top: 514),
                      child: new Text("سطح", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// سطح
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 511),
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
                                    child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(80), WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: DifficultyTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                      decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
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
                                        title: "سطح",
                                        headerColor: Colors.deepPurple,
                                        items: Difficulty,
                                        selectedItem: selectedUsState,
                                        onChanged: (value) => setState(() =>   DifficultyTextBox.text = value),
                                      );
                                    },
                                  ),),),
                            ],),
                        ),
                      ),
                    ), // کادر سطح
                    Padding(padding: EdgeInsets.only(right: 380, top: 554),
                      child: new Text("وضعیت", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// وضعیت
                    Padding(padding: EdgeInsets.only(left: 260,right: 455, top: 551),
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
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)], style: TextStyle(color: Colors.white),controller: StateTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "", hintStyle: TextStyle(color: Colors.white)),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                        enabled: false,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر وضعیت
                    Padding(padding: EdgeInsets.only(right: 570, top: 610),
                      child: InkWell(
                        child: Container(
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
                        onTap: (){
                          EditQuestion();
                        },
                      ),
                    ), // ویرایش
                    Padding(padding: EdgeInsets.only(right: 700, top: 610),
                      child: InkWell(
                        child: Container(
                          width: 160,
                          height: 30,
                          child: Padding(
                            padding: EdgeInsets.only(right: 25, top: 2),
                            child: new Text("فعال/غیرفعال سازی", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff483D8B),
                          ),
                        ),
                        onTap: (){
                          QuestionIsBanned();
                        },
                      ),
                    ), // فعال/غیرفعال سازی
                    Padding(padding: EdgeInsets.only(right: 890, top: 610),
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) =>
                              new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false);
                        },
                      ),
                    ), // بازگشت
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
  GetQuestionByid() async{
    print('GetQuestionByid Run...');
    Id = widget.IdResponse;
    print('Id = '+Id);
    try {
      FormData formData = FormData.fromMap({
        "Qsid":Id,
      });
      Response response = await Dio().post("http://jamq.ir:3000/Questions/GetQuestionByid",options: Options(contentType: 'multipart/form-data'),data:formData);
      if(response.data.toString() != 'NotExist'){
        questioninformation = response.data;
        print('GetQuestionByid = '+questioninformation.toString());
        Trueanswer1 = questioninformation["QSTrueAnswer"].toString();
        print('Trueanswer1 = '+Trueanswer1);
        difficulty1 = questioninformation["QSDifficulty"].toString();
        print('difficulty1 = '+difficulty1);
        GetCategory();
        GetCategoryByid();
        return questioninformation;
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
                  new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  GetCategoryByid() async{
    print('GetCategoryByid Run...');
    CatId = questioninformation["QSCategory"];
    try {
      FormData formData = FormData.fromMap({
        "id":CatId,
      });
      Response response = await Dio().post("http://jamq.ir:3000/Questions/GetCategoryByid",options: Options(contentType: 'multipart/form-data'),data:formData);
      if(response.data.toString() != 'NotExist'){
        categoryinformation = response.data;
        categoryname = categoryinformation["CaName"];
        print('categoryname = '+categoryname);
        FillInfo();
        return categoryinformation;
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
                  new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  GetCategoryByName() async{
    print('GetCategoryByName Run...');
    print('CategoryTextBox = '+CategoryTextBox.text);
    try {
      FormData formData = FormData.fromMap({
        "CaName":CategoryTextBox.text,
      });
      print('Response Runnnnn');
      Response response = await Dio().post("http://jamq.ir:3000/Questions/GetCategoryByName",options: Options(contentType: 'multipart/form-data'),data:formData);
      if(response.data.toString() != 'category does not exist'){
        catnameinformation = response.data;
        categoryId = catnameinformation[0]["_id"];
        print('categoryId = '+categoryId.toString());
        EditQuestion();
        return catnameinformation;
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
                  new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  GetCategory() async{
    print('GetCategory Run...');
    try {
      Response response = await Dio().post("http://jamq.ir:3000/Mainapp/GetCategory");
      if(response.data.toString() != 'QSCategory Does Not Exist!!!'){
        categoryinformation = response.data;
        for(int i = 0; i < categoryinformation.length; i++){
          Category.add(categoryinformation[i]["CaName"]);
        }
        return categoryinformation;
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
                  new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  FillInfo() async{
    print('FillInfo Run...');
    try {
      TextTextBox.text = questioninformation["QStext"].toString();
      TypeTextBox.text = questioninformation["QSType"].toString();
      CategoryTextBox.text = categoryname;
      DescriptiveAnswerTextBox.text = questioninformation["QSDescriptiveAnswer"].toString();
      Choice1TextBox.text = questioninformation["QSChoice1"].toString();
      Choice2TextBox.text = questioninformation["QSChoice2"].toString();
      Choice3TextBox.text = questioninformation["QSChoice3"].toString();
      Choice4TextBox.text = questioninformation["QSChoice4"].toString();
      StateTextBox.text = IsActivate(questioninformation["QSIsActive"]);

      if(questioninformation["QSTrueAnswer"] == "1"){
        TrueAnswerTextBox.text = 'گزینه اول';
      }else if(questioninformation["QSTrueAnswer"] == "2"){
        TrueAnswerTextBox.text = 'گزینه دوم';
      }else if(questioninformation["QSTrueAnswer"] == "3"){
        TrueAnswerTextBox.text = 'گزینه سوم';
      }else if(questioninformation["QSTrueAnswer"] == "4"){
        TrueAnswerTextBox.text = 'گزینه چهارم';
      }

      if(questioninformation["QSDifficulty"] == "easy"){
        DifficultyTextBox.text = 'آسان';
      }else if(questioninformation["QSDifficulty"] == "medium"){
        DifficultyTextBox.text = 'متوسط';
      }else if(questioninformation["QSDifficulty"] == "hard"){
        DifficultyTextBox.text = 'سخت';
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
                new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  QuestionIsBanned() async{
    print('QuestionIsBanned Run...');
    print('Id = '+Id);
    print('QSIsActive = '+questioninformation["QSIsActive"].toString());
    if(questioninformation["QSIsActive"] == true){
      isactivate = false;
    }else{
      isactivate = true;
    }
    try {
      FormData formData = FormData.fromMap({
        "id":Id,
        "IsActivate":isactivate,
      });
      _openLoadingDialog(context);
      Response response = await Dio().post("http://jamq.ir:3000/Questions/QuestionIsBanned",options: Options(contentType: 'multipart/form-data'),data:formData);
      print('response = '+response.toString());
      if(response.data.toString() == 'QuestionIsBanned Done!'){
        if(isactivate == true){
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: ".فعال سازی سوال با موفقیت انجام شد",
            buttons: [
              DialogButton(
                child: Text(
                  "تایید",
                  style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                ),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>
                    new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
                color: Color(0xffD3D3D3),
              )
            ],
          ).show(); // Message
        }else{
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: ".غیرفعال سازی سوال با موفقیت انجام شد",
            buttons: [
              DialogButton(
                child: Text(
                  "تایید",
                  style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'IRANSans'),
                ),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>
                    new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
                color: Color(0xffD3D3D3),
              )
            ],
          ).show(); // Message
        }
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
                new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  EditQuestion() async {
    print('EditQuestion Run...');

    if(TrueAnswerTextBox.text == 'گزینه اول'){
      Trueanswer = '1';
    }else if(TrueAnswerTextBox.text == 'گزینه دوم'){
      Trueanswer = '2';
    }else if(TrueAnswerTextBox.text == 'گزینه سوم'){
      Trueanswer = '3';
    }else if(TrueAnswerTextBox.text == 'گزینه چهارم'){
      Trueanswer = '4';
    }

    if(DifficultyTextBox.text == 'آسان'){
      difficulty = 'easy';
    }else if(DifficultyTextBox.text == 'متوسط'){
      difficulty = 'medium';
    }else if(DifficultyTextBox.text == 'سخت'){
      difficulty = 'hard';
    }
    if(TrueAnswerTextBox.text == '' || DifficultyTextBox.text == '' || TextTextBox.text == '' || TypeTextBox.text == '' || TypeTextBox.text == '' || DescriptiveAnswerTextBox.text == '' || Choice1TextBox.text == '' || Choice2TextBox.text == '' || Choice3TextBox.text == '' || Choice4TextBox.text == ''){
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
      try {
        GetCategoryByName();
        print('EditId = '+categoryId.toString());
        FormData formData = FormData.fromMap({
          "id":Id,
          "QStext":TextTextBox.text,
          "QSType":TypeTextBox.text,
          "QSCategory":categoryId.toString(),
          "QSDescriptiveAnswer":DescriptiveAnswerTextBox.text,
          "QSChoice1":Choice1TextBox.text,
          "QSChoice2":Choice2TextBox.text,
          "QSChoice3":Choice3TextBox.text,
          "QSChoice4":Choice4TextBox.text,
          "QSTrueAnswer":Trueanswer,
          "QSDifficulty":difficulty,
        });
        _openLoadingDialog(context);
        Response response = await Dio().post("http://jamq.ir:3000/Questions/EditQuestion",options: Options(contentType: 'multipart/form-data'),data:formData);
        print(response.data.toString());
        if(response.data.toString() == "EditQuestion Done!") {
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
                    new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
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
                  new Directionality(textDirection: TextDirection.rtl, child: Questions())),(Route<dynamic> route) => false),
              color: Color(0xffD3D3D3),
            )
          ],
        ).show(); // Message
        print(e);
      }
    }
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