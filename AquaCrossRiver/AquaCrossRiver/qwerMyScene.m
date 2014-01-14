//
//  qwerMyScene.m
//  AquaCrossRiver
//
//  Created by FrankieJhou on 14/1/13.
//  Copyright (c) 2014年 FrankieJhou. All rights reserved.
//

#import "qwerMyScene.h"
#import "qwerGameview.h"
#import "qwerStoryScene.h"
@interface qwerMyScene()
@property (nonatomic,strong)SKSpriteNode *background;
@property (nonatomic,strong)SKSpriteNode *title;
@property (nonatomic,strong)SKLabelNode * startBtn;
@property (nonatomic,strong)SKLabelNode * storyBtn;
@property (nonatomic) NSTimeInterval lastactitleimeInterval;
@end
@implementation qwerMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        _background = [SKSpriteNode spriteNodeWithImageNamed:@"in.jpg"];
        [_background setName:@"background"];
        _background.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        [self addChild:_background];
        
        _title = [SKSpriteNode spriteNodeWithImageNamed:@"Title.png"];
        [_title setName:@"title"];
        _title.position = CGPointMake(CGRectGetMidX(self.frame),
                                           (CGRectGetMaxY(self.frame)-CGRectGetMidY(self.frame)/1.5));

        
        [self addChild:_title];
        
        _startBtn = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        _startBtn.text = @"Start";
        _startBtn.fontSize = 45;
        _startBtn.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame)-_startBtn.fontSize*1);
        _storyBtn = [SKLabelNode labelNodeWithFontNamed:@"Courier"];
        _storyBtn.text = @"Story";
        _storyBtn.fontSize =  _startBtn.fontSize;
        _storyBtn.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame)-_startBtn.fontSize*2.5);
        [self addChild:_startBtn];
        [self addChild:_storyBtn];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    CGFloat strbtnXmin = _startBtn.position.x-_startBtn.frame.size.width/2;
    CGFloat strbtnXmax = _startBtn.position.x+_startBtn.frame.size.width/2;
    CGFloat strbtnYmin = _startBtn.position.y-_startBtn.frame.size.height/2;
    CGFloat strbtnYmax = _startBtn.position.y+_startBtn.frame.size.height/2;
    
    CGFloat stobtnXmin = _storyBtn.position.x-_storyBtn.frame.size.width/2;
    CGFloat stobtnXmax = _storyBtn.position.x+_storyBtn.frame.size.width/2;
    CGFloat stobtnYmin = _storyBtn.position.y-_storyBtn.frame.size.height/2;
    CGFloat stobtnYmax = _storyBtn.position.y+_storyBtn.frame.size.height/2;
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        NSLog(@"location: %f,%f",location.x,location.y);
        if (location.x < strbtnXmax
            && location.y < strbtnYmax
            && location.x > strbtnXmin
            && location.y > strbtnYmin
            ) {
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            SKScene * Gameview = [[qwerGameview alloc] initWithSize:self.size ];
            [self.view presentScene:Gameview transition: reveal];
        }
        if (location.x < stobtnXmax
            && location.y < stobtnYmax
            && location.x > stobtnXmin
            && location.y > stobtnYmin
            ) {
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            SKScene * storyScene = [[qwerStoryScene alloc] initWithSize:self.size ];
            [self.view presentScene:storyScene transition: reveal];
        }
        
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastactitleimeInterval += timeSinceLast;
    if (self.lastactitleimeInterval > 1) {
        self.lastactitleimeInterval = 0;
        [self movetitle];
    }
}
- (void)movetitle {
    


    int minY = _title.size.height / 2;
    int maxY = _title.size.height * 2;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    int minX = _title.size.width / 2;
    int maxX = _title.size.width * 2;
    int rangeX = maxX - minX;
    int actualX = (arc4random() % rangeX) + minX;

    int actualDuration = 0.1;
    
    // Create the actions
    SKAction * actionMove = [SKAction moveTo:(CGPointMake(actualX, actualY)) duration:actualDuration];
    [_title runAction:[SKAction sequence:@[actionMove]]];
}


@end
