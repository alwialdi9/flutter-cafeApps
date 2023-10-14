part of 'widgets.dart';

class ProfileListItem extends StatelessWidget {
  final String menu;
  const ProfileListItem({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.only(top: 16),
                child: Padding(
                  padding: const EdgeInsets.only(left: defaultMargin, right: defaultMargin),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(menu, style: blackFontStyle16,),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey)
                    ],
                  ),
                ),
              );
  }
}