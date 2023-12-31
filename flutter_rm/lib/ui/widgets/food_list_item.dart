part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, required this.food, required this.itemWidth});

  final Food food;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: NetworkImage(food!.picturePath), fit: BoxFit.cover)
          ),
        ),
        SizedBox(
          width: itemWidth - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(food!.name, style: blackFontStyle16, maxLines: 1, overflow: TextOverflow.clip,),
              Text(NumberFormat.currency(
                symbol: 'IDR',
                decimalDigits: 0,
                locale: 'id-ID'
              ).format(food!.price), style: greyFontStyle.copyWith(fontSize: 13),)
            ],
          ),
        ),
        RatingStars(rate: food!.rate)
      ],
    );
  }
}