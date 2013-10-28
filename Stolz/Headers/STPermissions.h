//
//  STPermissions.h
//  Stolz
//
//  Created by Moshe Berman on 10/26/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#ifndef Stolz_STPermissions_h
#define Stolz_STPermissions_h

/**
 *  Define NSString pointers as FacebookPermission.
 */

typedef NSString* FacebookPermission;

/** --------------------------------------------------------
 *
 *  Email permissions:
 *
 *  A user's email is a protected property and access to
 *  that information must be specifically requested by the 
 *  app and granted by the user.
 ** --------------------------------------------------------
 */

/**
 *  email
 *
 *  Provides access to the user's primary email address in the
 *  email property. Do not spam users. Your use of email must 
 *  comply both with Facebook policies and with the CAN-SPAM Act.
 */

FacebookPermission PermissionEmail = @"email";


/** --------------------------------------------------------
 *
 *  Extended Profile Permissions:
 *
 *  These Permissions cannot be revoked in the Login Dialog
 *  during the login flow, meaning they are non-optional for
 *  Users when logging into your app. If you want them to be
 *  optional, you should structure your app to only request them 
 *  when absolutely necessary and not upon initial login. 
 ** --------------------------------------------------------
 */

/**
 *  user_about_me	
 *  friends_about_me
 *
 *  Provides access to the "About Me" section of the profile 
 *  in the about property
 */

FacebookPermission PermissionUserAboutMe = @"user_about_me";
FacebookPermission PermissionFriendsAboutMe = @"friends_about_me";


/**
 *  user_activities	
 *  friends_activities
 *
 *  Provides access to the user's list of activities as the 
 *  activities connection.
 */
FacebookPermission PermissionUserActivities = @"user_activities";
FacebookPermission PermissionFriendsActivities = @"friends_activities";

/**
 *  user_birthday
 *  friends_birthday
 *  
 *  Provides access to the birthday with year as the birthday
 *  property. Note that your app may determine if a user is "old enough"
 *  to use an app by obtaining the age_range public profile property
 */

FacebookPermission PermissionUserBirthday = @"user_birthday";
FacebookPermission PermissionFriendsBirthday = @"friends_birthday";

/**
 *  user_checkins
 *  friends_checkins
 *
 *  Provides read access to the authorized user's check-ins or a
 *  friend's check-ins that the user can see. This permission is 
 *  superseded by user_status for new applications as of March, 2012.
 */

FacebookPermission PermissionUserCheckins = @"user_checkins";
FacebookPermission PermissionFriendsCheckins = @"friends_checkins";

/**
 *	user_education_history	 
 *	friends_education_history
 *
 *  Provides access to education history as the education property.
 */

FacebookPermission PermissionUserEducationHistory = @"user_education_history";
FacebookPermission PermissionFriendsEducationHistory = @"friends_education_history";

/**
 *	user_events	
 *	friends_events
 *  
 *  Provides access to the list of events the user is attending 
 *  as the events connection.
 */

FacebookPermission PermissionUserEvents = @"user_events";
FacebookPermission PermissionFriendsEvents = @"friends_events";

/**
 *	user_groups	
 *	friends_groups	
 *
 *  Provides access to the list of groups the user is a member of
 *  as the groups connection.
 */

 FacebookPermission PermissionUserGroups = @"user_groups";
 FacebookPermission PermissionFriendsGroups = @"friends_groups";

/**
 *	user_hometown	
 *	friends_hometown
 *
 *  Provides access to the user's hometown in the hometown property.
 */

 FacebookPermission PermissionUserHometown = @"user_hometown";
 FacebookPermission PermissionFriendsHomeTown = @"friends_hometown";

/**
 *	user_interests	
 *	friends_interests	
 *
 *  Provides access to the user's list of interests as the interests 
 *  connection.
 */

 FacebookPermission PermissionUserInterests = @"user_interests";
 FacebookPermission PermissionFriendsInterests = @"friends_interests";

/**
 *	user_likes	
 *	friends_likes	
 *
 *	Provides access to the list of all of the pages the user has liked 
 *  as the likes connection.
 */

 FacebookPermission PermissionUserLikes = @"user_likes";
 FacebookPermission PermissionFriendsLikes = @"friends_likes";

