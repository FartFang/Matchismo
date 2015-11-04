//
//  PlayingCard.h
//  
//
//  Created by libandmooc on 15/9/22.
//
//

#import "Card.h"
@interface PlayingCard : Card{
//    NSString *_suit;
}

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;
- (int)match:(NSArray *)otherCards;
@end
