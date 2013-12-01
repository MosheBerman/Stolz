Stolz
=====

Stolz is a library for handling Facebook login on OS X. 
Stoltz is the German word for "pride", and it's pronounced sh-toe-lts. 

Facebook has SDKs for iOS, Android, and the Web, but they don't have anything for OS X. So, I wrote something.

There's a demo project in this repository called Eltern. Eltern is German for "parents". Parents are usually proud of their kids, and I'm pretty proud of this project, hence the name.

Setting Up Stolz:
---
To use Stolz, you'll need to do a few things. 

1. Drag `Stolz.xcodeproj` into your own project. 
2. `#import "StolzKit.h"`.
3. Set up an application on developers.facebook.com
4. Log your user in or out.

Logging In and Out
---
There's this handy class called `LoginDirector`. It's a singleton, and you'll have to configure it with some tokens. You get them from your Facebook developer dashboard.

    [[self loginDirector] setFacebookAppID:@""];
    [[self loginDirector] setFacebookAppSecret:@""];
	[[self loginDirector] setClientToken:@""];

Now, you can call the log in and log out methods. 
`logUserInWithCompletion:` and `logUserOutWithCompletion:`. The completion blocks will allow you to do what you want to do.


Login Permissions:
---
The login director has a mutable array property called `permissionsToRequest`. Edit that array by adding the strings defined in `STPermissions.h` before calling the login method. The login director will automagically request the permissions that you request.

Checking Login State:
---
The login director has this method called  `isUserLoggedIn` which checks the local flag. There's also a method called `isUserAuthorized`. One explicitly checks for the logged in state, and the second checks for the not authorized state.

Facebook Tokens:
---
There are a few kinds Facebook tokens, but I've chosen to work with an application token. This is the simplest to implement from a developer standpoint, but there's a documented token manager for you to work with if you choose to.

A note on iOS Compatibility:
---
StolzKit was designed to work on OS X, but it should be rather simple to replace the `WebViewController` inside the with a `UIWebView`. The important part is calling the login director and the completion handler after the web view is finished with its business.

I haven't done it because Facebook probably wants you iOS developers to use their SDK, but if you don't want the bloat or setup overhead, this should be simple enough.

License:
---
MIT. 

Contact:
---
If you want to drop me a line, I'll [be here](http://twitter.com/bermaniastudios). 