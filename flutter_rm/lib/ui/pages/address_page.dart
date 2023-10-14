part of 'pages.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String? _currentCity = null;

  @override
  Widget build(BuildContext context) {
  List<String> listitems = ["Tokyo", "London", "New York", "Sanghai", "Moscow", "Hong Kong"];
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController houseNumController = TextEditingController();
    
    return GeneralPage(
      title: 'Address',
      subtitle: 'Isi alamat yang valid',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text('Phone Number', style: blackFontStyle16),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Type your phone number"
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text('Address', style: blackFontStyle16),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Type your address"
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text('House Number', style: blackFontStyle16),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: houseNumController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Type your house number"
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text('City', style: blackFontStyle16),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)
            ),
            child: DropdownButton(
              isExpanded: true,
              underline: const SizedBox(),
              hint: const Text('Select Your City'),
              value: _currentCity,
              onChanged: (newValue) {
                setState(() {
                  _currentCity = newValue.toString();
                });
              },
              items: listitems.map((itemOne) {
                return DropdownMenuItem(
                  value: itemOne,
                  child: Text(itemOne, style: blackFontStyle14,)
                );
              }).toList()
              )
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 24),
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            // ignore: dead_code
            child: ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                elevation: 0, 
                backgroundColor: firstColor,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )
              ),
              child: Text("Sign Up Now", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
              ) ,
          ),
        ],
      ),
    );
  }
}
