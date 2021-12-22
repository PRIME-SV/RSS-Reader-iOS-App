//
//  RSSWebViewController.m
//  finalAsg
//
//  Created by Saurabh Vidhate on 02/12/21.
//

#import "RSSWebViewController.h"

@interface RSSWebViewController ()

@end

@implementation RSSWebViewController
@synthesize  webURL = _webURL;
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL* url = [NSURL URLWithString:_webURL];
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:url];
    [_RSSWebView loadRequest:urlRequest];
    //[UIWebView load:urlRequest];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"Error 404 not found");
}

/*- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityIndicator startAnimating];
}
web
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityIndicator stopAnimating];
}*/
- (IBAction)backButtonTap:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
