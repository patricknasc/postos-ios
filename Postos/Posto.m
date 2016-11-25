	//
//  Posto.m
//  Postos Combustíveis
//
//  Created by Fabricio on 15/11/16.
//  Copyright © 2016 Fabricio. All rights reserved.
//

#import "Posto.h"

@implementation Posto
-(NSString *) description {
    NSString *dados = [NSString stringWithFormat:@"Nome: %@ Bandeira: %@ Endereço: %@ Latitude: %@ Longitude: %@ Gasolina Comum: %@  Gasolina Aditivada: %@ Etanol: %@ Diesel; %@", self.nomePosto, self.bandeiraPosto, self.enderecoPosto, self.latitudePosto, self.longitudePosto, self.precoGasolinaComum, self.precoGasolinaAditivada, self.precoEtanol, self.precoDiesel];

    return dados;
    
}
@end
