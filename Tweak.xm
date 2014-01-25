
#import <iOS6/SpringBoard/SBSearchController.h>
#import <iOS7/SpringBoard/SBSearchViewController.h>
#import <iOS7/SpringBoard/SBSearchHeader.h>
#import <iOS7/SpringBoard/SBSearchField.h>
#import <substrate.h>


%group iOS6
%hook SBSearchController

- (void)searchBarSearchButtonClicked:(id)arg1
{
    %orig;
    UITableView * table = MSHookIvar<UITableView *>(self, "_tableView");
    [self tableView:table didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

%end
%end



%group iOS7

%hook SBSearchViewController
- (void)_searchFieldReturnPressed
{
    %orig;
    UITableView * table = MSHookIvar<UITableView *>(self, "_tableView");
    [self tableView:table didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

%end
%end

%ctor {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        %init(iOS7);
    } else {
        %init(iOS6);
    }
}

