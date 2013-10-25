//
//  STURLs.h
//  Stolz
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#ifndef Stolz_STURLs_h
#define Stolz_STURLs_h

#define kRedirectURI @"https://www.facebook.com/connect/login_success.html"

#define kLoginDialogURL @"https://www.facebook.com/dialog/oauth?client_id=%@&redirect_uri=%@&response_type=token&scope=read_stream,friends_online_presence,user_likes,user_groups"

/**
 *  {token-to-inspect}
 *  {app-token-or-admin-token}
 */
#define kTokenInspectionURL @"graph.facebook.com/debug_token?input_token=%@&access_token=%@"

#endif
