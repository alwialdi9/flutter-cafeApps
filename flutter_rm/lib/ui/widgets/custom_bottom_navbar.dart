part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key, this.selectedIndex = 0, required this.onTap});
  final int selectedIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if(onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: 36, height: 36,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/ic_home${(selectedIndex == 0) ? '.png' : '_normal.png'}'), fit: BoxFit.contain),
              )
            ),
          ),
          GestureDetector(
            onTap: () {
              if(onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: 36, height: 36,
              margin: EdgeInsets.symmetric(horizontal: 83),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/ic_order${(selectedIndex == 1) ? '.png' : '_normal.png'}'), fit: BoxFit.contain),
              )
            ),
          ),
          GestureDetector(
            onTap: () {
              if(onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: 36, height: 36,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/ic_profile${(selectedIndex == 2) ? '.png' : '_normal.png'}'), fit: BoxFit.contain),
              )
            ),
          )
        ],
      ),
    );
  }
}