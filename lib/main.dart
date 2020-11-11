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
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'Pages/AbouteUsList_Page.dart';
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
import 'Pages/Notification_Page.dart';
import 'Pages/LoginReport_Page.dart';
import 'Pages/PanelUsersInfo_Page.dart';
import 'Pages/PanelUsers_Page.dart';
import 'Pages/SendResponseTicket_Page.dart';
import 'Pages/UnauthorizedWords_Page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
      BouncingScrollWrapper.builder(context, widget),
      maxWidth: 4096,
      minWidth: 720,
      defaultScale: true,
      breakpoints: [
        ResponsiveBreakpoint.resize(1080, name: MOBILE),
        ResponsiveBreakpoint.resize(1920, name: MOBILE),
        ResponsiveBreakpoint.autoScale(1024, name: TABLET),
        ResponsiveBreakpoint.autoScale(1280, name: TABLET),
        ResponsiveBreakpoint.autoScale(1920, name: TABLET),
        ResponsiveBreakpoint.autoScale(2560, name: TABLET),
        ResponsiveBreakpoint.autoScale(800, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(900, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(1024, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(1280, name: DESKTOP),
        ResponsiveBreakpoint.resize(1366, name: DESKTOP),
        ResponsiveBreakpoint.resize(1440, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(1600, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(1920, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(2560, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(4096, name: DESKTOP),
      ]),
      title: 'جام کیو - پنل مدیریت',
      theme: ThemeData(
        primaryColor: Color(0xff2E0273),
        fontFamily: 'IRANSans',
        primaryIconTheme: IconThemeData(color: Colors.white),
        // ignore: deprecated_member_use
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
      ),
      initialRoute: "/Login_Page",
      routes: {
        "/Home_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Home.none()),
        "/Login_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Login()),
        "/Register_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Register.none()),
        "/ApplicationUsers_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: ApplicationUsers.none()),
        "/ApplicationUsersInfo_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: ApplicationUsersInfo.none()),
        "/PanelUsers_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: PanelUsers.none()),
        "/PanelUsersInfo_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: PanelUsersInfo.none()),
        "/LoginReport_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: LoginReport.none()),
        "/Transactions_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Transactions.none()),
        "/Advertises_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Advertises.none()),
        "/AdvertisesInfo_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: AdvertisesInfo.none()),
        "/Tickets_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Tickets.none()),
        "/FullTextTicket_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: FullTextTicket.none()),
        "/SendResponseTicket_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: SendResponseTicket.none()),
        "/InviteLog_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: InviteLog.none()),
        "/Discount_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Discount.none()),
        "/CreateDiscount_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateDiscount.none()),
        "/CreateAdvertises_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateAdvertises.none()),
        "/EditDiscount_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditDiscount.none()),
        "/Notifications_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Notifications.none()),
        "/UnauthorizedWords_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: UnauthorizedWords.none()),
        "/CreateUnauthorizedWords_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateUnauthorizedWords.none()),
        "/AbouteUsList_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: AbouteUsList.none()),
        "/EditAbouteUs_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditAbouteUs.none()),
        "/ApplicationAvilability_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: ApplicationAvilability.none()),
        "/Access_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Access.none()),
        "/AccessList_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: AccessList.none()),
        "/AccessInfo_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: AccessInfo.none()),
        "/Questions_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Questions.none()),
        "/CreateQuestions_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateQuestion.none()),
        "/EditQuestion_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditQuestion.none()),
        "/CreateCategory_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateCategory.none()),
        "/QuestionsTypes_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: QuestionsTypes.none()),
        "/TournamentTypes_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: TournamentTypes.none()),
        "/OneVsOneTournament_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: OneVsOneTournament.none()),
        "/InAppItems_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: InAppItems.none()),
        "/Awards_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: Awards.none()),
        "/CreateAward_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: CreateAward.none()),
        "/EditAward_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: EditAward.none()),
        "/LiveTournament_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: LiveTournament.none()),
        "/LiveTournamentActive_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: LiveTournamentActive.none()),
        "/LiveType_Page" : (context) =>new Directionality(textDirection: TextDirection.rtl, child: LiveTypes.none()),
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