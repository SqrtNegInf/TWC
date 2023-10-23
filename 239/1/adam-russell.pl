#!/usr/bin/env perl
use v5.36;

use boolean;
sub same_string{
    my($a1, $a2) = @_;
    return boolean(join(q//, @{$a1}) eq join(q//, @{$a2}));
}

MAIN:{
    say same_string [qw/ab c/], [qw/a bc/];
    say same_string [qw/ab c/], [qw/ac b/];
    say same_string [qw/ab cd e/], [qw/abcde/];
}
