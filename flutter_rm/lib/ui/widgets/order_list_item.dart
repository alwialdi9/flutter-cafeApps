part of 'widgets.dart';

// ignore: must_be_immutable
class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;
  int? selectedIndex = 0;
  OrderListItem({super.key, required this.transaction, required this.itemWidth, this.selectedIndex});

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
            image: DecorationImage(
              image: NetworkImage(transaction.food!.picturePath),
              fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182, //60 + 12 + 110
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transaction.food!.name, style: blackFontStyle16, maxLines: 1, overflow: TextOverflow.clip,),
                  Text('${transaction.quantity} items ﹒ ${NumberFormat.currency(
                    symbol: 'IDR',
                    decimalDigits: 0,
                    locale: 'id-ID'
                  ).format(transaction.total)}', style: greyFontStyle.copyWith(fontSize: 13),)
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(convertDateTime(transaction.dateTime!), style: greyFontStyle,),
              transaction.status == TransactionStatus.cancelled ? Text(
                'Cancelled', style: GoogleFonts.poppins(color: 'D9435E'.toColor(), fontSize: 12)
                ) : transaction.status == TransactionStatus.on_delivery ? Text('On Delivery', style: GoogleFonts.poppins(color: '1ABC9C'.toColor(), fontSize: 12),) : SizedBox()
            ],
          ),
        )
      ],
    );
  }

  String convertDateTime(DateTime dateTime) {
    List months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    int month = dateTime.month - 1;
    return months[month] + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}