import 'package:flutter/material.dart';
import 'package:gui/ResponsiveSize.dart';
import 'package:gui/pages/myappbar.dart';

class PrivacyPolicies extends StatefulWidget {
  @override
  _PrivacyPoliciesState createState() => _PrivacyPoliciesState();
}

class _PrivacyPoliciesState extends State<PrivacyPolicies> {
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
                    'Privacy Policies',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'I. INTELLECTUAL PROPERTY',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '1.	Your use of the App is, and at all times shall be, governed by and subject to the laws regarding copyright, trademark, patent, and trade secret ownership and use of intellectual property. You agree to abide by laws regarding copyright, trademark, patent, and secret ownership and use of intellectual property, and You shall be solely responsible for any violations of any laws and for any infringement of any intellectual property rights caused by Your use of the App through your device'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '2.	All trademarks, brands and service marks of the app are the property of us only. We own all the copyrights and database in relation to the app.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '3.	The App and underlying technology or software used in connection with the app may contain rights of us or our affiliates or any third-party persons. For use of any third-party person\'s intellectual proper. You may need to get permission directly from the owner of the intellectual property.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '4.	Any intellectual property which is not specifically mentioned to be owned by us is owned by their respective owners and the owners have a right to take appropriate actions against you for any violation, infringement or passing off.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'We respect the intellectual property rights of others and do not hold any responsibility for any violation of any intellectual property rights by you'),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'J. PRIVACY',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '1.	Our privacy policy explains how we treat your personal data and protect your privacy when you use the app. By using the app, you agree that we can use such data according to Privacy Policy.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '2.	You are responsible for maintaining the confidentiality of passwords associated with any device you use to access the app. accordingly, you are solely responsible for all activities that occur with your device. If you become aware of any unauthorized use of your device, you will notify the relevant authorities as soon as possible.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'K.	LIMITATIONS OF LIABILITY AND   INDEMNIFICATION',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '1.	Your use of the App, or any content, including video, available thereof is entirely at Your own option and risk and we shall be held harmless and not be liable for any direct, indirect, incidental, consequential, special, exemplary, punitive, monetary or any other damages, fees, fines, penalties, or liabilities whatsoever arising out of or relating to your use of the App or any content thereof, including video.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '2.	You may terminate your access to the App if you are not satisfied with the App.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '3.	You shall defend, indemnify and hold us, our officers, directors, employees, representatives and agents harmless from and against any claims, actions, demands, liabilities, judgments, and settlements, including without limitation, reasonable legal fee that may result from or alleged to result from (a) Your use of the App or any content thereof, including Mobile Video ; or (b) Your breach of any rules, regulations and/or orders under any applicable law'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '4.	You are also responsible for any breach of your obligations under the Agreement and /or for the consequences of any such breach'),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'L.	NO WARRANTY',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '1.	We shall make our best efforts to make the App available to you in the best possible manner. However, we disclaim all warranties in relation to the App, whether express or implied, including but not limited to'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(a)	any bugs and errors to this beta version of the App;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(b)	potential updates of this version of the App;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(c)	the App being constantly available or available at all;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(d)	installation or un-installation choices in relation to the App being successfully executed in all cases;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(e)	The App will always function without disruptions, delay or errors; (f).'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(f)		Your personal ability to use the App;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(g)	Your satisfaction with the use of App;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(h).	the accuracy of the data provided by the App; '),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(i).	the security and privacy of your data;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(j).	that all bugs or errors in relation to the App will be corrected;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(k).	that the App will be compatible with all devices and all networks; (l).	that the app is fit for the particular purpose or use;'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(m).	that the App and the contents thereof are accessible in every location; or '),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                    '(n).		that the App and the contents would be perpetually secure and not prone to breaches of security anywhere in the world.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '2.	We, Our officers, directors, employees, affiliates and agents and any other service provider responsible for providing access to the App in connection with this Agreement will not be liable for any acts or omissions, including of a third-party person, and including those vendors participating in our offerings made to you, or for any unauthorized interception of data or breaches of this Agreement attributable in part to the acts or omissions of third-parties persons, or for damages associated with us, or equipment that we do not furnish, or for damages that result from the operation systems, equipment, facilities or services provided by third-parties Persons that are interconnected with us.'),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'M.	GOVERNING LAW AND DISPUTE RESOLUTION',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '1.	The App may be controlled and operated through any country and may be subject to the laws of that country in which they are controlled and operated. If you use the App from any location, then, you are responsible for compliance with the local laws applicable to you.'),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '2.	This Agreement shall be governed by and shall be contrued on accordance with the law of India. All disputes relating to this Agreement shall be settled in the courts located in Delhi, India'),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '3.	You agree that any cause of actions arising out of your use of the App must be commenced within 3(three) months after the cause of action accrues. Otherwise, such cause of action shall be permanently barred'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'N.	NOTICES',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '1.	We may post notices within the App or send you notices on the e-mail address or the telephone number that you may have shared with us. You will have received such notices within 3 (three) days of us sending the notice. Your continued use of the App on expiry of such 3 (three) days shall constitute your receipt and acceptance of the notices sent to you'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'O.	DISCLAIMER',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '1. The contents provided through the App may include technical inaccuracies or typographical errors. Us may make changes or improvements to the App at any time. The contents or any information available on the App is provided "as is" and "as available" and without warranties of any kind either expressed or implied, to the fullest extent permissible pursuant to applicable law. Us does not warrant that the functions contained in the contents will be uninterrupted or error-free, that defects will be corrected, or the servers that make them available, are free of viruses or other harmful components. Us makes no commitment to update the materials on the interface. The above  exclusion of implied warranties. Us shall not be liable for any misuse or data theft as a consequence of your use of the App.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '2.	YOU EXPRESSLY REPRESENT AND WARRANT THAT YOU WILL NOT USE THE APP IF YOU DO NOT UNDERSTAND, AGREE TO BECOME A PARTY TO, AND ABIDE BY ALL THE TERMS SPECIFIED IN THIS AGREEMENT. ANY VIOLATION OF THIS AGREEMENT SHOULD BE CONSTRUED TO CONFER ANY RIGHTS TO ANY THIRD PARTY PERSONS OR ANY OTHER PERSON.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '3.	EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, WE DO NOT MAKE ANY REPRESENTATION OR WARRANTIES, EXPRESS OR IMPLIED INCLUDING WITHOUT LIMITATION OR WARRANTY REGARDING MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT, PERFORMANCE, RESULTS, OR ARISING FROM ANY COURSE OF DEALING OR USAGE OF TRADE OR IN RESPE OF ANY MOBILE  VIDEO  OR SPONSORED CONTENT. WE WILL NOT HAVE ANY LIABILITY OR RESPONSIBILITY TO ANY THIRD-PARTY VIDEO DEVELOPER OR SPONSORED CONTENT PARTNERS OR ANY OTHER PERSON WITH RESPECT TO ANY CLAIMS ARISING OUT OF OR IN CONNECTION WITH ANY SPONSORED CONTENT DISPLAYED ON OR IN CONNECTION WITH USAGE OF OUR APP.'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
