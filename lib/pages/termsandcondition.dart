import 'package:flutter/material.dart';
import 'package:gui/ResponsiveSize.dart';
import 'package:gui/pages/myappbar.dart';

class TermsandCondition extends StatefulWidget {
  @override
  _TermsandConditionState createState() => _TermsandConditionState();
}

class _TermsandConditionState extends State<TermsandCondition> {
  String para1 =
      'These terms and conditions of use ("Terms) along with privacy policy ("Privacy regulation policy")and content regulation policy ("Content Policy") forms a legally binding agreement ("Agreement”) between you and us ("Public", "Our", "We", "Us", "Our.';

  String para2 =
      "Hence, We insist that you read these Terms and Privacy Policy and let us know at " +
          " bhramrsearchingfortruth@gmail.com if you have any questions regarding the " +
          "same. We will try Our Best to answer your queries";

  String para3 =
      "IF You downloads Our App from Google Play, You will also be subject to Google" +
          "play Terms of service and If there is any conflict between those Terms of Service " +
          "and this Agreement with respect to Your use of the App. then, this Agreement shall " +
          "prevail.";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: myAppBar(context),
      body: Container(
        width: Styling.deviceWidth,
        height: Styling.deviceHeight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Terms and Conditions',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  para1,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  para2,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  para3,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'A. DEFINITIONS AND INTERPRETATION',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '1- Capitalized terms, not defined elsewhere in this Agreement, shall mean as follows:'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'a. "App means the android mobile platform downloadable from Google Play Store and owned by Us, including any updates thereof.'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'b.	"Google Play" means the service provided by Google Ireland Limited, a third-party Person, located at Gordon House, Barrow Street, Dublin 4, Ireland and/or its affiliates, which You may use to download the App.'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'c.	"Google Play Terms of Service" means terms of service that apply to the use of Google Play and available at https://play.google.com/about/play-terms.html.'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'd.	Person" shall mean any natural person, limited or unlimited liability company , corporation, partnership (whether limited or unlimited), proprietorship, Hindu undivided  family, trust, union, association, government or any agency or political subdivision  thereof or any other entity that may be treated as a person under applicable laws .'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'e.	Sponsored Content means content distinct from other regular editorial content Displayed on the App. in the form of audio, video, text and/or images media which supports a third party Person\'s brand message or views that is readily identifiable upfront through distinct and distinguishable font, color, display schemes and/or usage of disclaiming words other than those used for regular editorial content. "Powered by "Sponsored by". "With", Advertorial and such meaning)'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'f.	Sponsored Content Partner" means a User engaged with Us for Display of Sponsored Content on the App.'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'g- \'User\' or \"You or \"Your\' refers to any Person who has accepted this agreement to download and/or use  the App.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '2.  Any reference to the singular nouns a reference to the plural and Vice versa , and any references to one gender regulations to other gender , unless explicitly provided for.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '3.	Heading and captions  are used for convenience only and not for interpretation of the Agreement'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '4.	Any reference to a natural person shall, include his/her heirs, executors and permitted assignees and any reference to a juristic person shall , include its affiliates successors and permitted assignees unless repugnant to the context.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'B.	USERS APPROVAL',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('1.	Users  approve of and accept this Agreement by:'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'a.	downloading and/or installing the App on Your device : or'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'b.	accessing or using the App or any of the content available  within the App from any  device. Or'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2.	Users  approve of and accept this Agreement only if :'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'a.	If such user is a natural Person. Is of the legal age, eligibility and mental capacity to form a binding contract with us.'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'b.	if such  User is a juristic Person, is lawfully existing and has all the authorizations, permits and allowances to enter into this Agreement and form a binding contract.'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'c.	such User is not legally banned or restricted from using the App.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('3.	You understand that we want You to not  Use the App if You do not understand , approve of or accept all  the terms specified in this Agreement. Hence. You are requested to read this Terms  and Privacy Policy Carefully and understand he Agreement before You accept it and agree to be bound by it.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('4.	The Agreement shall give the relationship of each User with Us. However,we may also  execute separate written  agreements with any User In any  case of conflict between terms of such seperate writen agreement and this Agreement, the terms of the separate written agreement shall prevail.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'C.	PROVISION OF THE APP',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('1.	The App a designed to provide You an in-app browsing exercise through an embedded browser .The App is per se a platform which host  news by Third Pates. The App does not  Host display or Transmit any content owned by  third parties on its servers, unless We either have a license or not prohinted under applicable laws.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2.	You agree and acknowledge that we may pursuant to Our engagement with certain Sponsored  Content Partners, plane certain Sponsored Content on about or in conjunction with the other  content  wihin the App'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('3.	In order to provide the App to You. We may request You to register and/or provide information  about yourself . We trust that any information provided by You will always be true ,accurate, complete and unstated.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('4.	You agree that you are responsible for all data charges. You incur Through use of the App.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'D.	YOUR AGREEMENT WITH US',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('1.	A violation of this Agreement may result in a legal liability upon You and that nothing in this Agreement should be construed to confer any rights to any third party or Person . you are  responsible for Your content conduct and activities while using the App , and for any  consequences thereof.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2.	If any provision of the Agreement is found to be enforceable under applicable law it will not affect the enforceability of the other provisions of this Agreement. If any provision of this Agreement is held to be invalid or unenforceable, such provision shall be deemed superseded by a valid enforceable provision that most closely matches the intent of and the remaining provisions shall be enforced.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('3.	We may choose to not act with respect to a breach of this Agreement by you and others but this does not mean that We cannot act with respect to subsequent or similar breaches our intended  or unintended failure to exercise or enforce any provision of this Agreement shall not constitute a waiver of such right or provision.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'E.	USING THE APP',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('1.	You will download and install the App from Google Play for using it. You will also download in order to bring the relevant latest version of the App and any relevant updates provided nt BHRAMAR to continued access to the App.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2.	Please note that you are currently using a beta version of the App. We are constantly evolving in order  to bring the best possible content and information to you. You acknowledge and agree that you are a  beta-testing user and we reserve the right to modify/alter any or all products or Services available on  the App at any time without notice. Any feedback, comments, or suggestions. You may provide about on the App is entirely voluntary, and We shall be free to use such feedback, comments or suggestions as We see fit and without any obligation to you.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('3.	You agree that we may provide notice to you of the availability of any upgrades or updates to the App and automatically push such upgrade or  to your device or computer from time-to-time. You may  be required to install certain upgrades or updates to the software in order to continue to access or use  the App, or portions thereof { including upgrade or updates designed to correct issues with the App}. Any updates or upgrades to the App may be accompanied with Corresponding revisions to these .'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('4.	While the App is available to You  Free of Cost, We may amend these terms and impose a cost on the App in future We may at our sole Discretion  choose to provide you with a prior notice in the regards. '),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'F.	RESTRICTIONS ON YOUR USE',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('1.	You will not use the App, or any content provided thereof for any purpose that is illegal, unlawful or prohibited by this Agreement.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2.	You will not access (or attempt to access) the app and/or the content provide through the app by any means other than through the App, unless You have been specifical in a separate written agreement with Us.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('3.	You will not redistribute, sublicense, rent, publish, sell, assign, lease, market,tranfer or otherwise make the App or any component or content there of, available to the third parties.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('4.	You will not circumvent or disable any digital rights management, usage rules,or other security features of App: remove, alter, or obscure any proprietary notices (including copyright notices) on any portion of the App; and not use the App in a manner that threatens the integrity, performance, or availability of the App.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('5.	You will not attempt to or engage in any activity that may:'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'A- Reverse engineer, decompile or otherwise extract the source code related to the app or any part thereof, unless it is expressly permitted by Us to You in writing or is  by the applicable law:'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'B- Use any robot, spider, retrieval application, or other device to ret portion of the App or content thereof;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'C- Collect information about Users for any illegal or unlawful purpose;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'D- Create any User accounts by automated means or under false or fraudulent pretenses for using the App;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'E- Transmit any viruses, worms, defects, trojan horses, or any items of a destructive nature through the App:'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'F- use the App in any manner that could damage, disable, overburden,or impair,or  undertake any action which is harmful or potentially harmful to, any of the servers,a networks, computer systems or resources connected to any of the servers connected, any of the s directly or indirectly to the App, or interfere with any other third party person\'s use and enjoyment of the App:'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'G- carry out any denial of service (DoS, DDoS) or any other harmful attacks on the app or; disrupt or place unreasonable burdens or excessive loads on, or interfere with or attempt to make,or attempt any unauthorized access to the app or any part of the app or any user of the app.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Threatens the unity, integrity, defence, security or sovereignty of India, friendly relations  with foreign states, or public order or causes incitement to the commission of any cognisable offence or prevents investigation of any offence or is insulting any other nation. Reporting viaolation and content takedown.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('If You find any content on the App which falls under any of the prohibited categories of content listed in section G(7) above . You can inform us of such violation of these Terms by writing to us contact bhramrsearchingfortruth@gmail.com '),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'a.	A screenshot or sharing the ink of the infringing post and'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'b.	Your reasons for objections to se content'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2.	Your reports of Violation of these Terms will be received and processed within reasonable time by Our Content Moderation Team'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('3.	We will respond to Your reports of violations within soon as possible by'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'a.	Taking down such violating content: or'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'b.	Suspension/ blocking  of the violating users access to the App.'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'c.	Termination of the violating users access  to the app'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('4.	Our Content Moderation Teams assessment of any complaints relating to content shared on the app be limited to whether such content violates these Terms or Own internal policies and Guidelines Such a decision will be final and binding as a regards content on the App.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'H.	TERMINATION',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('1.	Your  Access  to the App may be terminated if :'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'a.	You voluntarily  uninstall the App from Your device;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    'b.	You knowingly or unknowingly cause direct or indirect breach, as ascertained by us of  these Terms or Privacy Policy as a whole or whole in a part'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2.	We may terminate this  Agreement at any time with or without notice and may procure disabling  Your access  to App and/or barring You from any future use of the App.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('3.	You may terminate this Agreement at any time by Terminating your access  to the App However , Your  certain obligations under this Agreement shall continue to prevail even on such termination.'),
              ),
              
            ],
          ),
        ),
      ),
    ));
  }
}
