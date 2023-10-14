part of 'widgets.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({super.key, required this.selectedIndex, required this.titles, required this.onTap});

  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            color: "F2F2F2".toColor(),
          ),
          Row(
            children: titles.map((title) => Padding(padding: EdgeInsets.only(left: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              GestureDetector(
                onTap: () {
                  if(onTap != null) {
                    onTap(titles.indexOf(title));
                  }
                },
                child: Text(title, style: (titles.indexOf(title) == selectedIndex) ? blackFontStyle14.copyWith(fontWeight: FontWeight.w500) : greyFontStyle)),
              Container(
                width: 40,
                height: 3,
                margin: EdgeInsets.only(top: 13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.5),
                  color: (titles.indexOf(title) == selectedIndex) ? "020202".toColor() : Colors.transparent
                ),
              )
            ]),
            )).toList(),
          )
        ]
        ),
    );
  }
}