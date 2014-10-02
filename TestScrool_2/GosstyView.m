//
//  GosstyName.m
//  TestScrool_2
//
//  Created by Ricardo Maqueda on 02/10/14.
//  Copyright (c) 2014 Ricardo Maqueda. All rights reserved.
//

#import "GosstyView.h"

@implementation GosstyView

-(id)init{
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"GosstyView" owner:self options:nil];
    id mainView = [subviewArray objectAtIndex:0];
    
    return mainView;
}

@end
