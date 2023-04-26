const baseUrl = 
// 'https://crolaay-humble-enigma-q7v9grwg474cx649-8080.preview.app.github.dev';
"https://api.betahome.ng"; //live
// const baseUrl = "http://44.205.154.51:8080"; //test

class UrlHelper {
  static const sliders = "$baseUrl/sliders";
  static const register = "$baseUrl/register";
  static const login = "$baseUrl/login";
  static const profile = "$baseUrl/profile";
  static const password = "$baseUrl/password";
  static const packages = "$baseUrl/packages";
  static const market = "$baseUrl/market";
  static const listings = "$baseUrl/listings";
  static const my = "$baseUrl/my";
  static const services = "$baseUrl/services";
  static const service = "$baseUrl/service";
  static const transactions = "$baseUrl/transactions";
  static const orders = "$baseUrl/orders";
  static const checkoutPay = "$baseUrl/checkout/pay";
  static const setReferralCode = "$baseUrl/user/referral/code";
  static const joinBetaHelp = "$baseUrl/betahelp/join";
  static const payment = "$baseUrl/payment";
  static const bank = "$baseUrl/bank";
  
  //added this endpoint
  static const bankResolve = "$baseUrl/bank/account/resolve";
  static const homeExplore = "$baseUrl/home/explore";

  static const file = "$baseUrl/file";
}
