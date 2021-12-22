//
//  RSSWebViewController.h
//  finalAsg
//
//  Created by Saurabh Vidhate on 02/12/21.
//
#import <WebKit/WebKit.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSSWebViewController : ViewController <WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet WKWebView *RSSWebView;
@property (weak, nonatomic) NSString* webURL;
@end

NS_ASSUME_NONNULL_END
