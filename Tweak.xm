
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
    [self tableView:nil didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

%end
%end



%group iOS7

static bool alreadyRan = NO;

%hook SBSearchViewController

- (void)searchGesture:(id)arg1 completedShowing:(BOOL)arg2 {
    alreadyRan = NO;
    %orig;
}

- (id)init {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidChange:)
                                                 name:UITextFieldTextDidEndEditingNotification
                                              object:nil];
    return %orig;
}

%new
- (void)textFieldDidChange:(NSNotification *)notif {
    if (!alreadyRan) {
        [self tableView:nil didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        alreadyRan = YES;
    }
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

