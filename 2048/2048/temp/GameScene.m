//
//  GameScene.m
//  2048
//
//  Created by Sean Bourke on 2/7/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    // Get label node from scene and store it for use later
    _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
    
    _label.alpha = 0.0;
    [_label runAction:[SKAction fadeInWithDuration:2.0]];
    
    CGFloat w = (self.size.width + self.size.height) * 0.05;
    
    // Create shape node to use during mouse interaction
    _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
    _spinnyNode.lineWidth = 2.5;
    
    [_spinnyNode runAction:[SKAction repeatActionForever:[SKAction rotateByAngle:M_PI duration:1]]];
    [_spinnyNode runAction:[SKAction sequence:@[
                                                [SKAction waitForDuration:0.5],
                                                [SKAction fadeOutWithDuration:0.5],
                                                [SKAction removeFromParent],
                                                ]]];
}


- (void)touchDownAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor greenColor];
    [self addChild:n];
}

- (void)touchMovedToPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor blueColor];
    [self addChild:n];
}

- (void)touchUpAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor redColor];
    [self addChild:n];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Run 'Pulse' action from 'Actions.sks'
    [_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
    
    for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

/*-(id)initWithCoder:(NSCoder *)aDecoder {
    self=[super initWithCoder:aDecoder];
    if(self){
        
        for(int i=0;i<4;i++){
            for(int p=0;p<4;p++){
                tile[i][p]=[[Tile alloc] init];
                tile[i][p].v=0;
            }
        }
        
        int f = (rand()/RAND_MAX) * 4;
        int g = (rand()/RAND_MAX)*4;
        int u = (rand()/RAND_MAX)*2;
        tile[f][g].v=(u+1)*2;
        int h = (rand()/RAND_MAX) * 4;
        int j = (rand()/RAND_MAX)*4;
        u=(rand()/RAND_MAX)*2;
        while (h==f && g==j) {
            h = (rand()/RAND_MAX) * 4;
            j = (rand()/RAND_MAX)*4;
        }
        tile[h][j].v=(u+1)*2;
        for(int x=0;x<4;x++){
            for(int p=0;p<4;p++){
                [tile[x][p] pos:self];
            }
        }

    }
    return self;
}*/

@end

/*
@interface Tile : NSObject {
    
    int height;
    int length;
    int v;
    int xcor;
    int ycor;
    
}

@property(nonatomic,readwrite) double value;
-(Boolean) move: (Tile *) t1;

@end

@interface Game : NSObject{
    Tile *x1 [4];
    Tile *x2 [4];
    Tile *x3 [4];
    Tile *x4 [4];
}
-(id) init;
-(void) swipe;

@end
@implementation Game

-(id)init{
    self=[super init];
    int f = (rand()/RAND_MAX) * 4;
    int g = (rand()/RAND_MAX)*4;
    if(f==0)x1[g]=[[Tile alloc] init];
    if(f==1)x2[g]=[[Tile alloc] init];
    if(f==2)x3[g]=[[Tile alloc] init];
    if(f==3)x4[g]=[[Tile alloc] init];
    int h = (rand()/RAND_MAX) * 4;
    int j = (rand()/RAND_MAX)*4;
    while (h==f && g==j) {
        h = (rand()/RAND_MAX) * 4;
        j = (rand()/RAND_MAX)*4;
    }
    if(h==0)x1[j]=[[Tile alloc] init];
    if(h==1)x2[j]=[[Tile alloc] init];
    if(h==2)x3[j]=[[Tile alloc] init];
    if(h==3)x4[j]=[[Tile alloc] init];
    
    int x;
    for(x=0;x<4;x++){
        if(x1[x]==NULL){
            x1[x]=[[Tile alloc] init];
            x1[x].value=0;
        }
        if(x2[x]==NULL){
            x2[x]=[[Tile alloc] init];
            x2[x].value=0;
        }if(x3[x]==NULL){
            x3[x]=[[Tile alloc] init];
            x3[x].value=0;
        }
        if(x3[x]==NULL){
            x3[x]=[[Tile alloc] init];
            x3[x].value=0;
        }
    }
    return self;
}

-(void)swipeLeft{
    int x;
    for(x=0;x<4;x++){
        
    }
}

@end

@implementation Tile

-(id)init{
    self=[super init];
    length=75;
    height=75;
    int r=(rand()/RAND_MAX)*2;
    if(r==0){
        v=2;
    }
    else{
        v=4;
    }
    return self;
}

-(Boolean) move: (Tile *) t1{
    if(t1->v==self->v){
        self.value=v*2;
        return true;
    }
    else{
        return false;
    }
}
@end*/
