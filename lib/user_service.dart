import 'package:dio/dio.dart';
import 'dart:convert';

class AppController {
  final Dio dio;
  final String prefix;

  AppController({required this.dio, this.prefix = ''});

  Future<dynamic> getHello({Map<String, String>? headers}) async {
    final response = await dio.request(
      '/$prefix/',
      options: Options(method: 'GET', headers: headers),
    );

    return response.data;
  }
}

class MicroserviceDocumentController {
  final Dio dio;
  final String prefix;

  MicroserviceDocumentController({required this.dio, this.prefix = ''});

  Future<dynamic> getDocumentJson({Map<String, String>? headers}) async {
    final response = await dio.request(
      '/$prefix/microservice-documents/json',
      options: Options(method: 'GET', headers: headers),
    );

    return response.data;
  }

  Future<dynamic> grpcTest(
    GrpcTestDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/microservice-documents/test',
      options: Options(method: 'POST', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }
}

class UserController {
  final Dio dio;
  final String prefix;

  UserController({required this.dio, this.prefix = ''});

  Future<CurrentUserResponse> getCurrentUser({
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/users/me',
      options: Options(method: 'GET', headers: headers),
    );

    return CurrentUserResponse.fromJson(response.data);
  }

  Future<void> deleteCurrentUser(
    DeleteCurrentUserDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/users/me',
      options: Options(method: 'DELETE', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }

  Future<UserPublicProfileResponse> getUserPublicProfile(
    String id, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/users/${id}/public-profile',
      options: Options(method: 'GET', headers: headers),
    );

    return UserPublicProfileResponse.fromJson(response.data);
  }

  Future<TaggedUsersPaginationResponse> paginateTaggedUsers(
    String key,
    String page,
    String perPage, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/users/tagged-users',
      options: Options(method: 'GET', headers: headers),
    );

    return TaggedUsersPaginationResponse.fromJson(response.data);
  }

  Future<SpotlistPaginationResponse> paginateSpotlist(
    String page,
    String perPage, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/users/spotlist',
      options: Options(method: 'GET', headers: headers),
    );

