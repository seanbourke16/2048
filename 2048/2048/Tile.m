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
    //shape.backgroundColor=[UIColor blueColor];
    shape.backgroundColor=[UIColor colorWithRed:100/255 green:100/255 blue:100/255 alpha:1];
    if(self.v!=0)shape.text=[NSString stringWithFormat:@"%d",self.v];
    shape.textAlignment=NSTextAlignmentCenter;
    shape.textColor=[UIColor whiteColor];
}

-(void)update{
    if(_v==0){
        shape.backgroundColor=[UIColor grayColor];
    }
    if(_v==2){
        shape.backgroundColor=[UIColor brownColor];
        //NSLog(@"%d2",_v);
    }
    if(_v==4){
        shape.backgroundColor=[UIColor orangeColor];
        //NSLog(@"%d4",_v);
    }
    if(_v==8){
        shape.backgroundColor=[UIColor magentaColor];
        //NSLog(@"%d8",_v);
    }
    if(_v==16){
        shape.backgroundColor=[UIColor yellowColor];
        //NSLog(@"%d16",_v);
    }
    if(_v==32){
        shape.backgroundColor=[UIColor redColor];
        //NSLog(@"%d32",_v);
    }
    if(_v==64){
        shape.backgroundColor=[UIColor greenColor];
        //NSLog(@"%d64",_v);
    }
    if(_v==128){
        shape.backgroundColor=[UIColor orangeColor];
    }
    if(_v==256){
        shape.backgroundColor=[UIColor magentaColor];
    }
    if(_v==512){
        shape.backgroundColor=[UIColor cyanColor];
    }
    if(_v==1024){
        shape.backgroundColor=[UIColor blueColor];
    }
    if(_v==2048){
        shape.backgroundColor=[UIColor purpleColor];
    }
    if(_v>2048){
        shape.backgroundColor=[UIColor blackColor];
    }
    if(_v==0)shape.text=[NSString stringWithFormat:@""];
    else shape.text=[NSString stringWithFormat:@"%d",_v];
    
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
