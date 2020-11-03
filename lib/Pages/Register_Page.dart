import 'dart:html';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:jaam_q/Pages/Home_Page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  var selectedUsState;
  List<String> AccessLevel = <String>[];
  final UserNameTextBox = TextEditingController();
  final PasswordTextBox = TextEditingController();
  final RePasswordTextBox = TextEditingController();
  final AccessLevelTextBox = TextEditingController();
  List accessinformation;
  String dropdownValue;
  var appscaffold;
  Future loadfuture;
  bool applicationusers = false;
  bool panelusers = false;
  bool transactions = false;
  bool access = false;
  bool advertising = false;
  bool tournaments = false;
  bool unauthorizedwords = false;
  bool questions = false;
  bool notification = false;
  bool tickets = false;
  bool discounts = false;
  bool applogintoreports = false;
  bool appinvitationtoreports = false;
  //var otherapps = '0';
  bool aboutus = false;
  bool inappitems = false;
  bool awards = false;

  bool applicationusersCheckBoxValue = false;
  bool panelusersCheckBoxValue = false;
  bool transactionsCheckBoxValue = false;
  bool accessCheckBoxValue = false;
  bool advertisingCheckBoxValue = false;
  bool tournamentsCheckBoxValue = false;
  bool unauthorizedwordsCheckBoxValue = false;
  bool questionsCheckBoxValue = false;
  bool notificationCheckBoxValue = false;
  bool ticketsCheckBoxValue = false;
  bool discountsCheckBoxValue = false;
  bool applogintoreportsCheckBoxValue = false;
  bool appinvitationtoreportsCheckBoxValue = false;
  //bool otherappsCheckBoxValue = false;
  bool aboutusCheckBoxValue = false;
  bool InAppItemsCheckBoxValue = false;
  bool AwardsCheckBoxValue = false;

  @override
  void initState() {
    super.initState();
    loadfuture = GetOchart();
  }

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
                    Padding(padding: EdgeInsets.only(right: 580, bottom: 550),
                      child: new Text("JamQ", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 80)),
                    ),// JamQ
                    Row(children: [
                      Padding(padding: EdgeInsets.only(right: 640, top: 130),
                          child: new Text("ثبت نام", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.deepPurple, fontSize: 30))),// کاربر جدید
                    ]), // نوار بالا
                    Padding(padding: EdgeInsets.only(right: 325, top: 295),
                      child: new Text("نام کاربری", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// نام کاربری
                    Padding(padding: EdgeInsets.only(left: 400,right: 410, top: 290),
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
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50), WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: UserNameTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "... نام کاربری", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر نام کاربری
                    Padding(padding: EdgeInsets.only(right: 325, top: 350),
                      child: new Text("کلمه عبور", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// کلمه عبور
                    Padding(padding: EdgeInsets.only(left: 400,right: 410, top: 350),
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
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50), WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: PasswordTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "... کلمه عبور", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر کلمه عبور
                    Padding(padding: EdgeInsets.only(right: 285, top: 410),
                      child: new Text("تکرار کلمه عبور", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// تکرار کلمه عبور
                    Padding(padding: EdgeInsets.only(left: 400,right: 410, top: 410),
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
                                      child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(80), WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: RePasswordTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                        decoration: new InputDecoration(border: InputBorder.none, hintText: "... تکرار کلمه عبور", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
                                        keyboardType: TextInputType.multiline,
                                        autofocus: true,
                                      ))),
                            ],),
                        ),
                      ),
                    ), // کادر تکرار کلمه عبور
                    Padding(padding: EdgeInsets.only(right: 285, top: 473),
                      child: new Text("سطح دسترسی", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                    ),// سطح دسترسی
                    Padding(padding: EdgeInsets.only(left: 400,right: 410, top: 470),
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
                                          child: TextField(inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(80), WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")), BlacklistingTextInputFormatter.singleLineFormatter], style: TextStyle(color: Colors.white),controller: AccessLevelTextBox, textAlign: TextAlign.center, cursorColor: Colors.white,
                                          decoration: new InputDecoration(border: InputBorder.none, hintText: "...سطح دسترسی", hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.normal, fontFamily: 'IRANSans')),
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
                                              title: "سطح دسترسی",
                                              headerColor: Colors.deepPurple,
                                              items: AccessLevel,
                                              selectedItem: selectedUsState,
                                              onChanged: (value) => setState(() =>   AccessLevelTextBox.text = value),
                                            );
                                          },
                                        ),),),
                              ],),
                        ),
                      ),
                    ), // کادر سطح دسترسی
                    Row(children: [
                      Padding(padding: EdgeInsets.only(right: 630, top: 540),
                        child:
                        InkWell(child:
                        Container(
                          width: 100,
                          height: 30,
                          child: Padding(padding: EdgeInsets.only(right: 26, top: 2),
                            child: new Text("ثبت نام", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff483D8B),
                          ),
                        ),
                          onTap: (){
                            print('Register Press');
                            Register();
                          },
                        ),
                      ),// ورود
                    ]),// ثبت نام
                    Row(children: [
                      Padding(padding: EdgeInsets.only(right: 630, top: 575),
                        child:
                        InkWell(child:
                        Container(
                          width: 100,
                          height: 30,
                          child: Padding(padding: EdgeInsets.only(right: 36, top: 3),
                            child: new Text("خانه", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff483D8B),
                          ),
                        ),
                          onTap: (){
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) =>
                                new Directionality(textDirection: TextDirection.rtl, child: Home.none())),(Route<dynamic> route) => false);
                          },
                        ),
                      ),
                    ]),// خانه
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
  GetOchart() async{
    print('GetOchart Run...');
    try {
      Response response = await Dio().post("http://jamq.ir:3000/Management/GetAllOChart");
      if(response.data.toString() != 'OChart Does Not Exist!!!'){
        accessinformation = response.data;
        for(int i = 0; i < accessinformation.length; i++){
          AccessLevel.add(accessinformation[i]["OCAccessLevel"]);
        }
        print('AccessLevel = '+AccessLevel.toString());
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
                  new Directionality(textDirection: TextDirection.rtl, child: Home.none())),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: Home.none())),(Route<dynamic> route) => false),
            color: Color(0xffD3D3D3),
          )
        ],
      ).show(); // Message
      print(e);
    }
  }
  Register() async {
    if(UserNameTextBox.text == '' || PasswordTextBox.text == '' || RePasswordTextBox.text == '' || AccessLevelTextBox.text == ''){
      Navigator.pop(context);
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
    }else if(PasswordTextBox.text != RePasswordTextBox.text){
      Alert(
        context: context,
        type: AlertType.none,
        title: "پیغام",
        desc: "!!!کلمه عبور با یکدیگر برابر نیستند",
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
          "UserName":UserNameTextBox.text,
          "Password":PasswordTextBox.text,
          "AccessLevel":AccessLevelTextBox.text,
        });
        _openLoadingDialog(context);
        print('ApplicationAvilability Run...1');
        Response response = await Dio().post("http://jamq.ir:3000/Register/RegisterAdministrativeUser",options: Options(contentType: 'multipart/form-data'),data:formData);
        print(response.data.toString());
        if(response.data.toString() == "User Registered!") {
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
                    new Directionality(textDirection: TextDirection.rtl, child: Home.none())),(Route<dynamic> route) => false),
                color: Colors.grey,
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
                color: Colors.grey,
              )
            ],
          ).show(); // Message
        }
        return true;
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
              onPressed: () => Navigator.pop(context),
              color: Colors.grey,
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