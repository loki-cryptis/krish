class EndPointsConstants {
  // API BASE URL
  // ============================== *********** ============================

  static const String BASE_URL = "http://13.236.182.211:8443/";

  // API End Points
  // ============================== *********** ============================

  static const String applicationJson = "application/json";

  // Post and get calls

  static const String LOGIN_API = "api/auth/login";
  static const String REGISTER_API = "api/auth/register";
  static const String FORGOT_PASSWORD_API = "api/auth/forgot-password";
  static const String GENERATE_OTP_API = "api/auth/generate-otp";
  static const String VALIDATE_OTP_API = "api/auth/validate-otp";
  static const String BANNERS_API = "api/lookup/banners";
  static const String BANNERS_SAVE_API = "api/consumer/save-seen-banners";
  static const String LANGUAGE_INTEREST_API = "api/lookup/language-interest";
  static const String UPDATE_LANGUAGE_INTEREST_API = "api/consumer/save-language-interest";

  static const String PROFILE_API = "api/profile";
  static const String PROFILE_UPSERT_API = "api/profile/upsert";


  static const String SEE_ALL_API = "api/lookup/contents-view";


  static const String PRODUCT_CREATE_API = "api/item/create";
  static const String PRODUCT_LOOK_UP_API = "api/product/lookup";
  static const String PRODUCT_CONSUMER_API = "api/product/consumer";
  static const String PRODUCT_ITEM_LOOK_UP_API = "api/item/lookup";
  static const String PRODUCT_ITEM_LIST_API = "api/item/list";
  static const String PRODUCT_ITEM_DELETE = "api/item/delete";
  static const String PRODUCT_ITEM_UPDATE = "api/item/update";

  static const String VIEW_ITEMS_NEAR_ME_API = "api/item/view";
  static const String ADD_CART_API = "api/cart/add";
  static const String UPDATE_CART_API = "api/cart/update";
  static const String VIEW_CART_API = "api/cart/view";
  static const String PRODUCT_DELETE_API = "api/cart/delete";
  static const String AUTH_RESET_PASSWORD = "api/auth/reset-password";


  //favorite_apis

  static const String FAVORITES_LIST_API = "api/consumer/favorites";
  static const String ADD_FAVORITES_TO_LIST = "api/consumer/favorites/add";
  static const String REMOVE_FAVORITES_FROM_LIST = "api/consumer/favorites/remove";


  static const String LOOKUP_HOME_TRENDING = "api/lookup/home/trending";
  static const String LANGUAGE_SECTIONS = "api/lookup/home/language-sections";
  static const String LOOKUP_MOVIES_DETAILS = "api/lookup/movies-details/{id}";
  static const String LOOKUP_CONTENTS_RELATED = "api/lookup/contents/related";

  // subscription  apis
  static const String SUBSCRIPTION_PLANS = "api/subscriptions/plans";
  static const String SUBSCRIPTION_PAY = "api/subscriptions/pay";
  static const String SUBSCRIPTION_ACTIVATE = "api/subscriptions/activate";


  static const String AUTH_LOGOUT = "api/auth/logout";

}