    return SpotlistPaginationResponse.fromJson(response.data);
  }

  Future<SpotConnectionResponse> addSpotList(
    AddSpotListDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/users/spotlist',
      options: Options(method: 'POST', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return SpotConnectionResponse.fromJson(response.data);
  }

  Future<void> removeSpotList(
    RemoveSpotListDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/users/spotlist',
      options: Options(method: 'DELETE', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }

  Future<void> updateCurrentUserProfile(
    UpdateUserProfileDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/users/me/profile',
      options: Options(method: 'PUT', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }

  Future<void> changePassword(
    ChangePasswordDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/users/change-password',
      options: Options(method: 'PUT', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }
}

class ResetPasswordController {
  final Dio dio;
  final String prefix;

  ResetPasswordController({required this.dio, this.prefix = ''});

  Future<void> sendOtpResetPassword(
    SendOtpResetPasswordDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/reset-password/send-otp-reset-password',
      options: Options(method: 'POST', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }

  Future<void> resetPassword(
    ResetPasswordDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/reset-password',
      options: Options(method: 'PUT', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }

  Future<void> verifyOtpResetPassword(
    VerifyOtpResetPasswordDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/reset-password/verify-otp-reset-password',
      options: Options(method: 'POST', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }
}

class AuthController {
  final Dio dio;
  final String prefix;

  AuthController({required this.dio, this.prefix = ''});

  Future<SignUpResponse> signUp(
    SignUpDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/auth/sign-up',
      options: Options(method: 'POST', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return SignUpResponse.fromJson(response.data);
  }

  Future<SignInResponse> signIn(
    SignInDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/auth/sign-in',
      options: Options(method: 'POST', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return SignInResponse.fromJson(response.data);
  }

  Future<dynamic> refreshToken(
    RefreshTokenDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/auth/refresh-token',
      options: Options(method: 'POST', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }

  Future<void> signOut({Map<String, String>? headers}) async {
    final response = await dio.request(
      '/$prefix/auth/sign-out',
      options: Options(method: 'DELETE', headers: headers),
    );

    return response.data;
  }

  Future<SignInResponse> googleLogin(
    SocialLoginDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/auth/social-login',
      options: Options(method: 'POST', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return SignInResponse.fromJson(response.data);
  }

  Future<SocialAuthUrlResponse> getAuthUrl(
    String type, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/auth/social-login/auth-url',
      options: Options(method: 'GET', headers: headers),
    );

    return SocialAuthUrlResponse.fromJson(response.data);
  }

  Future<AccessTokenResponse> callbackGet({
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/auth/social-login/callback',
      options: Options(method: 'GET', headers: headers),
    );

    return AccessTokenResponse.fromJson(response.data);
  }

  Future<dynamic> callbackPost({Map<String, String>? headers}) async {
    final response = await dio.request(
      '/$prefix/auth/social-login/callback',
      options: Options(method: 'POST', headers: headers),
    );

    return response.data;
  }

  Future<dynamic> callbackSignInWithApple({
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/auth/callbacks/sign_in_with_apple',
      options: Options(method: 'POST', headers: headers),
    );

    return response.data;
  }

  Future<void> sendOtpSignUp(
    SendOtpDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/auth/send-otp-sign-up',
      options: Options(method: 'POST', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }

  Future<void> verifyOtpSignUp(
    VerifyOtpDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/auth/verify-otp-sign-up',
      options: Options(method: 'POST', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }

  Future<dynamic> checkUsername(
    CheckUserNameDto body, {
    Map<String, String>? headers,
  }) async {
    final response = await dio.request(
      '/$prefix/auth/check-username',
      options: Options(method: 'POST', headers: headers),
      data: body is Map<String, dynamic> ? body : body.toJson(),
    );

    return response.data;
  }
}

class UserService {
  final Dio dio;
  final String prefix;

  late final AppController app;
  late final MicroserviceDocumentController microserviceDocument;
  late final UserController user;
  late final ResetPasswordController resetPassword;
  late final AuthController auth;

  UserService({required this.dio, this.prefix = 'user-service'}) {
    app = AppController(dio: dio, prefix: prefix);
    microserviceDocument = MicroserviceDocumentController(
      dio: dio,
      prefix: prefix,
    );
    user = UserController(dio: dio, prefix: prefix);
    resetPassword = ResetPasswordController(dio: dio, prefix: prefix);
    auth = AuthController(dio: dio, prefix: prefix);
  }
}

class GrpcTestDto {
  String? serviceName;
  String? methodName;
  dynamic data;
  bool? isFindMany;

  GrpcTestDto({this.serviceName, this.methodName, this.data, this.isFindMany});

  factory GrpcTestDto.fromJson(Map<String, dynamic> json) => GrpcTestDto(
    serviceName: json['serviceName'] != null ? json['serviceName'] : null,
    methodName: json['methodName'] != null ? json['methodName'] : null,
    data: json['data'] != null ? json['data'] : null,
    isFindMany: json['isFindMany'] != null ? json['isFindMany'] : null,
  );

  Map<String, dynamic> toJson() => {
    'serviceName': serviceName,
    'methodName': methodName,
    'data': data,
    'isFindMany': isFindMany,
  };
}

enum FileTypeEnum { IMAGE, VIDEO, AUDIO, DOCUMENT }

class DimensionResponse {
  num? width;
  num? height;

  DimensionResponse({this.width, this.height});

  factory DimensionResponse.fromJson(Map<String, dynamic> json) =>
      DimensionResponse(
        width: json['width'] != null ? json['width'] : null,
        height: json['height'] != null ? json['height'] : null,
      );

  Map<String, dynamic> toJson() => {'width': width, 'height': height};
}

class ThumbnailResponse {
  String? path;
  String? name;
  num? size;
  dynamic dimension;
  String? signedUrl;

  ThumbnailResponse({
    this.path,
    this.name,
    this.size,
    this.dimension,
    this.signedUrl,
  });

  factory ThumbnailResponse.fromJson(Map<String, dynamic> json) =>
      ThumbnailResponse(
        path: json['path'] != null ? json['path'] : null,
        name: json['name'] != null ? json['name'] : null,
        size: json['size'] != null ? json['size'] : null,
        dimension: json['dimension'] != null ? json['dimension'] : null,
        signedUrl: json['signedUrl'] != null ? json['signedUrl'] : null,
      );

  Map<String, dynamic> toJson() => {
    'path': path,
    'name': name,
    'size': size,
    'dimension': dimension,
    'signedUrl': signedUrl,
  };
}

enum FileStatusEnum { PREPARE_UPLOAD, UPLOAD_SUCCESS, ERROR, OK }

class FileResponse {
  String? id;
  num? createdAt;
  num? updatedAt;
  String? name;
  String? path;
  String? type;
  String? contentType;
  num? size;
  num? duration;
  List<ThumbnailResponse>? thumbnails;
  DimensionResponse? dimension;
  String? message;
  String? userId;
  String? status;
  String? signedUrl;

  FileResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.path,
    this.type,
    this.contentType,
    this.size,
    this.duration,
    this.thumbnails,
    this.dimension,
    this.message,
    this.userId,
    this.status,
    this.signedUrl,
  });

  factory FileResponse.fromJson(Map<String, dynamic> json) => FileResponse(
    id: json['id'] != null ? json['id'] : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] : null,
    name: json['name'] != null ? json['name'] : null,
    path: json['path'] != null ? json['path'] : null,
    type: json['type'] != null ? json['type'] : null,
    contentType: json['contentType'] != null ? json['contentType'] : null,
    size: json['size'] != null ? json['size'] : null,
    duration: json['duration'] != null ? json['duration'] : null,
    thumbnails:
        json['thumbnails'] != null
            ? (json['thumbnails'] as List)
                .map((js) => ThumbnailResponse.fromJson(js))
                .toList()
            : null,
    dimension:
        json['dimension'] != null
            ? DimensionResponse.fromJson(json['dimension'])
            : null,
    message: json['message'] != null ? json['message'] : null,
    userId: json['userId'] != null ? json['userId'] : null,
    status: json['status'] != null ? json['status'] : null,
    signedUrl: json['signedUrl'] != null ? json['signedUrl'] : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'name': name,
    'path': path,
    'type': type,
    'contentType': contentType,
    'size': size,
    'duration': duration,
    'thumbnails': thumbnails?.map((item) => item.toJson()).toList(),
    'dimension': dimension?.toJson(),
    'message': message,
    'userId': userId,
    'status': status,
    'signedUrl': signedUrl,
  };
}

enum GenderEnum { MALE, FEMALE, OTHER }

class CurrentUserResponse {
  String? id;
  num? createdAt;
  num? updatedAt;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? birthday;
  String? avatarId;
  FileResponse? avatar;
  String? gender;
  num? totalSmypes;
  num? totalSpotlist;
  bool? isSocialAccount;

  CurrentUserResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.firstName,
    this.lastName,
    this.userName,
    this.birthday,
    this.avatarId,
    this.avatar,
    this.gender,
    this.totalSmypes,
    this.totalSpotlist,
    this.isSocialAccount,
  });

  factory CurrentUserResponse.fromJson(
    Map<String, dynamic> json,
  ) => CurrentUserResponse(
    id: json['id'] != null ? json['id'] : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] : null,
    email: json['email'] != null ? json['email'] : null,
    firstName: json['firstName'] != null ? json['firstName'] : null,
    lastName: json['lastName'] != null ? json['lastName'] : null,
    userName: json['userName'] != null ? json['userName'] : null,
    birthday: json['birthday'] != null ? json['birthday'] : null,
    avatarId: json['avatarId'] != null ? json['avatarId'] : null,
    avatar:
        json['avatar'] != null ? FileResponse.fromJson(json['avatar']) : null,
    gender: json['gender'] != null ? json['gender'] : null,
    totalSmypes: json['totalSmypes'] != null ? json['totalSmypes'] : null,
    totalSpotlist: json['totalSpotlist'] != null ? json['totalSpotlist'] : null,
    isSocialAccount:
        json['isSocialAccount'] != null ? json['isSocialAccount'] : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'userName': userName,
    'birthday': birthday,
    'avatarId': avatarId,
    'avatar': avatar?.toJson(),
    'gender': gender,
    'totalSmypes': totalSmypes,
    'totalSpotlist': totalSpotlist,
    'isSocialAccount': isSocialAccount,
  };
}

class UserPublicProfileResponse {
  String? id;
  num? createdAt;
  num? updatedAt;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? birthday;
  String? avatarId;
  FileResponse? avatar;
  String? gender;
  num? totalSmypes;
  bool? isInSpotList;

  UserPublicProfileResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.firstName,
    this.lastName,
    this.userName,
    this.birthday,
    this.avatarId,
    this.avatar,
    this.gender,
    this.totalSmypes,
    this.isInSpotList,
  });

  factory UserPublicProfileResponse.fromJson(
    Map<String, dynamic> json,
  ) => UserPublicProfileResponse(
    id: json['id'] != null ? json['id'] : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] : null,
    email: json['email'] != null ? json['email'] : null,
    firstName: json['firstName'] != null ? json['firstName'] : null,
    lastName: json['lastName'] != null ? json['lastName'] : null,
    userName: json['userName'] != null ? json['userName'] : null,
    birthday: json['birthday'] != null ? json['birthday'] : null,
    avatarId: json['avatarId'] != null ? json['avatarId'] : null,
    avatar:
        json['avatar'] != null ? FileResponse.fromJson(json['avatar']) : null,
    gender: json['gender'] != null ? json['gender'] : null,
    totalSmypes: json['totalSmypes'] != null ? json['totalSmypes'] : null,
    isInSpotList: json['isInSpotList'] != null ? json['isInSpotList'] : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'userName': userName,
    'birthday': birthday,
    'avatarId': avatarId,
    'avatar': avatar?.toJson(),
    'gender': gender,
    'totalSmypes': totalSmypes,
    'isInSpotList': isInSpotList,
  };
}

class OmittedUserResponse {
  String? id;
  num? createdAt;
  num? updatedAt;
  String? firstName;
  String? lastName;
  String? userName;
  String? avatarId;
  FileResponse? avatar;

  OmittedUserResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.userName,
    this.avatarId,
    this.avatar,
  });

  factory OmittedUserResponse.fromJson(Map<String, dynamic> json) =>
      OmittedUserResponse(
        id: json['id'] != null ? json['id'] : null,
        createdAt: json['createdAt'] != null ? json['createdAt'] : null,
        updatedAt: json['updatedAt'] != null ? json['updatedAt'] : null,
        firstName: json['firstName'] != null ? json['firstName'] : null,
        lastName: json['lastName'] != null ? json['lastName'] : null,
        userName: json['userName'] != null ? json['userName'] : null,
        avatarId: json['avatarId'] != null ? json['avatarId'] : null,
        avatar:
            json['avatar'] != null
                ? FileResponse.fromJson(json['avatar'])
                : null,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'firstName': firstName,
    'lastName': lastName,
    'userName': userName,
    'avatarId': avatarId,
    'avatar': avatar?.toJson(),
  };
}

