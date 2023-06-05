#!/usr/bin/env perl
use v5.36;

## in
my $S      = shift @ARGV // 27;
our @coins = sort { $a <=> $b} @ARGV;
@coins     = (2,5,10,25) if ! @ARGV;
our @solutions;

## work
get_coin_groups($S);

## out
print_output(\@solutions);

## ## ## ## ## SUBS:

sub get_coin_groups {
    my ($amt, $group, $bag) = @_;
    $group //= [];
    $bag     //= \@coins;
    
    ## base case, cashed out
    if ($amt == 0) {
        push @solutions, $group;
        return;
    }
    
    ## limit coin bag to those smaller or equal to the current amount
    my @coin_bag = grep { $_ <= $amt } $bag->@*;
    
    ## edge case, cannot complete group with remaining coins
    if (@coin_bag == 0) {
        return;
    }
    
    for my $coin ( @coin_bag ) {        
        ## limit coin bag to this coin or smaller
        ## keeps groups ordered and disallows duplicate rearrangements
        my @smaller_coin_bag = grep { $_ <= $coin } $bag->@*; 
        get_coin_groups( $amt - $coin, [@$group, $coin], \@smaller_coin_bag );
    }
}

sub print_output {
use Lingua::EN::Inflexion;
    my ($output, $sum ) = @_;
    my $count = scalar $output->@*;
    
    say<<"__EOD__";
Input:
    \@C = (@coins)
    \$S = $S
__EOD__
 
    say "Output: $count";
    my $str = inflect("<#d:$count>There <V:is> <#wnc:$count> possible <N:ways> to make the sum $S.");
    say $str;
    
    my @letter_prefixes = ('a'..'z', 'aa'..'zz');
    say "\t", shift @letter_prefixes, ')  (', (join ', ', $_->@*), ')' for @solutions;

}

