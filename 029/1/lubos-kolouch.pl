#!/usr/bin/env perl
use v5.36;

use Text::Glob::Expand;

sub expand_brace {
    my $words = shift;

    my $glob = Text::Glob::Expand->parse($words);
    my $permutations = $glob->explode_format("");

    return $permutations;

}

#my ($words) = @ARGV;
#my $permutations = &expand_brace($words);
#say for keys %$permutations;

#-------- TEST ---------
use Test::More;

my $permutations = &expand_brace('Perl {Daily,Weekly,Monthly,Yearly} Challenge');
is(keys %$permutations,4);
done_testing();