class TaggedUsersPaginationResponse {
  num? total;
  num? lastPage;
  num? perPage;
  num? currentPage;
  List<OmittedUserResponse>? items;

  TaggedUsersPaginationResponse({
    this.total,
    this.lastPage,
    this.perPage,
    this.currentPage,
    this.items,
  });

  factory TaggedUsersPaginationResponse.fromJson(Map<String, dynamic> json) =>
      TaggedUsersPaginationResponse(
        total: json['total'] != null ? json['total'] : null,
        lastPage: json['lastPage'] != null ? json['lastPage'] : null,
        perPage: json['perPage'] != null ? json['perPage'] : null,
        currentPage: json['currentPage'] != null ? json['currentPage'] : null,
        items:
            json['items'] != null
                ? (json['items'] as List)
                    .map((js) => OmittedUserResponse.fromJson(js))
                    .toList()
                : null,
      );

  Map<String, dynamic> toJson() => {
    'total': total,
    'lastPage': lastPage,
    'perPage': perPage,
    'currentPage': currentPage,
    'items': items?.map((item) => item.toJson()).toList(),
  };
}

class SpotlistResponse {
  String? id;
  num? createdAt;
  String? firstName;
  String? lastName;
  String? userName;
  String? avatarId;
  FileResponse? avatar;

