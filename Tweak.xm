// #import <SpringBoard/SBSearchView.h>
#import <SpringBoard/SBSearchController.h>

// static UITableView *sbTableView;
// // static SBSearchController *sbSearchController;

// %hook SBSearchView


// - (void)addTableView
// {
//     // %log;
//     %orig;
//     sbTableView = [self tableView];
//     // sbSearchController = (SBSearchController *)[sbTableView delegate];
//     // NSLog(@"addTableView: %@", sbTableView);
//     // NSLog(@"addTableViewDelegate: %@", sbSearchController);
// }

// %end


%hook SBSearchController

- (void)searchBarSearchButtonClicked:(id)arg1
{
    %orig;
    //- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
    NSIndexPath *firstResult = [NSIndexPath indexPathForRow:0 inSection:0];
    [self tableView:nil didSelectRowAtIndexPath:firstResult];
}

%end