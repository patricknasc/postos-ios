//
//  PostoTableViewCell.h
//  Postos
//
//  Created by Patrick Nascimento on 25/11/16.
//  Copyright © 2016 iesb. All rights reserved.
// 

#import <UIKit/UIKit.h>

@interface PostoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ImgBandeiraPosto;

@property (weak, nonatomic) IBOutlet UILabel *LblNomePosto;

@property (weak, nonatomic) IBOutlet UILabel *LblEnderecoPosto;

@property (weak, nonatomic) IBOutlet UILabel *LblPrecoGasolinaComum;

@property (weak, nonatomic) IBOutlet UILabel *LblPrecoGasolinaAditivada;

@property (weak, nonatomic) IBOutlet UILabel *LblPrecoEtanol;

@property (weak, nonatomic) IBOutlet UILabel *LblPrecoDiesel;

@property (weak, nonatomic) IBOutlet UIButton *BtnIrPara;


@end
