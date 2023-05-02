class Endpoints {



  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static String uploadPicture="uploadPicture?deviceid=";
  static String uploadlistingAdImage="uploadlistingAdImage?deviceid=";
  static String createlistingAd="createlistingAd?deviceid=";



  static String getSortByList="getSortByList?deviceid=";
  static String getLastSavedAd="getLastSavedAd?deviceid=";

  static String getAllListingAds="getAllListingAdTemplates?sortBy=";


  static String getAllEventNames="getAllEventNames?deviceid=";
  Endpoints._();

  // base url
  static const String baseUrl = "https://openhouseads-dev.azurewebsites.net/api/OpenHouseAd/";
  static var loginWithSMS  ="loginWithSMS?sms=";
  static var sendverificationsms  ="sendverificationsms";
  static var updateprofile  ="updateprofile?deviceid=";

  static var buildListingAdImages  ="buildListingAdImages?templateName=";
  static var getprofile  ="getprofile?deviceid=";

  static var buildEventAdImages  ="buildEventAdImages?templateName=";


}
