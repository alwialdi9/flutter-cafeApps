part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picturePath;
  final String buttonTitle1;
  final String? buttonTitle2;
  final Function() buttonTap1;
  final Function()? buttonTap2;

  IllustrationPage({required this.title, required this.subtitle, required this.picturePath, required this.buttonTitle1, this.buttonTitle2, required this.buttonTap1, this.buttonTap2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(picturePath))
            ),
          ),
          Text(title, style: blackFontStyle14.copyWith(fontSize: 20)),
          Text(subtitle, style: greyFontStyle.copyWith(fontWeight: FontWeight.w300), textAlign: TextAlign.center),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 12),
            width: 200,
            height: 45,
            child: ElevatedButton(
              onPressed: buttonTap1, 
              child: Text(buttonTitle1, style: blackFontStyle14.copyWith(fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
              ),
            ),
          ),
          (buttonTap2 == null) ? SizedBox() : 
          SizedBox(
            width: 200,
            height: 45,
            child: ElevatedButton(
              onPressed: buttonTap2, 
              child: Text(buttonTitle2!, style: blackFontStyle14.copyWith(fontWeight: FontWeight.w500, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: '8D92A3'.toColor(),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
              ),
            ),
          )
        ],
      ),
    );
  }
}