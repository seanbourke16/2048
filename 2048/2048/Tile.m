//
//  Tile.m
//  2048
//
//  Created by Sean Bourke on 2/13/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Tile.h"

@implementation Tile
@synthesize shape;
-(id)init{
    self=[super init];
    length=75;
    height=75;
    _v=2;
    _label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    _label.textAlignment=NSTextAlignmentCenter;
    _label.text=[NSString stringWithFormat:@"%d",_v];
    _dx=100;
    _dy=100;
    //int r=(rand()/RAND_MAX)*2;
    /*if(r==0){
     v=2;
     }
     else{
     v=4;
     }*/
    return self;
}

-(void)pos{
    shape=[[UILabel alloc] initWithFrame:CGRectMake(_dx,_dy,80,80)];
    shape.backgroundColor=[UIColor blueColor];
    //shape.backgroundColor=[UIColor colorWithRed:100 green:100 blue:100 alpha:100];
    shape.text=[NSString stringWithFormat:@"%d",self.v];
    shape.textAlignment=NSTextAlignmentCenter;
    shape.textColor=[UIColor whiteColor];
}

-(void)move:(int)dir{
    if(dir==0){
        _dy+=10;
    }
    if(dir==1){
        _dx+=10;
    }
    if(dir==2){
        _dy-=10;
    }
    if(dir==3){
        _dx-=10;
    }
}

@end
