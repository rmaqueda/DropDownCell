//
//  ViewController.m
//  TestScrool_2
//
//  Created by Ricardo Maqueda on 02/10/14.
//  Copyright (c) 2014 Ricardo Maqueda. All rights reserved.
//
#import "ViewController.h"
#import "MomentoView.h"
#import "OptionsView.h"
#import "GosstyView.h"
#import "GosstView.h"

#import <MapKit/MapKit.h>

typedef enum {
    kGosstyView = 0,
    kMomentView,
    kOptionView,
    kLikeGoingView,
    kDateView,
    kGosstView
} ViewsName;

@interface ViewController () <UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL firstBig;
@property (nonatomic) BOOL secondBig;
@property (nonatomic) BOOL thirdBig;
@property (nonatomic) BOOL sixthBig;

@property (nonatomic, strong) GosstyView *gosstyView;
@property (nonatomic, strong) MomentoView *momentView;
@property (nonatomic, strong) OptionsView *optionsView;
@property (nonatomic, strong) GosstView *gosstView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f);
    self.tableView.backgroundColor = [UIColor colorWithHue:0.673 saturation:0.505 brightness:0.784 alpha:1];
    
    [self configureAllViews];
}

-(void)configureAllViews
{
    self.gosstyView = [[GosstyView alloc] init];
    self.gosstyView.frame = CGRectMake(10, 40, self.gosstyView.frame.size.width, self.gosstyView.frame.size.height);
    self.gosstyView.backgroundColor = [UIColor clearColor];
    
    self.momentView = [[MomentoView alloc] init];
    self.momentView.frame = CGRectMake(10, 40, self.momentView.frame.size.width, self.momentView.frame.size.height);
    self.momentView.backgroundColor = [UIColor clearColor];
    
    self.optionsView = [[OptionsView alloc] init];
    self.optionsView.frame = CGRectMake(10, 40, self.optionsView.frame.size.width, self.optionsView.frame.size.height);
    self.optionsView.backgroundColor = [UIColor clearColor];
    
    self.gosstView = [[GosstView alloc] init];
    self.gosstView.frame = CGRectMake(10, 50, self.gosstView.frame.size.width, self.gosstView.frame.size.height);
    self.gosstView.backgroundColor = [UIColor clearColor];
}

#pragma mark - TableView Delegate and DataSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat h = 61;
    switch (indexPath.row) {
        case kGosstyView:
            if (self.firstBig) h = 170;
            break;
            
        case kMomentView:
            if (self.secondBig) h = 170;
            break;
            
        case kOptionView:
            if (self.thirdBig) h = 170;
            break;
           
        case kGosstView:
            if (self.sixthBig) h = 280;
            break;
            
        default:
            return h;
            break;
    }
    
    return h;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithHue:0.673 saturation:0.505 brightness:0.784 alpha:1];
    
    switch (indexPath.row) {
        case kGosstyView:
        {
            if (self.firstBig) {
                [cell addSubview:self.gosstyView];
            } else {
                [self.gosstyView removeFromSuperview];
            }
        }
            break;
            
        case kMomentView:
        {
            if (self.secondBig) {
                [cell addSubview:self.momentView];
            } else {
                [self.momentView removeFromSuperview];
            }
        }
            break;
            
        case kOptionView:
        {
            if (self.thirdBig) {
                [cell addSubview:self.optionsView];
            } else {
                [self.optionsView removeFromSuperview];
            }
        }
            break;
            
        case kGosstView:
        {
            if (self.sixthBig) {
                [cell addSubview:self.gosstView];
            } else {
                [self.gosstView removeFromSuperview];
            }
        }
            break;
            
        default:
            
            break;
    }
    
    return cell;
}

#pragma mark - Actions
- (IBAction)cell1:(id)sender
{
    self.firstBig = !self.firstBig;
    self.secondBig = NO;
    self.thirdBig = NO;
    self.sixthBig = NO;
    [self updateTableViewData];
}

- (IBAction)cell2:(id)sender
{
    self.firstBig = NO;
    self.secondBig = !self.secondBig;
    self.thirdBig = NO;
    self.sixthBig = NO;
    [self updateTableViewData];
}

- (IBAction)cell3:(id)sender
{
    self.firstBig = NO;
    self.secondBig = NO;
    self.thirdBig = !self.thirdBig;
    self.sixthBig = NO;
    [self updateTableViewData];
}

- (IBAction)gosstInfo:(id)sender
{
    self.firstBig = NO;
    self.secondBig = NO;
    self.thirdBig = NO;
    self.sixthBig = !self.sixthBig;
    [self updateTableViewData];
}

-(void)updateTableViewData
{
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    [self performSelector:@selector(delayedReloadData) withObject:nil afterDelay:0.1];
}

-(void)delayedReloadData
{
    [self.tableView reloadData];
}

@end
