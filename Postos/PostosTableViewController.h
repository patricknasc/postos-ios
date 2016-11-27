//
//  PostosTableViewController.h
//  Postos
//
//  Created by Patrick Nascimento on 25/11/16.
//  Copyright © 2016 iesb. All rights reserved.
// 

#import <UIKit/UIKit.h>
#import "PostoDAO.h"
#import "Posto.h"


@interface PostosTableViewController : UITableViewController

//@property NSArray *postos;
@property PostoDAO *postoDao;
@property Posto *postoSelecionado;


+ (void) logPosto:(Posto *)posto;
- (void) allPostos;
- (void) addPosto:(Posto *)posto;

@end
