//
//  TempoViewController.m
//  Postos
//
//  Created by Fabricio on 27/11/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import "TempoViewController.h"

@interface TempoViewController ()

@end

@implementation TempoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Previsão do Tempo";
    
    NSString *urlStringCondicao = [NSString stringWithFormat:@"https://api.wunderground.com/api/d47ade75cf6c5a32/conditions/lang:BR/q/-26.825137,-49.269520.json"];
    
    NSString *urlStringPrevisao = [NSString stringWithFormat:@"https://api.wunderground.com/api/d47ade75cf6c5a32/forecast/lang:BR/q/-26.825137,-49.269520.json"];
    NSError *error;
    
    NSURLResponse *response;
    
    NSData *dataCondicao = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStringCondicao]]  returningResponse:&response error:&error];
    
    NSData *dataPrevisao = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStringPrevisao]]  returningResponse:&response error:&error];
    
    
    if (dataCondicao){
        NSData *jsonData = [NSJSONSerialization JSONObjectWithData:dataCondicao options:kNilOptions error:&error];
        
        NSData *currentData = [jsonData valueForKey:@"current_observation"];
        
        NSData *currentLocal = [currentData valueForKey:@"display_location"];
        
        NSString *temperatureString = [currentData valueForKey:@"temp_c"];
        
        NSString *cidade = [currentLocal valueForKey:@"city"];
        
        NSString *estado = [currentLocal valueForKey:@"state"];
        
        NSString *cidade_uf = [NSString stringWithFormat:@"%@ - %@", cidade, estado];
        
        NSString *temperatura_grau = [NSString stringWithFormat:@"%@º", temperatureString];
        
        NSString *condicao_atual = [currentData valueForKey:@"weather"];
        
        self.cidade_tempo.text = cidade_uf;
        
        self.temperatura.text = temperatura_grau;
        
        self.condicao.text = condicao_atual;
    }
    
    if (dataPrevisao){
        NSData *jsonPrevisao = [NSJSONSerialization JSONObjectWithData:dataPrevisao options:kNilOptions error:&error];
        
        NSData *previsaoData = [jsonPrevisao valueForKey:@"forecast"];
        
        NSData *previsaoArray = [previsaoData valueForKey:@"txt_forecast"];
        
        NSArray *forecastDay = [previsaoArray valueForKey:@"forecastday"];
        
        NSString *previsaoD1 = [forecastDay[2] valueForKey:@"fcttext_metric"];
        
        self.previsao_d1.text = previsaoD1;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
