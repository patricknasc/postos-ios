//
//  PostoViewController.h
//  Postos
//
//  Created by Fabricio on 26/11/16.
//  Copyright © 2016 iesb. All rights reserved.
// 

#import <UIKit/UIKit.h>

@interface PostoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *preco_gasolina_comum;

@property (weak, nonatomic) IBOutlet UITextField *preco_gasolina_aditivada;

@property (weak, nonatomic) IBOutlet UITextField *preco_etanol;

@property (weak, nonatomic) IBOutlet UITextField *preco_diesel;

@property (weak, nonatomic) IBOutlet UITextField *nome_posto;

@property (weak, nonatomic) IBOutlet UITextField *bandeira_posto;

@property (weak, nonatomic) IBOutlet UITextField *endereco_posto;

@property (weak, nonatomic) IBOutlet UILabel *latitude_posto;

@property (weak, nonatomic) IBOutlet UILabel *longitude_posto;

@property (strong) NSManagedObjectModel * posto;

- (IBAction)saveData:(id)sender;

- (IBAction)DismissKeyboard:(id)sender;



@end
