//
//  TileView.m
//  hello world
//
//  Created by Sean Bourke on 2/12/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TileView.h"

@implementation TileView


-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
    }
    return self;
}


-(void)showTile{
    self.tileImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
    [self addSubview:self.tileImage];
    self.tileImage.backgroundColor=[UIColor blueColor];
}

@end
