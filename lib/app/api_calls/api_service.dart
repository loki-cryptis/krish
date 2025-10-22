import 'dart:async';
import 'package:dio/dio.dart';
import 'package:krish/app/beans/request_pojo/SignInRequest.dart';
import 'package:krish/app/beans/response_pojo/ProfileResponse.dart';
import 'package:krish/app/beans/response_pojo/SignInResponse.dart';
import 'package:krish/app/utils/all_constants/end_points_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: EndPointsConstants.BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  final dio = Dio();

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return ApiService(dio);
  }

  @POST(EndPointsConstants.LOGIN_API)
  Future<SignInResponse> userLogin(@Header("Content-Type") String contentType,
      @Header("deviceId") String deviceId, @Body() SignInRequest request);

  @GET(EndPointsConstants.PROFILE_API)
  Future<ProfileResponse> getMyProfile(
      @Header("Content-Type") String contentType,
      @Header("Authorization") String authToken);

}