/**
 *	user_location	
 *	friends_location	
 *
 *	Provides access to the user's current city as the location property.
 */

 FacebookPermission PermissionUserLocation = @"user_location";
 FacebookPermission PermissionFriendsLocation = @"friends_location";

/**
 *	user_notes	
 *	friends_notes	
 *
 *	Provides access to the user's notes as the notes connection
 */

 FacebookPermission PermissionUserNotes = @"user_notes";
 FacebookPermission PermissionFriendsNotes = @"friends_notes";

/**
 *	user_photos	
 *	friends_photos	
 *
 *	Provides access to the photos the user has uploaded, and photos the user has been tagged in
 */

 FacebookPermission PermissionUserPhotos = @"user_photos";
 FacebookPermission PermissionFriendsPhotos = @"friends_photos";

/**
 *	user_questions	
 *	friends_questions	
 *
 *	Provides access to the questions the user or friend has asked.
 */

 FacebookPermission PermissionUserQuestions = @"user_questions";
 FacebookPermission PermissionFriendsQuestions = @"friends_questions";

/**
 *	user_relationships	
 *	friends_relationships	
 *
 *	Provides access to the user's family and personal relationships and relationship status.
 */

 FacebookPermission PermissionUserRelationships = @"user_relationships";
 FacebookPermission PermissionFriendsRelationships = @"friends_relationships";

/**
 *	user_relationship_details	
 *	friends_relationship_details	
 *
 *	Provides access to the user's relationship preferences.
 */

 FacebookPermission PermissionUserRelationshipDetails = @"user_relationship_details";
 FacebookPermission PermissionFriendsRelationshipDetails = @"friends_relationship_details";

/**
 *	user_religion_politics	
 *	friends_religion_politics	
 *
 *	Provides access to the user's religious and political affiliations.
 */

 FacebookPermission PermissionUserReligionPolitics = @"user_religion_politics";
 FacebookPermission PermissionFriendsReligionPolitics = @"friends_religion_politics";

/**
 *	user_status	
 *	friends_status	
 *
 *	Provides access to the user's status messages and checkins. 
 *  Please see the documentation for the location_post table for 
 *  information on how this permission may affect retrieval of information 
 *  about the locations associated with posts.
 */

 FacebookPermission PermissionUserStatus = @"user_status";
 FacebookPermission PermissionFriendsStatus = @"friends_status";

/**
 *	user_subscriptions	
 *	friends_subscriptions	
 *
 *	Provides access to the user's subscribers and subscribees.
 */

 FacebookPermission PermissionUserSubscriptions = @"user_subscriptions";
 FacebookPermission PermissionFriendsSubscriptions = @"friends_subscriptions";

/**
 *	user_videos	
 *	friends_videos	
 *
 *	Provides access to the videos the user has uploaded, and videos the user has been tagged in
 */

 FacebookPermission PermissionUserVideos = @"user_videos";
 FacebookPermission PermissionFriendsVideos = @"friends_videos";

/**
 *	user_website	
 *	friends_website	
 *
 *	Provides access to the user's web site URL.
 */

 FacebookPermission PermissionUserWebsite = @"user_website";
 FacebookPermission PermissionFriendsWebsite = @"friends_website";

/**
 *	user_work_history	
 *	friends_work_history	
 *
 *	Provides access to work history as the work property.
 */

 FacebookPermission PermissionUserWorkHistory = @"user_work_history";
 FacebookPermission PermissionFriendsWorkHistoyr = @"friends_work_history";

/** --------------------------------------------------------
 *
 *  Extended Permissions:
 *
 *  As Extended Permissions give access to more sensitive info and 
 *  the ability to publish and delete data, they are optional when 
 *  presented to users in the Login Dialog. They can also be removed
 *  by a user after having granted them in their Privacy Settings.
 *  Apps should be built to handle revoked Permissions without reducing 
 *  the user experience.
 ** --------------------------------------------------------
 */

/** --------------------
 *  Read Permissions
 ** --------------------
 */

/**
 *  read_friendlists
 *
 *  Provides access to any friend lists the user created. All user's 
 *  friends are provided as part of basic data, this extended permission 
 *  grants access to the lists of friends a user has created, and should only
 *  be requested if your application utilizes lists of friends.
 */

FacebookPermission PermissionReadFriendLists = @"read_friendlists";

