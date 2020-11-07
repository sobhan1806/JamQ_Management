import 'dart:html';
import 'package:dio/dio.dart';
import 'package:dio_retry/dio_retry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaam_q/Pages/Home_Page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final UserNameTextBox = TextEditingController();
  final PasswordTextBox = TextEditingController();

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
              new Align(alignment: Alignment.topCenter,
                child: Column(children: [
                  new Text("JamQ", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontFamily: 'IRANSans', fontSize: 80)),
                  new Text("ورود", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.deepPurple, fontSize: 30)),
                ]),
              ),// بالا
              new Align(alignment: Alignment.center,
                child: Column(children: [
                  Padding(padding: EdgeInsets.only(left: 630, top: 293),
                    child: new Text("نام کاربری", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                  ),// نام کاربری
                  Padding(padding: EdgeInsets.only(left: 630, top: 25),
                    child: new Text("کلمه عبور", style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.normal, fontFamily: 'IRANSans', fontSize: 20)),
                  ),// کلمه عبور
                ]),
              ),// عناوین
              new Align(alignment: Alignment.center,
                child: Column(children: [
                  Padding(padding: EdgeInsets.only(right: 10, top: 290),
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
                  Padding(padding: EdgeInsets.only(right: 10, top: 15),
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
                  Padding(padding: EdgeInsets.only(top: 30),
                    child:
                    InkWell(child:
                    Container(
                      width: 100,
                      height: 30,
                      child: Padding(padding: EdgeInsets.only(right: 37, top: 1),
                        child: new Text("ورود", style: new TextStyle(fontFamily: 'IRANSans', color: Colors.white, fontSize: 15)),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff483D8B),
                      ),
                    ),
                      onTap: (){
                        Login();
                      },
                    ),
                  ),// رود
                ]),
              ),// ورودی ها
            ]),
      ),
    ), onWillPop: () => Future(() => false));
  }
  CreatePanelReportLogin() async {
    print('CreatePanelReportLogin Run...');
      try {
        FormData formData = FormData.fromMap({
          "UserName": UserNameTextBox.text,
          "Report": 'ورود به پنل',
        });
        Response response = await Dio().post("http://jamq.ir:3000/Mainuser/CreatePanelReportLogin",options: Options(contentType: 'multipart/form-data'),data:formData);
        print(response.data.toString());
        if(response.data.toString() == 'PanelReportLogin Done!') {
          print('LoginReport Done!');
        }
        else
        {
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
  Login() async {
    if(UserNameTextBox.text == '' || PasswordTextBox.text == ''){
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
        FormData formData = FormData.fromMap({
          "UserName":UserNameTextBox.text,
          "Password":PasswordTextBox.text,
        });
        _openLoadingDialog(context);
        Response response = await Dio().post("http://jamq.ir:3000/Management/LoginAdministrativeUser",options: Options(contentType: 'multipart/form-data'),data:formData);
        print('response: '+response.data.toString());
        if(response.data.toString() == "User Does Not Exist!!!"){
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: "!!!کاربر وجود ندارد",
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
        }else if(response.data.toString() == "Password is Incorrect!!!"){
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: "!!!کلمه عبور اشتباه است",
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
        }else if(response.data.toString() == "User is Disabled!!!"){
          Navigator.pop(context);
          Alert(
            context: context,
            type: AlertType.none,
            title: "پیغام",
            desc: "!!!کاربر غیرفعال است",
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
        }else if(response.data.toString() == "User Exist!"){
          //Navigator.pop(context);
          CreatePanelReportLogin();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>
              new Directionality(textDirection: TextDirection.rtl, child: Home(UserNameTextBox.text))),(Route<dynamic> route) => false);
        }else{
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