  SpotlistResponse({
    this.id,
    this.createdAt,
    this.firstName,
    this.lastName,
    this.userName,
    this.avatarId,
    this.avatar,
  });

  factory SpotlistResponse.fromJson(Map<String, dynamic> json) =>
      SpotlistResponse(
        id: json['id'] != null ? json['id'] : null,
        createdAt: json['createdAt'] != null ? json['createdAt'] : null,
        firstName: json['firstName'] != null ? json['firstName'] : null,
        lastName: json['lastName'] != null ? json['lastName'] : null,
        userName: json['userName'] != null ? json['userName'] : null,
        avatarId: json['avatarId'] != null ? json['avatarId'] : null,
        avatar:
            json['avatar'] != null
                ? FileResponse.fromJson(json['avatar'])
                : null,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt,
    'firstName': firstName,
    'lastName': lastName,
    'userName': userName,
    'avatarId': avatarId,
    'avatar': avatar?.toJson(),
  };
}

class SpotlistPaginationResponse {
  num? total;
  num? lastPage;
  num? perPage;
  num? currentPage;
  List<SpotlistResponse>? items;

  SpotlistPaginationResponse({
    this.total,
    this.lastPage,
    this.perPage,
    this.currentPage,
    this.items,
  });

  factory SpotlistPaginationResponse.fromJson(Map<String, dynamic> json) =>
      SpotlistPaginationResponse(
        total: json['total'] != null ? json['total'] : null,
        lastPage: json['lastPage'] != null ? json['lastPage'] : null,
        perPage: json['perPage'] != null ? json['perPage'] : null,
        currentPage: json['currentPage'] != null ? json['currentPage'] : null,
        items:
            json['items'] != null
                ? (json['items'] as List)
                    .map((js) => SpotlistResponse.fromJson(js))
                    .toList()
                : null,
      );

