part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign In',
      subtitle: 'Jelajahi dan Rasakan dunia kuliner',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/coffe_logo.png"))
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
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
            child: isLoading ? loadingIndicator : ElevatedButton(
              onPressed: () async{
                setState(() {
                  isLoading = true;
                });

                await context.read<UserCubit>().signIn(emailController.text, passwordController.text);
                UserState state = context.read<UserCubit>().state;

                if(state is UserLoaded){
                  context.read<FoodCubit>().getFoods();
                  context.read<TransactionCubit>().getTransactions();
                  Get.to(() => MainPage());
                }else{
                  Get.snackbar("", "", 
                    backgroundColor: "D9435E".toColor(), 
                    icon: Icon(MdiIcons.closeCircleOutline, color: Colors.white,), 
                    titleText: Text("Sign In Failed", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),),
                    messageText: Text((state as UserLoadingFailed).message, style: GoogleFonts.poppins(color: Colors.white)));
                  setState(() {
                    isLoading = false;
                  });
                }
              }, 
              style: ElevatedButton.styleFrom(
                elevation: 0, 
                backgroundColor: firstColor,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )
              ),
              child: Text("Sign In", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
              ) ,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 16),
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            // ignore: dead_code
            child: isLoading ? SpinKitFadingCircle(
              size: 45,
              color: mainColor,
            ) : ElevatedButton(
              onPressed: () {
                Get.to(() => const SignUpPage());
              }, 
              style: ElevatedButton.styleFrom(
                elevation: 0, 
                backgroundColor: secondColor,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )
              ),
              child: Text("Create New Account", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
              ) ,
          )
        ],
      ),
    );
  }
}
