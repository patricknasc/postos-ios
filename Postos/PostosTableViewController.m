//
//  PostosTableViewController.m
//  Postos
//
//  Created by Patrick Nascimento on 25/11/16.
//  Copyright © 2016 iesb. All rights reserved.
// 

#import "PostosTableViewController.h"
#import "PostoTableViewCell.h"
#import "PostoViewController.h"
#import <CoreData/CoreData.h>

@interface PostosTableViewController ()

@property (strong) NSMutableArray *postos;

@end

@implementation PostosTableViewController



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
    //self.postos = [[NSArray alloc]init];
    
    //Posto *p1 = [[Posto alloc] init];
    //Posto *p2 = [[Posto alloc] init];
    
    
//    p1.precoGasolinaComum = @"3,00";
//    p1.precoGasolinaAditivada = @"4,00";
//    p1.precoDiesel = @"2,00";
//    p1.precoEtanol = @"1,00";
//    p1.nomePosto = @"Nome do Posto 1";
//    p1.bandeiraPosto = @"esso.png";
//    p1.enderecoPosto = @"Endereço do Posto 1";
//    p1.latitudePosto = @"1,000000";
//    p1.longitudePosto = @"2,000000";
//    
//    
//    p2.precoGasolinaComum = @"3,50";
//    p2.precoGasolinaAditivada = @"4,50";
//    p2.precoDiesel = @"2,50";
//    p2.precoEtanol = @"1,50";
//    p2.nomePosto = @"Nome do Posto 2";
//    p2.bandeiraPosto = @"br.png";
//    p2.enderecoPosto = @"Endereço do Posto 2";
//    p2.latitudePosto = @"1,500000";
//    p2.longitudePosto = @"2,500000";
    
//    [self addPosto: p1];
//    [self addPosto: p2];

    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:true];
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Posto"];
    self.postos = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [self.tableView reloadData];
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
    
    //int row = (int)[indexPath row];
    //NSLog(@">>%@", _postos[row]);
    //Posto *p = (Posto *)_postos[row];
    
    NSManagedObjectModel *posto = [self.postos objectAtIndex:indexPath.row];
    [cell.LblPrecoGasolinaComum setText:[NSString stringWithFormat:@"%@", [posto valueForKey:@"precoGasolinaComum"]]];
    [cell.LblPrecoGasolinaAditivada setText:[NSString stringWithFormat:@"%@", [posto valueForKey:@"precoGasolinaAditivada"]]];
    [cell.LblPrecoDiesel setText:[NSString stringWithFormat:@"%@", [posto valueForKey:@"precoDiesel"]]];
    [cell.LblPrecoEtanol setText:[NSString stringWithFormat:@"%@", [posto valueForKey:@"precoEtanol"]]];
    
    [cell.LblNomePosto setText:[NSString stringWithFormat:@"%@", [posto valueForKey:@"nomePosto"]]];
    [cell.LblEnderecoPosto setText:[NSString stringWithFormat:@"%@", [posto valueForKey:@"enderecoPosto"]]];
    

    cell.ImgBandeiraPosto.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@/%@%@", @"Images/", [posto valueForKey:@"bandeiraPosto"], @".png"]];
    
    NSLog(@">>%@", [posto valueForKey:@"bandeiraPosto"]);
    NSLog(@">>>>>%@", [NSString stringWithFormat:@"%@%@%@", @"Images/", [posto valueForKey:@"bandeiraPosto"], @".png"]);
    
   
//    cell.ImgBandeiraPosto.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@/%@", @"Images/", p.bandeiraPosto]];
//    NSLog(@">>%@", p.bandeiraPosto);
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [context deleteObject:[self.postos objectAtIndex:indexPath.row]];;
        
        NSError *error = nil;
        
        if (![context save:&error]) {
            NSLog(@"%@ %@", error, [error localizedDescription]);
        }
        
        [self.postos removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    }
    
    
    
}

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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"UpdatePosto"]) {
        NSManagedObjectModel *SelectedPosto = [self.postos objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        PostoViewController *PostoAddView = segue.destinationViewController;
        //PostoAddView.posto = SelectedPosto;
    }
    
    
    
    
    
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