  Map<String, dynamic> toJson() => {
    'total': total,
    'lastPage': lastPage,
    'perPage': perPage,
    'currentPage': currentPage,
    'items': items?.map((item) => item.toJson()).toList(),
  };
}

class AddSpotListDto {
  String? toUserId;

  AddSpotListDto({this.toUserId});

  factory AddSpotListDto.fromJson(Map<String, dynamic> json) => AddSpotListDto(
    toUserId: json['toUserId'] != null ? json['toUserId'] : null,
  );

  Map<String, dynamic> toJson() => {'toUserId': toUserId};
}

class SpotConnectionResponse {
  String? id;
  num? createdAt;
  num? updatedAt;
  String? fromUserId;
  String? toUserId;

  SpotConnectionResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.fromUserId,
    this.toUserId,
  });

  factory SpotConnectionResponse.fromJson(Map<String, dynamic> json) =>
      SpotConnectionResponse(
        id: json['id'] != null ? json['id'] : null,
        createdAt: json['createdAt'] != null ? json['createdAt'] : null,
        updatedAt: json['updatedAt'] != null ? json['updatedAt'] : null,
        fromUserId: json['fromUserId'] != null ? json['fromUserId'] : null,
        toUserId: json['toUserId'] != null ? json['toUserId'] : null,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'fromUserId': fromUserId,
    'toUserId': toUserId,
  };
}

class RemoveSpotListDto {
  String? toUserId;

  RemoveSpotListDto({this.toUserId});

  factory RemoveSpotListDto.fromJson(Map<String, dynamic> json) =>
      RemoveSpotListDto(
        toUserId: json['toUserId'] != null ? json['toUserId'] : null,
      );

  Map<String, dynamic> toJson() => {'toUserId': toUserId};
}

class UpdateUserProfileDto {
  String? firstName;
  String? lastName;
  String? birthday;
  String? userName;
  String? avatarId;
  String? gender;

  UpdateUserProfileDto({
    this.firstName,
    this.lastName,
    this.birthday,
    this.userName,
    this.avatarId,
    this.gender,
  });

  factory UpdateUserProfileDto.fromJson(Map<String, dynamic> json) =>
      UpdateUserProfileDto(
        firstName: json['firstName'] != null ? json['firstName'] : null,
        lastName: json['lastName'] != null ? json['lastName'] : null,
        birthday: json['birthday'] != null ? json['birthday'] : null,
        userName: json['userName'] != null ? json['userName'] : null,
        avatarId: json['avatarId'] != null ? json['avatarId'] : null,
        gender: json['gender'] != null ? json['gender'] : null,
      );

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'birthday': birthday,
    'userName': userName,
    'avatarId': avatarId,
    'gender': gender,
  };
}

