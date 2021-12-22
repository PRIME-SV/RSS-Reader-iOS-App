//  RSSViewController.m
//  finalAsg
//
//  Created by Saurabh Vidhate on 01/12/21.
//

#import "RSSViewController.h"
#import "RSSCellView.h"
#import "RSSWebViewController.h"

@interface RSSViewController (){
    NSXMLParser *parser;
    NSMutableArray<NSMutableDictionary*> *rssItems;
    NSMutableDictionary *item;
    NSMutableString *currentTitle;
    NSMutableString *currentDescription;
    NSMutableString *currentLink;
    NSMutableString *currentGuid;
    NSString *currentEnclosure;
    NSString *currentElement;
    __weak IBOutlet UIActivityIndicatorView *activityIndicator;
    
}
@end

@implementation RSSViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    activityIndicator.hidesWhenStopped = true;
    [activityIndicator startAnimating];
    [activityIndicator performSelector:@selector(stopAnimating) withObject:nil afterDelay:3.0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    rssItems = [[NSMutableArray alloc] init];
    self.RSSTableView.delegate = self;
    self.RSSTableView.dataSource = self;
    self.RSSTableView.scrollEnabled = true;
    [self.RSSTableView registerNib:[UINib nibWithNibName:@"RSSCellView" bundle:nil] forCellReuseIdentifier:@"RSSCellIdentifier"];

    NSURL* url = [NSURL URLWithString:_stringURL];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate: self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    RSSCellView *cell = [self.RSSTableView dequeueReusableCellWithIdentifier:@"RSSCellIdentifier"];
    cell.titleLabel.text = [[rssItems objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.descriptionLabel.text =[[rssItems objectAtIndex:indexPath.row] objectForKey:@"description"];
    if(![[[rssItems objectAtIndex:indexPath.row] objectForKey:@"enclosure"]  isEqual: @""]) {
        cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[rssItems objectAtIndex:indexPath.row] objectForKey:@"enclosure"]]]];
    }
        return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [rssItems count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  170;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RSSWebViewController* webView = [RSSWebViewController alloc];
    webView.webURL =[[rssItems objectAtIndex:indexPath.row] valueForKey:@"link"];
    [self presentViewController:webView animated:true completion:nil];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    currentElement = elementName;
    NSLog(@"currentElement %@", currentElement);
    if ([currentElement isEqualToString: @"item"]) {
        currentTitle = [[NSMutableString alloc] init];
        currentDescription = [[NSMutableString alloc] init];
        currentLink = [[NSMutableString alloc] init];
        currentGuid = [[NSMutableString alloc] init];
    }
    else if ([currentElement isEqualToString:@"enclosure"]){
        currentEnclosure = [attributeDict valueForKey:@"url"];
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if([currentElement isEqualToString:@"title"]) {
        [currentTitle appendString:string];
    }
    else if ([currentElement isEqualToString:@"description"])
        [currentDescription appendString:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    
    else if ([currentElement isEqualToString:@"link"])
        [currentLink appendString:string];
    else if ([currentElement isEqualToString:@"guid"])
        [currentGuid appendString:string];
    
    
    }
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName  isEqual: @"item"]) {
        NSMutableDictionary* item = [[NSMutableDictionary alloc] init];
        [item setObject:currentTitle forKey:@"title"];
        [item setObject:currentDescription forKey:@"description"];
        [item setObject:currentLink forKey:@"link"];
        [item setObject:currentGuid forKey:@"guid"];
        if (currentEnclosure != nil){
            [item setObject:currentEnclosure forKey:@"enclosure"];
        }
        else{
            [item setObject:@"" forKey:@"enclosure"];
        }
        [rssItems addObject:[item copy]];
    }
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    [_RSSTableView reloadData];
}

- (IBAction)backButtonTap:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
