import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/models/education.dart';
import 'package:portfolio/utils/screen/screen_utils.dart';
import 'package:portfolio/widgets/responsive_widget.dart';
import 'dart:html' as html;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF013a63),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (ScreenUtil.getInstance().setWidth(108))), //144
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(context),
          drawer: _buildDrawer(context),
          body: LayoutBuilder(builder: (context, constraints) {
            return _buildBody(context, constraints);
          }),
        ),
      ),
    );
  }

  //AppBar Methods:-------------------------------------------------------------
  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      // title: _buildTitle(),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions:
          !ResponsiveWidget.isSmallScreen(context) ? _buildActions() : null,
    );
  }

  // Widget _buildTitle() {
  //   return Image(
  //       image: NetworkImage(
  //           'https://www.pngfind.com/pngs/m/496-4969711_aa-logo-png-letter-a-logo-png-transparent.png'));
  // }

  List<Widget> _buildActions() {
    return null;
  }

  Widget _buildDrawer(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Drawer(
            child: ListView(
              padding: const EdgeInsets.all(20),
              // children: _buildActions(),
            ),
          )
        : null;
  }

  //Screen Methods:-------------------------------------------------------------
  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
        child: ResponsiveWidget(
          largeScreen: _buildLargeScreen(context),
          mediumScreen: _buildMediumScreen(context),
          smallScreen: _buildSmallScreen(context),
        ),
      ),
    );
  }

  Widget _buildLargeScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: _buildContent(context)),
                _buildIllustration(),
              ],
            ),
          ),
          _buildFooter(context)
        ],
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: _buildContent(context)),
              ],
            ),
          ),
          _buildFooter(context)
        ],
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(flex: 1, child: _buildContent(context)),
          Divider(),
          _buildCopyRightText(context),
          SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 0.0),
          _buildSocialIcons(),
          SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 0.0),
        ],
      ),
    );
  }

  // Body Methods:--------------------------------------------------------------
  Widget _buildIllustration() {
    return Image.network(
      Assets.programmer3,
      height: ScreenUtil.getInstance().setWidth(345), //480.0
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 0.0),
        _buildAboutMe(context),
        SizedBox(height: 4.0),
        _buildHeadline(context),
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 24.0),
        _buildSummary(),
        SizedBox(height: 40.0),
        _buildSkills(context),
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 14.0),
        ResponsiveWidget.isSmallScreen(context)
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // _buildSkills(context),
                  // SizedBox(height: 14.0),
                  // _buildProjects(context),
                  _buildSkillChip(context),
                ],
              )
            : _buildSkillsAndEducation(context),
        _buildProjects(context),
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 14.0),
        _buildProjectsChip(context),
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 14.0),
      ],
    );
  }

  Widget _buildAboutMe(BuildContext context) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        // style: TextStyle(
        //   fontSize: 48.0,
        //   // color: Colors.red,
        // ),
        children: <TextSpan>[
          TextSpan(
            text: 'Hello World, I am ',
            style: TextStyles.heading.copyWith(
              fontFamily: Fonts.nexa_light,
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 36 : 45.0,
            ),
          ),
          TextSpan(
            text: 'Afshin',
            style: TextStyles.heading.copyWith(
              color: Color(0xFF50AFC0),
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 36 : 45.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline(BuildContext context) {
    return Text(
      'Web And Mobile App Developer',
      style: TextStyles.sub_heading,
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: EdgeInsets.only(right: 80.0),
      child: Text(
        '     I help designers, small agencies and businesses bring their ideas to life. I love playing around with Applications and hopefully creating something that makes people smile. I enjoy challenging myself with creative ideas.',
        style: TextStyles.body,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildSkillsAndEducation(BuildContext context) {
    return Expanded(
      child: _buildSkillChip(context),
    );
  }

  // Skills Methods:------------------------------------------------------------

}

Widget _buildSkills(BuildContext context) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(text: 'Skills', style: TextStyles.title),
      ],
    ),
  );
}

Widget _buildSkillChip(
  BuildContext context,
) {
  return Scrollbar(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ButtonTheme(
              minWidth: 90.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('DART'),
              ),
            ),
            SizedBox(width: 10.0),
            ButtonTheme(
              buttonColor: Color(0xFF013a80),
              minWidth: 90.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('FLUTTER'),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            ButtonTheme(
              buttonColor: Color(0xFF013a80),
              minWidth: 90.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('HTML'),
              ),
            ),
            SizedBox(width: 10.0),
            ButtonTheme(
              buttonColor: Color(0xFF023a90),
              minWidth: 70.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('CSS'),
              ),
            ),
            SizedBox(width: 10.0),
            ButtonTheme(
              buttonColor: Colors.red,
              minWidth: 70.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('BOOTSTRAP'),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            ButtonTheme(
              minWidth: 70.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('JAVASCRIPT'),
              ),
            ),
            SizedBox(width: 10.0),
            ButtonTheme(
              minWidth: 90.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('JQUERY'),
              ),
            ),
            SizedBox(width: 10.0),
            ButtonTheme(
              buttonColor: Colors.red,
              minWidth: 70.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('REACT'),
              ),
            ),
            SizedBox(width: 10.0),
            ButtonTheme(
              buttonColor: Colors.red,
              minWidth: 70.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('NODE'),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            ButtonTheme(
              minWidth: 90.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('MONGODB'),
              ),
            ),
            SizedBox(width: 10.0),
            ButtonTheme(
              minWidth: 90.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('FIREBASE'),
              ),
            ),
            SizedBox(width: 10.0),
            ButtonTheme(
              buttonColor: Colors.red,
              minWidth: 70.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('GIT'),
              ),
            ),
            SizedBox(width: 10.0),
            ButtonTheme(
              buttonColor: Colors.red,
              minWidth: 70.0,
              height: 10.0,
              child: RaisedButton(
                textColor: Colors.white,
                onPressed: () {},
                child: Text('GITHUB'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// Education Methods:---------------------------------------------------------

// Widget _buildEducation() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       _buildEducationContainerHeading(),
//       _buildEducationSummary(),
//       SizedBox(height: 8.0),
//       _buildEducationTimeline(),
//     ],
//   );
// }

// Widget _buildEducationContainerHeading() {
//   return Text(
//     Strings.experience,
//     style: TextStyles.sub_heading,
//   );
// }

// Widget _buildEducationSummary() {
//   return Text(
//     'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
//     style: TextStyles.body,
//   );
// }

// Widget _buildEducationTimeline() {
//   final List<Widget> widgets =
//       educationList.map((education) => _buildEducationTile(education)).toList();
//   return Column(children: widgets);
// }

// Widget _buildEducationTile(Education education) {
//   return Padding(
//     padding: EdgeInsets.symmetric(vertical: 8.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Text(
//           '${education.post}',
//           style: TextStyles.company,
//         ),
//         Text(
//           '${education.organization}',
//           style: TextStyles.body.copyWith(
//             color: Color(0xFF45405B),
//           ),
//         ),
//         Text(
//           '${education.from}-${education.to}',
//           style: TextStyles.body,
//         ),
//       ],
//     ),
//   );
// }
Widget _buildProjects(BuildContext context) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(text: 'Projects', style: TextStyles.title),
      ],
    ),
  );
}

