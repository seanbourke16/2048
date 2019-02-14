//
//  GameViewController.m
//  2048
//
//  Created by Sean Bourke on 2/13/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load the SKScene from 'GameScene.sks'
    /*GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    
    // Set the scale mode to scale to fit the window
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    SKView *skView = (SKView *)self.view;
    
    // Present the scene
    [skView presentScene:scene];
    
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;*/
    for(int i=0;i<4;i++){
     for(int p=0;p<4;p++){
         tile[i][p]=[[Tile alloc] init];
         tile[i][p].v=0;
     }
    }
    
    /*int f = arc4random_uniform(16);
    int u = arc4random_uniform(2);
    tile[f].v=(u+1)*2;
    int h = arc4random_uniform(4);
    while (h==f) {
        h =arc4random_uniform(4);
    }
    tile[h].v=(u+1)*2;
    Tile *t1=(Tile *)[self.view viewWithTag:0].init;
    NSLog(@"%@ %d",t1.label.text,t1.v);
    t1.backgroundColor=[UIColor redColor];*/
    
    
    //[tile[0][0] layoutSubviews];
    //CGRect screenBound = [[UIScreen mainScreen] bounds];
    //CGSize screenSize = screenBound.size;
    //int screenWidth = screenSize.width;
    //int screenHeight = screenSize.height;
    //NSLog(@"%d %d",screenWidth, screenHeight);
    for(int x=0;x<4;x++){
     for(int p=0;p<4;p++){
         tile[x][p].dx=30+p*93;
         tile[x][p].dy=70+x*100;
         [tile[x][p] pos];
         [tile[x][p] update];
         [self.view addSubview: tile[x][p].shape];
     }
    }
    
    
}

