//
//  MomentoView.m
//  TestScrool_2
//
//  Created by Ricardo Maqueda on 02/10/14.
//  Copyright (c) 2014 Ricardo Maqueda. All rights reserved.
//

#import "MomentoView.h"

@implementation MomentoView

-(id)init{
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"Moment" owner:self options:nil];
    id mainView = [subviewArray objectAtIndex:0];
    
    return mainView;
}

@end
