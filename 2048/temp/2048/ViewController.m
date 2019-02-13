//
//  ViewController.m
//  hello world
//
//  Created by Sean Bourke on 1/28/19.
//  Copyright © 2019 Sean Bourke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //t1.label.text=[NSString stringWithFormat:@"%d",10];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)startGame:(id)sender{
    self.view.backgroundColor=[UIColor redColor];
    
    /*for(int i=0;i<4;i++){
        for(int p=0;p<4;p++){
            tile[i][p]=[[Tile alloc] init];
            tile[i][p].v=0;
        }
    }*/
    
    int f = arc4random_uniform(16);
    int u = arc4random_uniform(2);
    tile[f].v=(u+1)*2;
    int h = arc4random_uniform(4);
    while (h==f) {
        h =arc4random_uniform(4);
    }
    tile[h].v=(u+1)*2;
    Tile *t1=(Tile *)[self.view viewWithTag:0].init;
    NSLog(@"%@ %d",t1.label.text,t1.v);
    t1.backgroundColor=[UIColor redColor];
    
    
    /*int g = arc4random_uniform(4);
    int u = arc4random_uniform(2);
    tile[f][g].v=(u+1)*2;
    int h = arc4random_uniform(4);
    int j = arc4random_uniform(4);
    u=arc4random_uniform(2);
    //NSLog(@"%d %d %d %d",f,g,h,j);
    while (h==f && g==j) {
        h = (rand()/RAND_MAX) * 4;
        j = (rand()/RAND_MAX)*4;
    }
    tile[h][j].v=(u+1)*2;
    //[tile[0][0] layoutSubviews];
    for(int x=0;x<4;x++){
        for(int p=0;p<4;p++){
            [tile[x][p] pos];
        }
    }*/
}

-(IBAction)left:(id)sender{
    for(int x=0;x<4;x++){
        for(int y=0;y<3;y++){
            if(tile[x*4+y].v==tile[x*4+y+1].v){
                tile[x*4+y].v*=2;
                int z;
                for(z=x*4+y+1;z<x*4+3;z++){
                    tile[z].v=tile[z+1].v;
                }
                tile[z].v=0;
            }
        }
    }
}

-(IBAction)up:(id)sender{
    for(int x=0;x<4;x++){
        for(int y=0;y<3;y++){
            if(tile[x+y*4].v==tile[x+y*4+1].v){
                tile[x+y*4].v*=2;
                int z;
                for(z=x+y*4+1;z<x*4+3;z++){
                    tile[z].v=tile[z+1].v;
                }
                tile[z].v=0;
            }
        }
    }
}

-(IBAction)right:(id)sender{
    for(int x=0;x<4;x++){
        for(int y=0;y<3;y++){
            if(tile[x*4+y].v==tile[x*4+y+1].v){
                tile[x*4+y].v*=2;
                int z;
                for(z=x*4+y+1;z<x*4+3;z++){
                    tile[z].v=tile[z+1].v;
                }
                tile[z].v=0;
            }
        }
    }
}

-(IBAction)down:(id)sender{
    for(int x=0;x<4;x++){
        for(int y=0;y<3;y++){
            if(tile[x*4+y].v==tile[x*4+y+1].v){
                tile[x*4+y].v*=2;
                int z;
                for(z=x*4+y+1;z<x*4+3;z++){
                    tile[z].v=tile[z+1].v;
                }
                tile[z].v=0;
            }
        }
    }
}


/*-(IBAction)left:(id)sender{
    for(int z=0;z<4;z++){
        for(int x=0;x<3;x++){
            if(tile[z][x].v==tile[z][x+1].v){
                tile[z][x].v*=2;
                for(int y=x+1;y<4;y++){
                    [tile[z][y] move:3];
                }
            
            }
        }
    }
}
-(IBAction)right:(id)sender{
    for(int z=0;z<4;z++){
        for(int x=0;x<3;x++){
            if(tile[z][x].v==tile[z][x+1].v){
                tile[z][x].v*=2;
                for(int y=x+1;y<4;y++){
                    [tile[z][y] move:3];
                }
                
            }
        }
    }
}
-(IBAction)up:(id)sender{
    for(int z=0;z<4;z++){
        for(int x=0;x<3;x++){
            if(tile[z][x].v==tile[z][x+1].v){
                tile[z][x].v*=2;
                for(int y=x+1;y<4;y++){
                    [tile[z][y] move:3];
                }
                
            }
        }
    }
}
-(IBAction)down:(id)sender{
    for(int z=0;z<4;z++){
        for(int x=0;x<3;x++){
            if(tile[z][x].v==tile[z][x+1].v){
                tile[z][x].v*=2;
                for(int y=x+1;y<4;y++){
                    [tile[z][y] move:3];
                }
                
            }
        }
    }
}*/

@end
