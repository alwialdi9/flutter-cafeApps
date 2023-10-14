part of 'pages.dart';

class FoodDetailsPage extends StatefulWidget {
  
  const FoodDetailsPage({super.key, required this.transaction, required this.onBackButtonPressed});
  final Function onBackButtonPressed;
  final Transaction transaction;

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: thirdColor,
          ),
          SafeArea(child: 
            Container(
              color: Colors.white,
            )
          ),
          SafeArea(child: 
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.transaction.food!.picturePath), fit: BoxFit.cover)
              ),
            )
          ),
          SafeArea(child: 
            ListView(
              children: [
                Column(
                  children: [
                    ///back button
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            if (widget.onBackButtonPressed != null) {
                              widget.onBackButtonPressed();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black12
                            ),
                            child: Image.asset("assets/back_arrow_white.png"),
                          ),
                        ),
                      ),
                    ),
                    ///body
                    Container(
                      margin: const EdgeInsets.only(top: 180),
                      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                        color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 134,
                                    child: Text(widget.transaction.food!.name, style: blackFontStyle16,)),
                                  const SizedBox(height: 6,),
                                  RatingStars(rate: widget.transaction.food!.rate)
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = max(1, quantity - 1);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(width: 1),
                                        image: const DecorationImage(image: AssetImage("assets/btn_min.png"))
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Text(quantity.toString(), style: blackFontStyle16, textAlign: TextAlign.center,),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity += 1;
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(width: 1),
                                        image: const DecorationImage(image: AssetImage("assets/btn_add.png"))
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(0, 14, 0, 16),
                            child: Text(widget.transaction.food!.description, style: greyFontStyle,),
                          ),
                          Text("Ingredients: ", style: blackFontStyle14,),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 4, 0, 41),
                            child: Text(widget.transaction.food!.ingredients, style: greyFontStyle,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total Price', style: greyFontStyle.copyWith(fontSize: 13),),
                                  Text(NumberFormat.currency(locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0).format(quantity*widget.transaction.food!.price), style: blackFontStyle16.copyWith(fontSize: 18),)
                                ],
                              ),
                              SizedBox(
                                width: 163,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => PaymentPage(transaction: widget.transaction.copyWith(quantity: quantity), quantity: quantity, total: quantity * widget.transaction.food!.price, onBackButtonPressed: () {
                                      Get.back();
                                    },));
                                  }, 
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: thirdColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    )
                                  ), 
                                  child: Text("Order Now", style: blackFontStyle14.copyWith(fontWeight: FontWeight.w700),),),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }
}