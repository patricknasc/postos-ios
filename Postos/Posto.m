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
    NSString *dados = [NSString stringWithFormat:@"Nome: %@ Bandeira: %@ Endereço: %@ Latitude: %@ Longitude: %@ Gasolina Comum: %@  Gasolina Aditivada: %@ Etanol: %@ Diesel; %@", self.nome_posto, self.bandeira_posto, self.endereco_posto, self.latitude_posto, self.longitude_posto, self.preco_gasolina_comum, self.preco_gasolina_aditivada, self.preco_etanol, self.preco_diesel];

    return dados;
    
}
@end
