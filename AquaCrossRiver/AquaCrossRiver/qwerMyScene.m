//
//  qwerMyScene.m
//  AquaCrossRiver
//
//  Created by FrankieJhou on 14/1/13.
//  Copyright (c) 2014年 FrankieJhou. All rights reserved.

#import "qwerMyScene.h"

@interface qwerMyScene()
@property (nonatomic,strong)SKSpriteNode *background;
@property (nonatomic,strong)SKSpriteNode *title;
@end
@implementation qwerMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        //background
        _background = [SKSpriteNode spriteNodeWithImageNamed:@"in.jpg"];
        [_background setName:@"background"];
        _background.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        [self addChild:_background];
        
        //title
        _title = [SKSpriteNode spriteNodeWithImageNamed:@"Title.png"];
        [_title setName:@"title"];
        _title.position = CGPointMake(CGRectGetMidX(self.frame), (CGRectGetMaxY(self.frame)-CGRectGetMidY(self.frame)/1.5));
        [self addChild:self.title];

        //start
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        myLabel.text = @"Start";
        myLabel.fontSize = 45;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame)-myLabel.fontSize*1);
        
        //story
        SKLabelNode *myLabel2 = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        myLabel2.text = @"Story";
        myLabel2.fontSize =  myLabel.fontSize;
        myLabel2.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame)-myLabel.fontSize*2.5);
        [self addChild:myLabel];
        [self addChild:myLabel2];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *forg = [SKSpriteNode spriteNodeWithImageNamed:@"frog02"];
        
        forg.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [forg runAction:[SKAction repeatActionForever:action]];
        
        //[self addChild:forg];
    }
    
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];

    /*
    if ([_settingsBtn containsPoint:location]) {
        UIViewController *vc = self.view.window.rootViewController;
        [vc performSegueWithIdentifier:@"startSeque" sender:self];
    }*/
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
