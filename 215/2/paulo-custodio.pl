#!/usr/bin/env perl
use v5.36;

sub can_place {
    my($nums, $count) = @_;
    my $str = join '', @$nums;
    for (1 .. $count) {
        if (!($str =~ s/000/010/)) {
            return 0;
        }
    }
    return 1;
}

my @nums = (1, 0, 0, 0, 1);
my $count = 1;
say can_place(\@nums, $count);


