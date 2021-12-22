//
//  RSSViewController.h
//  finalAsg
//
//  Created by Saurabh Vidhate on 02/12/21.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSSViewController : ViewController <NSXMLParserDelegate>
@property (weak, nonatomic) IBOutlet UITableView *RSSTableView;
@property (strong, nonatomic) IBOutlet UIWebView *RSSWebView;
@property (weak, nonatomic) NSString *stringURL;
@end

NS_ASSUME_NONNULL_END
