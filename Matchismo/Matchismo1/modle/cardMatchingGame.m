//
//  cardMatchingGame.m
//  Matchismo
//
//  Created by 方子铭 on 15/10/11.
//  Copyright © 2015年 FangZiming. All rights reserved.
//

#import "cardMatchingGame.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"




@interface cardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of cardd
@end

@implementation cardMatchingGame


static const int MATCH_BONUS = 4;
static const int MATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;

-(NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if(self){
        for(int i=0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            } else{
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }
        else{
            for(Card *otherCard in self.cards){
                    if(otherCard.isChosen && (!otherCard.isMatched)){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else{
                        self.score -= MATCH_PENALTY;
                        otherCard.chosen = NO;
                        
                    }
                     break;
                }
               
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            
        }
    }
    
}

-(PlayingCard *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}


@end
