/**
 *  read_insights
 *  
 *  Provides read access to the Insights data for pages, applications, and domains the user owns.
 */

FacebookPermission PermissionReadInsights = @"read_insights";

/**
 *  read_mailbox	
 *  
 *  Provides the ability to read from a user's Facebook Inbox.
 *
 */

FacebookPermission PermissionMailbox	= @"read_mailbox";

/**
 *  read_requests	
 *  
 *  Provides read access to the user's friend requests.
 */

FacebookPermission PermissionRequests = @"read_requests";

/** 
 *  read_stream
 *
 *  Provides access to all the posts in the user's News Feed and enables your 
 *  application to perform searches against the user's News Feed.
 */
FacebookPermission PermissionStream = @"read_stream";

/**
 *  xmpp_login
 *
 *  Provides applications that integrate with Facebook Chat the ability to log in users.
 */

FacebookPermission PermissionXMPPLogin = @"xmpp_login";

/**
 *  user_online_presence 
 *
 *  Provides access to the user's online/offline presence
 *
 */

FacebookPermission PermissionuserOnlinePresence = @"user_online_presence";

/**
 *   *	friends_online_presence	
 *
 *  Provides access to the user's friend's online/offline presence.
 */

FacebookPermission PermissionFriendsOnlinePresence = @"friends_online_presence";

/** --------------------
 *  Publish permissions
 ** --------------------
 */

/**
 *  ads_management
 *
 *  Provides the ability to manage ads and call the Facebook Ads
 *  API on behalf of a user.
 */

FacebookPermission PermissionAdsManagement = @"ads_management";

/**
 *  create_event
 *
 *  Enables your application to create and modify events on the user's behalf.
 */
FacebookPermission PermissionCreateEvent = @"create_event";

/**
 *  manage_friendlists
 *
 *  Enables your app to create and edit the user's friend lists.
 */

FacebookPermission PermissionManageFriendlists = @"manage_friendlists";

/**
 *  manage_notifications
 *
 *  Enables your app to read notifications and mark them as read. 
 *  Intended usage: This permission should be used to let users read and act 
 *  on their notifications; it should not be used to for the purposes of modeling
 *  user behavior or data mining. Apps that misuse this permission may be banned
 *  from requesting it.
 */

FacebookPermission PermissionManageNotifications = @"manage_notifications";

/**
 *  publish_actions
 *  
 *  Enables your app to post content, comments and likes to a user's stream
 *  and requires extra permissions from a person using your app. Because this
 *  permission lets you publish on behalf of a user please read the Platform Policies
 *  to ensure you understand how to properly use this permission. Note, you do not 
 *  need to request the publish_actions permission in order to use the Feed Dialog, 
 *  the Requests Dialog or the Send Dialog. Facebook used to have a permission called
 *  publish_stream, publish_actions replaces it in most cases, for users. For pages, 
 *  publish_stream is still required to publish to a page's timeline.
 */

FacebookPermission PermissionPublishActions = @"publish_actions";

/**
 *  publish_stream	
 *
 *  The publish_stream permission is required to post to a Facebook Page's timeline. 
 *  For a Facebook User use publish_actions.
 */

FacebookPermission PermissionPublishStream = @"publish_stream";

/**
 *  rsvp_event
 *
 *  Enables your application to RSVP to events on the user's behalf
 */
FacebookPermission PermissionRSVPEvent = @"rsvp_event";

/** --------------------------------------------------------
 *
 *  Page Permissions:
 *
 *  As with Extended Permissions this Permission is optional when
 *  presented to users in the Login Dialog. It can also be removed 
 *  by a user after having granted it in their Privacy Settings. 
 *  Apps should be built to handle revoked Permissions without reducing
 *  the user experience.
 ** --------------------------------------------------------
 */

/**
 *  manage_pages
 *
 *  Enables your application to retrieve access_tokens for Pages and Applications
 *  that the user administrates. The access tokens can be queried by calling
 *  /<user_id>/accounts via the Graph API.
 *
 *  See https://developers.facebook.com/roadmap/offline-access-removal/#page_access_token
 *  for generating long-lived Page access tokens that do not expire after 60 days.
 *
 */


FacebookPermission *PermissionManagePages = @"manage_pages";

#endif
