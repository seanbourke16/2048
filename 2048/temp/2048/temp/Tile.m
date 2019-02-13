//
//  Tile.m
//  2048
//
//  Created by Sean Bourke on 2/12/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#import "Tile.h"

@implementation Tile
@synthesize shape;
-(id)init{
    self=[super init];
    length=75;
    height=75;
    //int r=(rand()/RAND_MAX)*2;
    /*if(r==0){
     v=2;
     }
     else{
     v=4;
     }*/
    return self;
}

-(void)pos:(id)sender{
    shape=[[UIImageView alloc] initWithFrame:CGRectMake(100,100,200,100)];
}

@end
