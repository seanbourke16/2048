//
//  Tile.m
//  hello world
//
//  Created by Sean Bourke on 2/12/19.
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
    shape=[[UILabel alloc] initWithFrame:CGRectMake(10,10,200,200)];
    shape.backgroundColor=[UIColor blueColor];
}

-(void)move:(int)dir{
    if(dir==0){
        dy+=10;
    }
    if(dir==1){
        dx+=10;
    }
    if(dir==2){
        dy-=10;
    }
    if(dir==3){
        dx-=10;
    }
}

@end
