part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    return GeneralPage(
      title: 'Sign Up',
      subtitle: 'Register ke dunia kuliner',
      onBackButtonPressed: () {
        Get.back();
      },
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/photo.png"), 
                  fit: BoxFit.cover)
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text('Your Name', style: blackFontStyle16),
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
              controller: nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Type your name"
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text('Email Address', style: blackFontStyle16),
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
              controller: emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Type your email address"
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text('Password', style: blackFontStyle16),
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
              controller: passwordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Type your password"
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 24),
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            // ignore: dead_code
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const AddressPage());
              }, 
              style: ElevatedButton.styleFrom(
                elevation: 0, 
                backgroundColor: firstColor,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )
              ),
              child: Text("Continue", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
              ) ,
          ),
        ],
      ),
    );
  }
}
