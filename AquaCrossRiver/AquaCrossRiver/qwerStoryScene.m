//
//  qwerStoryScene.m
//  AquaCrossRiver
//
//  Created by FrankieJhou on 14/1/14.
//  Copyright (c) 2014年 FrankieJhou. All rights reserved.
//

#import "qwerStoryScene.h"
#import "qwerMyScene.h"
@interface qwerStoryScene()
@property (nonatomic,strong)SKSpriteNode *story;
@end
@implementation qwerStoryScene
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.5 green:0.1 blue:0.5 alpha:1.0];
        
        _story = [SKSpriteNode spriteNodeWithImageNamed:@"font"];
        [_story setName:@"story"];
        _story.position = CGPointMake(CGRectGetMidX(self.frame),
                                         CGRectGetMinY(self.frame));
        [self addChild:_story];
        
        SKAction *moveUp = [SKAction moveByX: 0 y: 1000.0 duration: 10];
        
        SKAction *moveSequence = [SKAction sequence:@[moveUp]];
        [_story runAction: moveSequence];
        
        [self runAction:
         [SKAction sequence:@[
                              [SKAction waitForDuration:10],
                              [SKAction runBlock:^{
             // 5演示了在Sprite Kit中如何过渡到新的场景。首先可以选择任意的一种不同的动画过渡效果，用于场景的显示，在这里选择了翻转效果(持续0.5秒)。然后是创建一个想要显示的场景，接着使用self.view的方法presentScene:transition:来显示出场景。
             SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
             SKScene * myScene = [[qwerMyScene alloc] initWithSize:self.size];
             [self.view presentScene:myScene transition: reveal];
         }]
                              ]]
         ];
        
        
        
    }
    return self;
}

@end
