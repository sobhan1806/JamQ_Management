import 'dart:html';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:jaam_q/Pages/Home_Page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Register extends StatefulWidget {
  var UserNameResponse;
  Register(this.UserNameResponse);
  Register.none();

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
  bool aboutusCheckBoxValue = false;
  bool InAppItemsCheckBoxValue = false;
  bool AwardsCheckBoxValue = false;

  bool applicationusers1;
  bool panelusers1;
  bool register1;
  bool transactions1;
  bool access1;
  bool advertising1;
  bool tournaments1;
  bool unauthorizedwords1;
  bool questions1;
  bool notification1;
  bool tickets1;
  bool discounts1;
  bool applogintoreports1;
  bool appinvitationtoreports1;
  bool appavilability1;
  bool inappitems1;
  bool awards1;
  bool aboutus1;

  List panelInformation, accessinformationn, ACData;
  var UserName, AccessLevell;

  @override
  void initState() {
    super.initState();
    UserName = widget.UserNameResponse.toString();
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
                    new Align(alignment: Alignment.topCenter,
                      child: Column(children: [
                        new Text("JamQ", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 80)),
                        new Text("ثبت نام", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.deepPurple, fontSize: 30)),
                      ]),
                    ),// بالا
                    new Align(alignment: Alignment.center,
                      child: Column(children: [
                        Padding(padding: EdgeInsets.only(left: 630, top: 212),
                          child: new Text("نام کاربری", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                        ),// نام کاربری
                        Padding(padding: EdgeInsets.only(left: 630, top: 20),
                          child: new Text("کلمه عبور", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                        ),//  کلمه عبور
                        Padding(padding: EdgeInsets.only(left: 670, top: 23),
                          child: new Text("تکرار کلمه عبور", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                        ),// تکرار کلمه عبور
                        Padding(padding: EdgeInsets.only(left: 670, top: 23),
                          child: new Text("سطح دسترسی", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                        ),// سطح دسترسی
                      ]),
                    ),// عناوین
                    new Align(alignment: Alignment.center,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 10, top: 210),
                            child: Card(
                              color: Color(0xff9370DB),
                              child: Container(
                                width: 550,
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
                          Padding(padding: EdgeInsets.only(right: 10, top: 10),
                            child: Card(
                              color: Color(0xff9370DB),
                              child: Container(
                                width: 550,
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
                          Padding(padding: EdgeInsets.only(right: 10, top: 10),
                            child: Card(
                              color: Color(0xff9370DB),
                              child: Container(
                                width: 550,
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
                          Padding(padding: EdgeInsets.only(right: 10, top: 10),
                            child: Card(
                              color: Color(0xff9370DB),
                              child: Container(
                                width: 550,
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
                          Padding(padding: EdgeInsets.only(top: 40),
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
                          Padding(padding: EdgeInsets.only(top: 5),
                            child:
                            InkWell(child:
                            Container(
                              width: 100,
                              height: 30,
                              child: Padding(padding: EdgeInsets.only(right: 36, top: 3),
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
                                    new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false);
                              },
                            ),
                          ),// خانه
                        ]),
                    ),// ورودی ها
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
            desc: ".عملیات با موفقیت انجام شد",
            buttons: [
              DialogButton(
                child: Text(
                  "تایید",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>
                    new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
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
        AccessLevell = panelInformation[0]["AdmAccessLevel"];
        print('AccessLevel = '+AccessLevell);
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
                  new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
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
        accessinformationn = response.data;
        FillInfo(response.data);
        return accessinformationn;
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
                  new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
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
                new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
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
      applicationusers1 = ACData[0]["Applicationusers"];
      panelusers1 = ACData[1]["Panelusers"];
      register1 = ACData[2]["Register"];
      access1 = ACData[3]["Access"];
      transactions1 = ACData[4]["Transactions"];
      advertising1 = ACData[5]["Advertising"];
      tournaments1 = ACData[6]["Tournaments"];
      unauthorizedwords1 = ACData[7]["Unauthorizedwords"];
      questions1 = ACData[8]["Questions"];
      notification1 = ACData[9]["Notification"];
      tickets1 = ACData[10]["Tickets"];
      discounts1 = ACData[11]["Discounts"];
      applogintoreports1 = ACData[12]["Applogintoreports"];
      appinvitationtoreports1 = ACData[13]["Appinvitationtoreports"];
      appavilability1 = ACData[14]["AppAvilability"];
      inappitems1 = ACData[15]["Inappitems"];
      awards1 = ACData[16]["Awards"];
      aboutus1 = ACData[17]["Aboutus"];

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
                new Directionality(textDirection: TextDirection.rtl, child: Home(UserName.toString()))),(Route<dynamic> route) => false),
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