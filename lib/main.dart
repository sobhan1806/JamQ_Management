import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaam_q/Pages/AccessInfo_Page.dart';
import 'package:jaam_q/Pages/AccessList_Page.dart';
import 'package:jaam_q/Pages/Access_Page.dart';
import 'package:jaam_q/Pages/Advertises_Page.dart';
import 'package:jaam_q/Pages/ApplicationAvilability_Page.dart';
import 'package:jaam_q/Pages/ApplicationUsers_Page.dart';
import 'package:jaam_q/Pages/Awards_Page.dart';
import 'package:jaam_q/Pages/CreateAdvertises_Page.dart';
import 'package:jaam_q/Pages/CreateAward_Page.dart';
import 'package:jaam_q/Pages/CreateCategory_Page.dart';
import 'package:jaam_q/Pages/CreateLiveQuestions_Page.dart';
import 'package:jaam_q/Pages/CreateQuestion_Page.dart';
import 'package:jaam_q/Pages/EditAward_Page.dart';
import 'package:jaam_q/Pages/EditLiveQuestion_Page.dart';
import 'package:jaam_q/Pages/EditOtherApps_Page.dart';
import 'package:jaam_q/Pages/EditQuestion_Page.dart';
import 'package:jaam_q/Pages/InAppItems.dart';
import 'package:jaam_q/Pages/InviteLog_Page.dart';
import 'package:jaam_q/Pages/LiveManagement_Page.dart';
import 'package:jaam_q/Pages/LiveTournamentActive_Page.dart';
import 'package:jaam_q/Pages/LiveType_Page.dart';
import 'package:jaam_q/Pages/Login_Page.dart';
import 'package:jaam_q/Pages/OneVsOneTournament_Page.dart';
import 'package:jaam_q/Pages/QuestionsTypes_Page.dart';
import 'package:jaam_q/Pages/Questions_Page.dart';
import 'package:jaam_q/Pages/Register_Page.dart';
import 'package:jaam_q/Pages/Tickets_Page.dart';
import 'package:jaam_q/Pages/TournamentTypes_Page.dart';
import 'package:jaam_q/Pages/Transactions_Page.dart';
import 'Pages/AbouteUsList_Page.dart';
import 'Pages/AbouteUs_Page.dart';
import 'Pages/AdvertisesInfo_Page.dart';
import 'Pages/ApplicationUsersInfo_Page.dart';
import 'Pages/CreateDiscount_Page.dart';
import 'Pages/CreateLiveMatch_Page.dart';
import 'Pages/CreateUnauthorizedWords_Page.dart';
import 'Pages/Discount_Page.dart';
import 'Pages/EditAbouteUs_Page.dart';
import 'Pages/EditDiscount_Page.dart';
import 'Pages/FullTextTicket_Page.dart';
import 'Pages/Home_Page.dart';
import 'Pages/LiveQuestions_Page.dart';
import 'Pages/LiveTournament_Page.dart';
import 'Pages/LoginToAppLog_Page.dart';
import 'Pages/Notification_Page.dart';
import 'Pages/OtherAppsList_Page.dart';
import 'Pages/OtherApps_Page.dart';
import 'Pages/PanelReportLogin_Page.dart';
import 'Pages/PanelUsersInfo_Page.dart';
import 'Pages/PanelUsers_Page.dart';
import 'Pages/SendResponseTicket_Page.dart';
import 'Pages/UnauthorizedWords_Page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'جام کیو - پنل مدیریت',
      theme: ThemeData(
        primaryColor: Color(0xff2E0273),
        fontFamily: 'IRANSans',
        primaryIconTheme: IconThemeData(color: Colors.white),
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
      ),
      initialRoute: "/LiveType_Page",
      routes: {
        "/Home_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Home()),
        "/Login_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Login()),
        "/Register_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Register()),
        "/ApplicationUsers_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: ApplicationUsers()),
        "/ApplicationUsersInfo_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: ApplicationUsersInfo.none()),
        "/PanelUsers_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: PanelUsers()),
        "/PanelUsersInfo_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: PanelUsersInfo.none()),
        "/PanelReportLogin_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: PanelReportLogin()),
        "/Transactions_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Transactions()),
        "/Advertises_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Advertises()),
        "/AdvertisesInfo_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: AdvertisesInfo.none()),
        "/Tickets_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Tickets()),
        "/FullTextTicket_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: FullTextTicket.none()),
        "/SendResponseTicket_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: SendResponseTicket.none()),
        "/InviteLog_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: InviteLog()),
        "/LoginToAppLog_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: LoginToAppLog()),
        "/Discount_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Discount()),
        "/CreateDiscount_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateDiscount()),
        "/CreateAdvertises_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateAdvertises()),
        "/EditDiscount_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditDiscount.none()),
        "/Notifications_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Notifications()),
        "/UnauthorizedWords_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: UnauthorizedWords()),
        "/CreateUnauthorizedWords_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateUnauthorizedWords()),
        "/OtherApps_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: OtherApps()),
        "/OtherAppsList_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: OtherAppsList()),
        "/EditOtherApps_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditOtherApps()),
        "/AbouteUs_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: AbouteUs()),
        "/AbouteUsList_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: AbouteUsList()),
        "/EditAbouteUs_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditAbouteUs.none()),
        "/ApplicationAvilability_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: ApplicationAvilability()),
        "/Access_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Access()),
        "/AccessList_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: AccessList()),
        "/AccessInfo_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: AccessInfo.none()),
        "/Questions_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Questions()),
        "/CreateQuestions_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateQuestion()),
        "/EditQuestion_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditQuestion.none()),
        "/CreateCategory_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateCategory()),
        "/QuestionsTypes_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: QuestionsTypes()),
        "/TournamentTypes_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: TournamentTypes()),
        "/OneVsOneTournament_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: OneVsOneTournament()),
        "/InAppItems_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: InAppItems()),
        "/Awards_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Awards()),
        "/CreateAward_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateAward()),
        "/EditAward_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditAward.none()),
        "/LiveTournament_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: LiveTournament()),
        "/LiveTournamentActive_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: LiveTournamentActive()),
        "/LiveType_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: LiveTypes()),
        "/CreateLiveMatch_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateLiveMatch.none()),
        "/CreateLiveQuestions_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateLiveQuestions.none()),
        "/LiveManagement_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: LiveManagement.none()),
        "/LiveQuestions_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: LiveQuestions.none()),
        "/EditLiveQuestions_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditLiveQuestions.none()),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}