//
//  PostosTableViewController.m
//  Postos
//
//  Created by Patrick Nascimento on 25/11/16.
//  Copyright © 2016 iesb. All rights reserved.
// 

#import "PostosTableViewController.h"
#import "PostoTableViewCell.h"

@interface PostosTableViewController ()

@end

@implementation PostosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    //UIBarButtonItem *botaoAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
    
    //self.navigationItem.rightBarButtonItem = botaoAdd;
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"Postos de Combustíveis";
    self.postoDao = [PostoDAO postoDaoInstance];
    
    
    //TODO: Apagar! Populando temporariamente.
    self.postos = [[NSArray alloc]init];
    
    Posto *p1 = [[Posto alloc] init];
    Posto *p2 = [[Posto alloc] init];
    
    
    p1.precoGasolinaComum = @"3,00";
    p1.precoGasolinaAditivada = @"4,00";
    p1.precoDiesel = @"2,00";
    p1.precoEtanol = @"1,00";
    p1.nomePosto = @"Nome do Posto 1";
    p1.bandeiraPosto = @"esso.png";
    p1.enderecoPosto = @"Endereço do Posto 1";
    p1.latitudePosto = @"1,000000";
    p1.longitudePosto = @"2,000000";
    
    
    p2.precoGasolinaComum = @"3,50";
    p2.precoGasolinaAditivada = @"4,50";
    p2.precoDiesel = @"2,50";
    p2.precoEtanol = @"1,50";
    p2.nomePosto = @"Nome do Posto 2";
    p2.bandeiraPosto = @"br.png";
    p2.enderecoPosto = @"Endereço do Posto 2";
    p2.latitudePosto = @"1,500000";
    p2.longitudePosto = @"2,500000";
    
    [self addPosto: p1];
    [self addPosto: p2];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.postos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *CellIdentifier = @"CellIdentifier";
    PostoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    int row = (int)[indexPath row];
    NSLog(@">>%@", _postos[row]);
    Posto *p = (Posto *)_postos[row];
    
    cell.LblPrecoGasolinaComum.text = p.precoGasolinaComum;
    cell.LblPrecoGasolinaAditivada.text = p.precoGasolinaAditivada;
    cell.LblPrecoDiesel.text = p.precoDiesel;
    cell.LblPrecoEtanol.text = p.precoEtanol;
    cell.LblNomePosto.text = p.nomePosto;
    NSLog(@">>%@", p.nomePosto);
    cell.LblEnderecoPosto.text = p.enderecoPosto;
    cell.ImgBandeiraPosto.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@/%@", @"Images/", p.bandeiraPosto]];
    NSLog(@">>%@", p.bandeiraPosto);
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void) exibeFormulario {
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"FormPosto"];
//    
//    if (self.postoSelecionado){
//        form.posto = self.postoSelecionado;
//    }
//    
//    self.postoSelecionado = nil;
//    
//    [self.navigationController pushViewController:form animated:YES];
    
}


+ (void) logPosto:(Posto *)posto {
    NSLog(@"%@",posto);

}

- (void) allPostos{
    for(Posto *p in self.postos){
        NSLog(@"%@",p);
    }
}

- (void) addPosto:(Posto *)posto{
    NSMutableArray *temp = [self.postos mutableCopy];
    [temp addObject:posto];
    self.postos = temp;
}

@end
