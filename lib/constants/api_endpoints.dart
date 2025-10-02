class ApiEndpoints {
  // static const baseApiURL = 'https://apistreetspot.myftp.org/v1/api';

  static const baseApiURL = 'http://31.220.31.37:3000/v1/api';

  static const signup = '$baseApiURL/auth/sign-up';
  static const login = '$baseApiURL/auth/sign-in';

  static const forgotPassword = '$baseApiURL/auth/forgot-password';

  static const  resetPassword = '$baseApiURL/auth/reset-password';


  static const  truckInformation = '$baseApiURL/truck-information/handler';

   static const  dashboard = '$baseApiURL/truck-information/dashboard?menu_items_limit=10';
   static const  logout = '$baseApiURL/auth/logout';

 
   static const  creatMenu = '$baseApiURL/menu/item/';

   static const  categories = '$baseApiURL/category';

   static const  image = '$baseApiURL/uploads/';


  static const  truckInformationPage = '$baseApiURL/truck-information/id';
   static const  truckInformationDashboard = '$baseApiURL/truck-information/customer-dashboard?limit=10&filtration=';

   static const  createOrder = '$baseApiURL/orders/create';

static const  orders = '$baseApiURL/orders/all';

  static String acceptOrder(int id) => "$baseApiURL/orders/accept-order/$id";

}

