//
//  PostoDAO.m
//  Postos Combustíveis
//
//  Created by Fabricio on 16/11/16.
//  Copyright © 2016 Fabricio. All rights reserved.
//

#import "PostoDAO.h"

@implementation PostoDAO

static PostoDAO *defaultDao = nil;

-(id) init{
    self = [super init];
    if (self){
        self.listaPostos = [NSMutableArray new];
    }
    return self;
}
+(PostoDAO*) postoDaoInstance {
    if (!defaultDao){
        defaultDao = [PostoDAO new];
    }
    return defaultDao;
}
-(void) adicionaPosto:(Posto *)posto{
    [self.listaPostos addObject:posto];
}

-(NSInteger) total{
    return self.listaPostos.count;
}

-(Posto *)postoIndice:(NSInteger) indice{
    return self.listaPostos[indice];
}

-(void)removePosto:(Posto *)posto{
    [self.listaPostos removeObject:posto];
}
@end
