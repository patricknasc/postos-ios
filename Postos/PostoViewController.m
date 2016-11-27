//
//  PostoViewController.m
//  Postos
//
//  Created by Fabricio on 26/11/16.
//  Copyright © 2016 iesb. All rights reserved.
// 

#import "PostoViewController.h"
#import <CoreData/CoreData.h>

@interface PostoViewController ()

@end

@implementation PostoViewController

@synthesize posto;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)saveData:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newPosto = [NSEntityDescription insertNewObjectForEntityForName:@"Posto" inManagedObjectContext:context];
    
    
    [newPosto setValue:self.preco_gasolina_comum.text forKey:@"precoGasolinaComum"];
    [newPosto setValue:self.preco_gasolina_aditivada.text forKey:@"precoGasolinaAditivada"];
    [newPosto setValue:self.preco_etanol.text forKey:@"precoEtanol"];
    [newPosto setValue:self.preco_diesel.text forKey:@"precoDiesel"];
    
    [newPosto setValue:self.nome_posto.text forKey:@"nomePosto"];
    [newPosto setValue:self.bandeira_posto.text forKey:@"bandeiraPosto"];
    [newPosto setValue:self.endereco_posto.text forKey:@"enderecoPosto"];
    
    [newPosto setValue:self.latitude_posto.text forKey:@"latitudePosto"];
    [newPosto setValue:self.longitude_posto.text forKey:@"longitudePosto"];
    
    
    
    //Definição da bandeira do posto
    if([[self.bandeira_posto.text lowercaseString] isEqualToString:@"ale"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"posto ale"]){
        
        [newPosto setValue:@"ale" forKey:@"bandeiraPosto"];
        
    } else if([[self.bandeira_posto.text lowercaseString] isEqualToString:@"br"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"posto br"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"petrobras"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"posto petrobras"]){
        
        [newPosto setValue:@"br" forKey:@"bandeiraPosto"];
        
    } else if([self.bandeira_posto.text isEqualToString:@""] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"branca"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"bandeira branca"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"sem bandeira"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"posto sem bandeira"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"vazia"]){
        
        [newPosto setValue:@"branca.png" forKey:@"bandeiraPosto"];
        
    } else if([[self.bandeira_posto.text lowercaseString] isEqualToString:@"esso"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"posto esso"]){
        
        [newPosto setValue:@"esso" forKey:@"bandeiraPosto"];
        
    } else if([[self.bandeira_posto.text lowercaseString] isEqualToString:@"gasoline"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"posto gasoline"]){
        
        [newPosto setValue:@"gasoline" forKey:@"bandeiraPosto"];
        
    } else if([[self.bandeira_posto.text lowercaseString] isEqualToString:@"ipiranga"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"posto ipiranga"]){
        
        [newPosto setValue:@"ipiranga" forKey:@"bandeiraPosto"];
        
    } else if([[self.bandeira_posto.text lowercaseString] isEqualToString:@"shell"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"posto shell"]){
        
        [newPosto setValue:@"shell" forKey:@"bandeiraPosto"];
        
    } else if([[self.bandeira_posto.text lowercaseString] isEqualToString:@"texaco"] ||
       [[self.bandeira_posto.text lowercaseString] isEqualToString:@"posto texaco"]){
        
        [newPosto setValue:@"texaco" forKey:@"bandeiraPosto"];
        
    } else { //NDA
        
        [newPosto setValue:@"vazio" forKey:@"bandeiraPosto"];
    }
    
    
    NSError *error = nil;
    
    if(![context save:&error]){
        NSLog(@"%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (IBAction)DismissKeyboard:(id)sender {
    [self resignFirstResponder];
}


@end
