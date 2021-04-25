import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/fonts.dart';

import 'package:portfolio/constants/text_styles.dart';

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
            horizontal: (ScreenUtil.getInstance().setWidth(108))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(context),
          body: LayoutBuilder(builder: (context, constraints) {
            return _buildBody(context, constraints);
          }),
        ),
      ),
    );
  }

  //AppBar Function:-------------------------------------------------------------
  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions:
          !ResponsiveWidget.isSmallScreen(context) ? _buildActions() : null,
    );
  }

  List<Widget> _buildActions() {
    return null;
  }

  //Screen Function:-------------------------------------------------------------
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

  // Body Function:--------------------------------------------------------------
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
                  _buildSkillChip(context),
                ],
              )
            : _buildSkillsAndEducation(context),
        SizedBox(height: 25),
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
      'Full Stack & Mobile App Developer',
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
}
// Skills Function:------------------------------------------------------------

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
              buttonColor: Colors.blue[400],
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
              buttonColor: Colors.blue[400],
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
              buttonColor: Colors.blue[500],
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
              buttonColor: Colors.blue[500],
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
              buttonColor: Colors.blue[500],
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
              buttonColor: Colors.blue[500],
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
              buttonColor: Colors.blue[500],
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
              buttonColor: Colors.blue[500],
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
              buttonColor: Colors.blue[500],
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
              buttonColor: Colors.blue[600],
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
              buttonColor: Colors.blue[600],
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
              buttonColor: Colors.blue[600],
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
              buttonColor: Colors.blue[600],
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

// Education Function:---------------------------------------------------------

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
  return Container(
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                html.window.open("https://youtu.be/FWPflzSKcI0", "YouTube");
              },
              child: Image.network(Assets.skip, width: 130.0, height: 200),
            ),
            GestureDetector(
              onTap: () {
                html.window.open("https://youtu.be/9X3xZlenk-w", "YouTube");
              },
              child: Image.network(Assets.budget, width: 130.0, height: 200),
            ),
            GestureDetector(
              onTap: () {
                html.window.open("https://youtu.be/31G2XiN5Mrc", "YouTube");
              },
              child: Image.network(Assets.qweather, width: 130.0, height: 200),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                html.window.open("http://vancotravel.ca", "Website");
              },
              child: Image.network(Assets.vanco, width: 190.0, height: 200),
            ),
            SizedBox(width: 20.0),
            GestureDetector(
              onTap: () {
                html.window.open("https://youtu.be/V9Dkj-zTumU", "YouTube");
              },
              child: Image.network(Assets.chak, width: 190.0, height: 200),
            ),
          ],
        ),
      ],
    ),
  );
}

// Footer Function:------------------------------------------------------------
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
    '© 2021.',
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
          Assets.github,
          color: Color(0xFF45405B),
          height: 20.0,
          width: 20.0,
        ),
      ),
      SizedBox(width: 16.0),
    ],
  );
}
