//
//  cardMatchingGame.h
//  Matchismo
//
//  Created by 方子铭 on 15/10/11.
//  Copyright © 2015年 FangZiming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface cardMatchingGame : NSObject
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic) NSInteger gameType; // the type of the game (0=two card, 1=three card)
@property (nonatomic,readonly) NSInteger score;
@end
