//
//  ViewController.m
//  finalAsg
//
//  Created by Saurabh Vidhate on 30/11/21.
//

#import "ViewController.h"
#import "RSSViewController.h"

@interface ViewController ()
- (IBAction)addURL:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *inputURL;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *listURL;

@end

@implementation ViewController
NSInteger currentIndex = 0;


- (void)viewDidLoad {
    [super viewDidLoad];
    _listURL = [[NSMutableArray alloc] init];
    //[_listURL addObject:@"ASDFG"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.inputURL.delegate = self;
    
    // Do any additional setup after loading the view.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _listURL[indexPath.row];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_listURL count];
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RSSViewController* newController = [[RSSViewController alloc] init];//RSSViewController(_listURL[indexPath.row]);
    newController.stringURL = [_listURL objectAtIndex:indexPath.row];
    newController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:newController animated:true completion:nil];
}
- (IBAction)addURL:(id)sender {
    [_listURL addObject:_inputURL.text];
    
    [self.tableView reloadData];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}
@end