class ChangePasswordDto {
  String? oldPassword;
  String? newPassword;

  ChangePasswordDto({this.oldPassword, this.newPassword});

  factory ChangePasswordDto.fromJson(Map<String, dynamic> json) =>
      ChangePasswordDto(
        oldPassword: json['oldPassword'] != null ? json['oldPassword'] : null,
        newPassword: json['newPassword'] != null ? json['newPassword'] : null,
      );

  Map<String, dynamic> toJson() => {
    'oldPassword': oldPassword,
    'newPassword': newPassword,
  };
}

class DeleteCurrentUserDto {
  String? password;
  String? userName;

  DeleteCurrentUserDto({this.password, this.userName});

  factory DeleteCurrentUserDto.fromJson(Map<String, dynamic> json) =>
      DeleteCurrentUserDto(
        password: json['password'] != null ? json['password'] : null,
        userName: json['userName'] != null ? json['userName'] : null,
      );

  Map<String, dynamic> toJson() => {'password': password, 'userName': userName};
}

class SendOtpResetPasswordDto {
  String? email;

  SendOtpResetPasswordDto({this.email});

  factory SendOtpResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      SendOtpResetPasswordDto(
        email: json['email'] != null ? json['email'] : null,
      );

  Map<String, dynamic> toJson() => {'email': email};
}

class ResetPasswordDto {
  String? email;
  String? password;

  ResetPasswordDto({this.email, this.password});

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      ResetPasswordDto(
        email: json['email'] != null ? json['email'] : null,
        password: json['password'] != null ? json['password'] : null,
      );

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

class VerifyOtpResetPasswordDto {
  String? email;
  String? otp;

  VerifyOtpResetPasswordDto({this.email, this.otp});

  factory VerifyOtpResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResetPasswordDto(
        email: json['email'] != null ? json['email'] : null,
        otp: json['otp'] != null ? json['otp'] : null,
      );

  Map<String, dynamic> toJson() => {'email': email, 'otp': otp};
}

class GetUsersByIdsDto {
  List<dynamic>? userIds;

  GetUsersByIdsDto({this.userIds});

  factory GetUsersByIdsDto.fromJson(Map<String, dynamic> json) =>
      GetUsersByIdsDto(
        userIds: json['userIds'] != null ? json['userIds'] : null,
      );

  Map<String, dynamic> toJson() => {'userIds': userIds};
}

class UserResponse {
  String? id;
  num? createdAt;
  num? updatedAt;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? birthday;
  String? avatarId;
  FileResponse? avatar;
  String? gender;

  UserResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.firstName,
    this.lastName,
    this.userName,
    this.birthday,
    this.avatarId,
    this.avatar,
    this.gender,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    id: json['id'] != null ? json['id'] : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] : null,
    email: json['email'] != null ? json['email'] : null,
    firstName: json['firstName'] != null ? json['firstName'] : null,
    lastName: json['lastName'] != null ? json['lastName'] : null,
    userName: json['userName'] != null ? json['userName'] : null,
    birthday: json['birthday'] != null ? json['birthday'] : null,
    avatarId: json['avatarId'] != null ? json['avatarId'] : null,
    avatar:
        json['avatar'] != null ? FileResponse.fromJson(json['avatar']) : null,
    gender: json['gender'] != null ? json['gender'] : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'userName': userName,
    'birthday': birthday,
    'avatarId': avatarId,
    'avatar': avatar?.toJson(),
    'gender': gender,
  };
}

class GetUsersCurrentConnection {
  List<dynamic>? userIds;
  String? currentUserId;

  GetUsersCurrentConnection({this.userIds, this.currentUserId});

  factory GetUsersCurrentConnection.fromJson(Map<String, dynamic> json) =>
      GetUsersCurrentConnection(
        userIds: json['userIds'] != null ? json['userIds'] : null,
        currentUserId:
            json['currentUserId'] != null ? json['currentUserId'] : null,
      );

  Map<String, dynamic> toJson() => {
    'userIds': userIds,
    'currentUserId': currentUserId,
  };
}

class UserCurrentConnection {
  String? id;
  num? createdAt;
  num? updatedAt;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? birthday;
  String? avatarId;
  FileResponse? avatar;
  String? gender;
  bool? isInSpotList;