Widget _buildProjectsChip(
  BuildContext context,
) {
  return Row(
    children: <Widget>[
      Center(child: Image.network(Assets.vanco, width: 190.0, height: 200)),
      SizedBox(width: 15.0),
      Center(
        child: Image.network(Assets.chak, width: 190.0, height: 200),
      ),
    ],
  );
}

// Footer Methods:------------------------------------------------------------
Widget _buildFooter(BuildContext context) {
  return Column(
    children: <Widget>[
      Divider(),
      Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              child: _buildCopyRightText(context),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: _buildSocialIcons(),
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildCopyRightText(BuildContext context) {
  return Text(
    '© 2021 ALL RIGHTS RESERVED.',
    style: TextStyles.body1.copyWith(
      fontSize: ResponsiveWidget.isSmallScreen(context) ? 8 : 10.0,
    ),
  );
}

Widget _buildSocialIcons() {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      GestureDetector(
        onTap: () {
          html.window.open(
              "https://www.linkedin.com/in/afshin-choganian/", "LinkedIn");
        },
        child: Image.network(
          Assets.linkedin,
          color: Color(0xFF45405B),
          height: 20.0,
          width: 20.0,
        ),
      ),
      SizedBox(width: 16.0),
      SizedBox(width: 16.0),
      GestureDetector(
        onTap: () {
          html.window.open("https://github.com/afshin1992", "Github");
        },
        child: Image.network(
          Assets.google,
          color: Color(0xFF45405B),
          height: 20.0,
          width: 20.0,
        ),
      ),
      SizedBox(width: 16.0),
    ],
  );
}
