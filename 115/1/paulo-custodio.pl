#!/usr/bin/env perl
use v5.36;

my @words = ('abc', 'dea', 'cd');
@words or die "Usage: ch-1.pl words...\n";

say is_circle(\@words) ? 1 : 0;

sub is_circle {
    my($pending, @words) = @_;
    my $found_solution;

    if (@$pending == 0) {
        $found_solution ||= substr($words[-1],-1,1) eq substr($words[0],0,1);
    }
    else {
        for my $word (@$pending) {
            if (@words == 0 ||
                substr($words[-1],-1,1) eq substr($word,0,1)) {
                my @new_pending = grep {$_ ne $word} @$pending;
                $found_solution ||= is_circle(\@new_pending, @words, $word);
            }
        }
    }
    return $found_solution;
}