  UserCurrentConnection({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.firstName,
    this.lastName,
    this.userName,
    this.birthday,
    this.avatarId,
    this.avatar,
    this.gender,
    this.isInSpotList,
  });

  factory UserCurrentConnection.fromJson(
    Map<String, dynamic> json,
  ) => UserCurrentConnection(
    id: json['id'] != null ? json['id'] : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] : null,
    email: json['email'] != null ? json['email'] : null,
    firstName: json['firstName'] != null ? json['firstName'] : null,
    lastName: json['lastName'] != null ? json['lastName'] : null,
    userName: json['userName'] != null ? json['userName'] : null,
    birthday: json['birthday'] != null ? json['birthday'] : null,
    avatarId: json['avatarId'] != null ? json['avatarId'] : null,
    avatar:
        json['avatar'] != null ? FileResponse.fromJson(json['avatar']) : null,
    gender: json['gender'] != null ? json['gender'] : null,
    isInSpotList: json['isInSpotList'] != null ? json['isInSpotList'] : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'userName': userName,
    'birthday': birthday,
    'avatarId': avatarId,
    'avatar': avatar?.toJson(),
    'gender': gender,
    'isInSpotList': isInSpotList,
  };
}

class GetSpotListUsersDto {
  String? userId;

  GetSpotListUsersDto({this.userId});

  factory GetSpotListUsersDto.fromJson(Map<String, dynamic> json) =>
      GetSpotListUsersDto(
        userId: json['userId'] != null ? json['userId'] : null,
      );

  Map<String, dynamic> toJson() => {'userId': userId};
}

class SignUpDto {
  String? accessToken;
  String? secretToken;
  String? type;
  String? email;
  String? firstName;
  String? lastName;
  String? birthday;
  String? userName;
  String? password;
  String? avatarId;
  String? gender;

  SignUpDto({
    this.accessToken,
    this.secretToken,
    this.type,
    this.email,
    this.firstName,
    this.lastName,
    this.birthday,
    this.userName,
    this.password,
    this.avatarId,
    this.gender,
  });

  factory SignUpDto.fromJson(Map<String, dynamic> json) => SignUpDto(
    accessToken: json['accessToken'] != null ? json['accessToken'] : null,
    secretToken: json['secretToken'] != null ? json['secretToken'] : null,
    type: json['type'] != null ? json['type'] : null,
    email: json['email'] != null ? json['email'] : null,
    firstName: json['firstName'] != null ? json['firstName'] : null,
    lastName: json['lastName'] != null ? json['lastName'] : null,
    birthday: json['birthday'] != null ? json['birthday'] : null,
    userName: json['userName'] != null ? json['userName'] : null,
    password: json['password'] != null ? json['password'] : null,
    avatarId: json['avatarId'] != null ? json['avatarId'] : null,
    gender: json['gender'] != null ? json['gender'] : null,
  );

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'secretToken': secretToken,
    'type': type,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'birthday': birthday,
    'userName': userName,
    'password': password,
    'avatarId': avatarId,
    'gender': gender,
  };
}

class SignUpResponse {
  UserResponse? user;
  String? token;
  String? refreshToken;
  num? expireAt;

  SignUpResponse({this.user, this.token, this.refreshToken, this.expireAt});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    user: json['user'] != null ? UserResponse.fromJson(json['user']) : null,
    token: json['token'] != null ? json['token'] : null,
    refreshToken: json['refreshToken'] != null ? json['refreshToken'] : null,
    expireAt: json['expireAt'] != null ? json['expireAt'] : null,
  );

  Map<String, dynamic> toJson() => {
    'user': user?.toJson(),
    'token': token,
    'refreshToken': refreshToken,
    'expireAt': expireAt,
  };
}

class SignInDto {
  String? emailOrUserName;
  String? password;

  SignInDto({this.emailOrUserName, this.password});

  factory SignInDto.fromJson(Map<String, dynamic> json) => SignInDto(
    emailOrUserName:
        json['emailOrUserName'] != null ? json['emailOrUserName'] : null,
    password: json['password'] != null ? json['password'] : null,
  );

