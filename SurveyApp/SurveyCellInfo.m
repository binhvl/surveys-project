#import "SurveyCellInfo.h"

@implementation SurveyCellInfo

-(id)initCellFromNib{
    self = [super init];
    if(self){
        self = [[[NSBundle mainBundle] loadNibNamed:@"SurveyCellInfo"
                                              owner:self
                                            options:nil]firstObject];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
