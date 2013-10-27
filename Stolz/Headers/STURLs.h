//
//  STURLs.h
//  Stolz
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#ifndef Stolz_STURLs_h
#define Stolz_STURLs_h

/**
 *  This is the URL which Facebook redirects you to after a successful login. (GET)
 */

#define kFacebookRedirectURI @"https://www.facebook.com/connect/login_success.html"

/**
 *  The login dialog URL. (GET)
 *
 *  The app ID, the URI representing a successful login, and the response type.
 *
 *  I've hard coded "token" as the type because I didn't feel like implementing
 *  the code exchange. If it becomes necessary, I'll investigate that option.
 */

#define kFacebookLoginDialogURL @"https://www.facebook.com/dialog/oauth?client_id=%@&redirect_uri=%@&response_type=token"

/**
 *  The login dialog URL (GET)
 *
 *  The app ID, the URI representing a successful login, the response type, and 
 *  the permissions to request from the user.
 *
 *  I've hard coded "token" as the type because I didn't feel like implementing
 *  the code exchange. If it becomes necessary, I'll investigate that option.
 *
 */

#define kFacebookLoginDialogURLWithScope @"https://www.facebook.com/dialog/oauth?client_id=%@&redirect_uri=%@&response_type=token&scope=%@"

/**
 *  The URL to use to inspect a token. (GET)
 *
 *  The first parameter is the token to inspect, and the second is
 *  the app token, or admin token.
 */

#define kFacebookTokenInspectionURL @"https://graph.facebook.com/debug_token?input_token=%@&access_token=%@"

/**
 *  The URL to convert a short-lived token to a long lived one.
 */

/**
 *  The deauthorize URL. (DELETE)
 *
 *  @discussion Pass the user's ID as the parameter and send a DELETE request to this URL.s
 *
 */

#define kFacebookDeauthorizeURL @"https://graph.facebook.com/%@/permissions"

#endif
