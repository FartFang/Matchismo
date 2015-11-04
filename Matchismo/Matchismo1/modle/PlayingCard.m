//
//  PlayingCard.m
//  
//
//  Created by libandmooc on 15/9/22.
//
//


#import "PlayingCard.h"
@interface PlayingCard(){
    NSString *_xxxxx;
}
@end

@implementation PlayingCard

-(NSString *)contents{
    NSArray *rankStrings=[PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
//@synthesize suit=_suit;
+(NSArray *)validSuits{
    return @[@"♥︎",@"♦︎",@"♣︎",@"♣︎"];
}
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if([otherCards count]==1){
        id card=[otherCards firstObject];
        if([card isKindOfClass:[PlayingCard class]])
        {
        PlayingCard *otherCard=(PlayingCard *)card;
        if(otherCard.rank==self.rank){
            score=4;
        }
        else if([otherCard.suit isEqualToString:self.suit]){
            score=1;
        }
        else {score=0;}
        }
        
    }

    return score;
}
+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+(NSUInteger)maxRank{
    return [[self rankStrings] count]-1;
}
//-(void)setSuit:(NSString *)suit{
//    if([[PlayingCard validSuits] containsObject:suit]){
//        _suit=suit;
//    }
//}
-(void)setRank:(NSUInteger)rank{
    if(rank<=[PlayingCard maxRank]){
        _rank=rank;
    }
}
-(NSString *)suit{

        return _suit ? _suit : @"?";
}



//-(NSUInteger)rank{
//    return _rank;
//}
@end