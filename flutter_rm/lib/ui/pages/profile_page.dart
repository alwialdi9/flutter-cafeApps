part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  List<String> account = ["Edit Profile", "Home Address", "Security", "Payments"];
  List<String> foodMarket = ["Rate App", "Help Center", "Privacy & Policy", "Terms & Conditions"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: defaultMargin),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                width: 110,
                height: 110,
                margin: const EdgeInsets.only(top: 26),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/photo_border.png')
                    )
                  ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage((context.read<UserCubit>().state as UserLoaded).user.picturePath), 
                      fit: BoxFit.cover)
                  ),
                ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 14),
                child: Text(
                  (context.read<UserCubit>().state as UserLoaded).user.name, style: blackFontStyle22.copyWith(fontWeight: FontWeight.bold, fontSize: 20), maxLines: 1, overflow: TextOverflow.clip
                  )
                )
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 8, bottom: defaultMargin),
                child: Text(
                  (context.read<UserCubit>().state as UserLoaded).user.email, style: greyFontStyle.copyWith(fontSize: 18), maxLines: 1, overflow: TextOverflow.clip
                  )
                )
            )
          ]),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: defaultMargin),
          padding: EdgeInsets.only(bottom: defaultMargin),
          child: Column(
            children: [
              CustomTabbar(selectedIndex: selectedIndex, titles: ["Account", "FoodMarket"], onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              }),
              Column(
                children: (selectedIndex == 0 ? account : foodMarket).map((menu) => ProfileListItem(menu: menu)).toList()
              )
            ]
          ),
        )
      ],
    );
  }
}