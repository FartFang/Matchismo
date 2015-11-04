//
//  playViewController.m
//  Matchismo1
//
//  Created by 方子铭 on 15/10/19.
//  Copyright © 2015年 FangZiming. All rights reserved.
//

#import "playViewController.h"
#import "PlayingCardDeck.h"
@interface playViewController ()

@end

@implementation playViewController
-(Deck *)createdeck{
    return [[PlayingCardDeck alloc] init];
}



@end
