//
//  ViewController.m
//  Matchismo
//
//  Created by libandmooc on 15/9/22.
//  Copyright (c) 2015年 BROF. All rights reserved.
//

#import "ViewController.h"
//#import "PlayingCardDeck.h"
#import "cardMatchingGame.h"
@interface ViewController ()
@property (strong,nonatomic) Deck *deck;
@property (strong,nonatomic) cardMatchingGame* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtens;

@end

@implementation ViewController
-(cardMatchingGame *)game{
    if(!_game){
        _game=[[cardMatchingGame alloc] initWithCardCount:[self.cardButtens count]
                                                usingDeck:[self createdeck]];
    }
    return _game;
}

-(Deck *)createdeck{
    return nil;
}

- (IBAction)touchCardButten:(UIButton *)sender {
    int choosenIndex=[self.cardButtens indexOfObject:sender];
    [self.game chooseCardAtIndex:choosenIndex];
    [self updateUI];
}

-(void)updateUI{
    for(UIButton *cardButton in self.cardButtens){
        int cardIndex = [self.cardButtens indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
}
-(NSString *)titleForCard:(Card *)card{
    if(card.chosen){NSLog(card.contents);}
    return card.chosen ? card.contents : @"";
   
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.chosen? @"cardfront":@"cardback"];
}
@end






