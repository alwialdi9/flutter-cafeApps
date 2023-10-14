part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  final Transaction transaction;
  final int quantity;
  final int total;
  final Function onBackButtonPressed;

  const PaymentPage({super.key, required this.transaction, required this.quantity, required this.total, required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Payment",
      subtitle: "Check your transaction again",
      onBackButtonPressed: () {
        onBackButtonPressed();
      },
      backColor: "FAFAFC".toColor(),
      child: Column(
        children: [
          //bagian atas
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Item Ordered', style: blackFontStyle14,),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(image: NetworkImage(transaction.food!.picturePath), fit: BoxFit.cover)
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 198, //jarak border + lebar gbr + jarak pic ke title + lebar jumlah
                              child: Text(transaction.food!.name, style: blackFontStyle14, maxLines: 1, overflow: TextOverflow.clip,)),
                            Text(NumberFormat.currency(locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0).format(transaction.food!.price), style: greyFontStyle,)
                          ],
                        ),
                      ],
                    ),
                    Text('${transaction.quantity} items', style: greyFontStyle.copyWith(fontSize: 13),)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text('Details Transaction', style: blackFontStyle14,)
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(transaction.food!.name, style: greyFontStyle,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(NumberFormat.currency(locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0).format(quantity * transaction.food!.price), style: blackFontStyle14, textAlign: TextAlign.right,),
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text('Driver', style: greyFontStyle,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(NumberFormat.currency(locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0).format(50000), style: blackFontStyle14, textAlign: TextAlign.right,),
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text('Tax 10%', style: greyFontStyle,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(NumberFormat.currency(locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0).format((quantity * transaction.food!.price) * 0.1), style: blackFontStyle14, textAlign: TextAlign.right,),
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text('Total Price', style: greyFontStyle,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(NumberFormat.currency(locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0).format((transaction.food!.price*quantity*1.1).round() + 50000), style: blackFontStyle14.copyWith(fontWeight: FontWeight.w500, color: '1ABC9C'.toColor()), textAlign: TextAlign.right,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, bottom: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('Deliver to:'),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text('Name', style: greyFontStyle,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(mockuser.name, style: blackFontStyle14, textAlign: TextAlign.right,),
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text('Phone No. ', style: greyFontStyle,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(mockuser.phoneNumber, style: blackFontStyle14, textAlign: TextAlign.right,),
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text('Address', style: greyFontStyle,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(mockuser.address, style: blackFontStyle14, textAlign: TextAlign.right,),
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text('House No. ', style: greyFontStyle,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(mockuser.houseNumber, style: blackFontStyle14, textAlign: TextAlign.right,),
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text('City', style: greyFontStyle,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(mockuser.city, style: blackFontStyle14, textAlign: TextAlign.right,),
                    ),
                  ],
                ),
                SizedBox(height: 6,)
              ],
              ),
          )
        ],
      ),
    );
  }
}