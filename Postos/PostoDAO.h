//
//  PostoDAO.h
//  Postos Combustíveis
//
//  Created by Fabricio on 16/11/16.
//  Copyright © 2016 Fabricio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Posto.h"

@interface PostoDAO : NSObject

@property NSMutableArray *listaPostos;

-(void) adicionaPosto: (Posto *) posto;
-(NSInteger) total;
-(Posto *) postoIndice: (NSInteger) indice;
+(PostoDAO *) postoDaoInstance;
-(void) removePosto: (Posto *) posto;

@end