  Map<String, dynamic> toJson() => {
    'emailOrUserName': emailOrUserName,
    'password': password,
  };
}

class SignInResponse {
  UserResponse? user;
  String? token;
  String? refreshToken;
  num? expireAt;

  SignInResponse({this.user, this.token, this.refreshToken, this.expireAt});

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
    user: json['user'] != null ? UserResponse.fromJson(json['user']) : null,
    token: json['token'] != null ? json['token'] : null,
    refreshToken: json['refreshToken'] != null ? json['refreshToken'] : null,
    expireAt: json['expireAt'] != null ? json['expireAt'] : null,
  );

  Map<String, dynamic> toJson() => {
    'user': user?.toJson(),
    'token': token,
    'refreshToken': refreshToken,
    'expireAt': expireAt,
  };
}

class RefreshTokenDto {
  String? refreshToken;

  RefreshTokenDto({this.refreshToken});

  factory RefreshTokenDto.fromJson(Map<String, dynamic> json) =>
      RefreshTokenDto(
        refreshToken:
            json['refreshToken'] != null ? json['refreshToken'] : null,
      );

  Map<String, dynamic> toJson() => {'refreshToken': refreshToken};
}

class SocialLoginDto {
  String? accessToken;
  String? secretToken;
  String? type;

  SocialLoginDto({this.accessToken, this.secretToken, this.type});

  factory SocialLoginDto.fromJson(Map<String, dynamic> json) => SocialLoginDto(
    accessToken: json['accessToken'] != null ? json['accessToken'] : null,
    secretToken: json['secretToken'] != null ? json['secretToken'] : null,
    type: json['type'] != null ? json['type'] : null,
  );

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'secretToken': secretToken,
    'type': type,
  };
}

class SocialAuthUrlResponse {
  String? authUrl;

  SocialAuthUrlResponse({this.authUrl});

  factory SocialAuthUrlResponse.fromJson(Map<String, dynamic> json) =>
      SocialAuthUrlResponse(
        authUrl: json['authUrl'] != null ? json['authUrl'] : null,
      );

  Map<String, dynamic> toJson() => {'authUrl': authUrl};
}

class AccessTokenResponse {
  String? accessToken;
  String? secretToken;

  AccessTokenResponse({this.accessToken, this.secretToken});

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) =>
      AccessTokenResponse(
        accessToken: json['accessToken'] != null ? json['accessToken'] : null,
        secretToken: json['secretToken'] != null ? json['secretToken'] : null,
      );

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'secretToken': secretToken,
  };
}

class SendOtpDto {
  String? email;

  SendOtpDto({this.email});

  factory SendOtpDto.fromJson(Map<String, dynamic> json) =>
      SendOtpDto(email: json['email'] != null ? json['email'] : null);

  Map<String, dynamic> toJson() => {'email': email};
}

class VerifyOtpDto {
  String? email;
  String? otp;

  VerifyOtpDto({this.email, this.otp});

  factory VerifyOtpDto.fromJson(Map<String, dynamic> json) => VerifyOtpDto(
    email: json['email'] != null ? json['email'] : null,
    otp: json['otp'] != null ? json['otp'] : null,
  );

  Map<String, dynamic> toJson() => {'email': email, 'otp': otp};
}

class CheckUserNameDto {
  String? userName;

  CheckUserNameDto({this.userName});

  factory CheckUserNameDto.fromJson(Map<String, dynamic> json) =>
      CheckUserNameDto(
        userName: json['userName'] != null ? json['userName'] : null,
      );

  Map<String, dynamic> toJson() => {'userName': userName};
}

class VerifyTokenDto {
  String? token;

  VerifyTokenDto({this.token});

  factory VerifyTokenDto.fromJson(Map<String, dynamic> json) =>
      VerifyTokenDto(token: json['token'] != null ? json['token'] : null);

  Map<String, dynamic> toJson() => {'token': token};
}

class VerifiedTokenResponse {
  UserResponse? user;

  VerifiedTokenResponse({this.user});

  factory VerifiedTokenResponse.fromJson(Map<String, dynamic> json) =>
      VerifiedTokenResponse(
        user: json['user'] != null ? UserResponse.fromJson(json['user']) : null,
      );

  Map<String, dynamic> toJson() => {'user': user?.toJson()};
}
