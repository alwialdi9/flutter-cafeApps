part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kuliner Nenek",
                        style: blackFontStyle22.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Cobain dulu aja!",
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              // image: AssetImage('assets/person_img.jpg'),
                              image: NetworkImage((context
                                      .read<UserCubit>()
                                      .state as UserLoaded)
                                  .user
                                  .picturePath),
                              fit: BoxFit.cover))),
                ],
              ),
            ),
            // LIST FOOD
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) => (state is FoodLoaded) ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: state.foods
                            .map((food) => Padding(
                                  padding: EdgeInsets.only(
                                      left: (food == mockFoods.first)
                                          ? defaultMargin
                                          : 0,
                                      right: defaultMargin),
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => FoodDetailsPage(
                                            transaction: Transaction(
                                                food: food,
                                                user: (context
                                                        .read<UserCubit>()
                                                        .state as UserLoaded)
                                                    .user),
                                            onBackButtonPressed: () {
                                              Get.back();
                                            }));
                                      },
                                      child: FoodCard(food: food)),
                                ))
                            .toList(),
                      )
                    ],
                  ) : Center(child: loadingIndicator),
              ),
            ),
            // LIST FOOD VERTICAL
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabbar(
                      selectedIndex: selectedIndex,
                      titles: const ["New Taste", "Popular", "Recomended"],
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      }),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                    if (state is FoodLoaded){List<Food> foods = state.foods.where((element) => element.types.contains(
                      (selectedIndex == 0)
                        ? FoodType.new_food
                        : (selectedIndex == 1)
                            ? FoodType.popular
                            : FoodType.recommended
                    )).toList();

                    return Column(
                      children: foods
                          .map((food) => Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    defaultMargin, 0, defaultMargin, 16),
                                child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => FoodDetailsPage(
                                          transaction: Transaction(
                                              food: food,
                                              user: (context
                                                      .read<UserCubit>()
                                                      .state as UserLoaded)
                                                  .user),
                                          onBackButtonPressed: () {
                                            Get.back();
                                          }));
                                    },
                                    child: FoodListItem(
                                        food: food, itemWidth: listItemWidth)),
                              ))
                          .toList(),
                    );}else{
                      return Center(child: loadingIndicator,);
                    }
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        )
      ],
    );
  }
}