-(IBAction)newGame:(id)sender{
    for(int x=0;x<4;x++){
        for(int y=0;y<4;y++){
            tile[x][y].v=0;
            [tile[x][y] update];
        }
    }
    int f = arc4random_uniform(4);
    int g = arc4random_uniform(4);
    int u = arc4random_uniform(2);
    tile[f][g].v=(u+1)*2;
    int h = arc4random_uniform(4);
    int j = arc4random_uniform(4);
    u=arc4random_uniform(2);
    //NSLog(@"%d %d %d %d",f,g,h,j);
    while (h==f && g==j) {
        h = arc4random_uniform(4);
        j = arc4random_uniform(4);
    }
    tile[h][j].v=(u+1)*2;
    [tile[f][g] update];
    [tile[h][j] update];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(IBAction)left:(id)sender{
    Boolean m=false;
    for(int z=0;z<4;z++){
        for(int x=0;x<3;x++){
            //NSLog(@"%d %d %d %d",tile[z][x].v,tile[z][x+1].v,z,x);
            if(tile[z][x].v==0&&tile[z][x+1].v!=0){
                tile[z][x].v=tile[z][x+1].v;
                tile[z][x+1].v=0;
                if(x!=0)x-=2;
                else x--;
                m=true;
            }
            else if(tile[z][x].v!=0&&tile[z][x].v==tile[z][x+1].v){
                tile[z][x].v*=2;
                for(int y=x+1;y<4;y++){
                    tile[z][y].v=tile[z][y+1].v;
                    //[tile[z][y] move:3];
                }
                tile[z][3].v=0;
                m=true;
            }
            //NSLog(@"%d",tile[z][x].v);
        }
    }
    for(int x=0;x<4;x++){
        for(int y=0;y<4;y++){
            [tile[x][y] update];
        }
    }
    if(![self possible]){
        
    }
    if(m)[self newTile];
 }
 
-(IBAction)up:(id)sender{
    Boolean m=false;
    for(int x=0;x<4;x++){
        for(int z=0;z<3;z++){
            //NSLog(@"%d %d %d %d",tile[z][x].v,tile[z][x+1].v,z,x);
            if(tile[z][x].v==0&&tile[z+1][x].v!=0){
                tile[z][x].v=tile[z+1][x].v;
                tile[z+1][x].v=0;
                if(z!=0)z-=2;
                else z--;
                m=true;
            }
            else if(tile[z][x].v!=0&&tile[z][x].v==tile[z+1][x].v){
                tile[z][x].v*=2;
                /*for(int y=x+1;y<4;y++){
                    tile[z][y].v=tile[z][y+1].v;
                    //[tile[z][y] move:3];
                }
                tile[z][3].v=0;*/
                tile[z+1][x].v=0;
                m=true;
            }
            //NSLog(@"%d",tile[z][x].v);
        }
    }
    for(int x=0;x<4;x++){
        for(int y=0;y<4;y++){
            [tile[x][y] update];
        }
    }
    if(![self possible]){
        
    }
    if(m)[self newTile];
}
-(IBAction)right:(id)sender{
    Boolean m=false;
    for(int z=3;z>=0;z--){
        for(int x=3;x>0;x--){
            //NSLog(@"%d %d %d %d",tile[z][x].v,tile[z][x+1].v,z,x);
            if(tile[z][x].v==0&&tile[z][x-1].v!=0){
                tile[z][x].v=tile[z][x-1].v;
                tile[z][x-1].v=0;
                if(x!=3)x+=2;
                else x++;
                m=true;
            }
            else if(tile[z][x].v!=0&&tile[z][x].v==tile[z][x-1].v){
                tile[z][x].v*=2;
                /*for(int y=x+1;y<4;y++){
                    tile[z][y].v=tile[z][y+1].v;
                    //[tile[z][y] move:3];
                }
                tile[z][3].v=0;*/
                tile[z][x-1].v=0;
                m=true;
            }
            //NSLog(@"%d",tile[z][x].v);
        }
    }
    for(int x=0;x<4;x++){
        for(int y=0;y<4;y++){
            [tile[x][y] update];
        }
    }
    if(![self possible]){
        
    }
    if(m)[self newTile];
}
-(IBAction)down:(id)sender{
    Boolean m=false;
    for(int x=3;x>=0;x--){
        for(int z=3;z>0;z--){
            //NSLog(@"%d %d %d %d",tile[z][x].v,tile[z-1][x].v,z,x);
            if(tile[z][x].v==0&&tile[z-1][x].v!=0){
                tile[z][x].v=tile[z-1][x].v;
                tile[z-1][x].v=0;
                if(z!=3)z+=2;
                else z++;
                m=true;
            }
            else if(tile[z][x].v!=0&&tile[z][x].v==tile[z-1][x].v){
                tile[z][x].v*=2;
                /*for(int y=x+1;y<4;y++){
                 tile[z][y].v=tile[z][y+1].v;
                 //[tile[z][y] move:3];
                 }
                 tile[z][3].v=0;*/
                tile[z-1][x].v=0;
                m=true;
            }
            //NSLog(@"%d",tile[z][x].v);
        }
    }
    for(int x=0;x<4;x++){
        for(int y=0;y<4;y++){
            [tile[x][y] update];
        }
    }
    if(![self possible]){
        
    }
    if(m)[self newTile];
}

-(Boolean)possible{
    for(int x=0;x<4;x++){
        for(int y=0;y<3;y++){
            if(tile[x][y].v==0||tile[x][y+1].v==0)return true;
            if(tile[y][x].v==0||tile[y+1][x].v==0)return true;
            if(tile[x][y].v==tile[x][y+1].v)return true;
            if(tile[y][x].v==tile[y+1][x].v)return true;
        }
    }
    return false;
}

-(void)newTile{
    NSString * ret[16];
    int num=0;
    ret[0]=[NSString stringWithFormat:@"%d",num];
    for(int x=0;x<4;x++){
        for(int y=0;y<4;y++){
            if(tile[x][y].v==0){
                ret[num]=[NSString stringWithFormat:@"%d %d",x,y];
                num++;
            }
        }
    }
    int r=arc4random_uniform(num);
    int u=arc4random_uniform(2);
    int x=[[ret[r] componentsSeparatedByString:@" "][0] intValue];
    int y=[[ret[r] componentsSeparatedByString:@" "][1] intValue];
    tile[x][y].v=(u+1)*2;
    [tile[x][y] update];
}

@end
