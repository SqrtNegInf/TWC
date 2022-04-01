#!/usr/bin/env raku



unit sub MAIN ($S = 27, *@coins) ;

# cfg
@coins = (2,5,10,25) if @coins.elems == 0;
@coins .= sort( { $^a <=> $^b } );
my @solutions;

# work
get_coin_groups($S);

# out
print_output(@solutions);

## ## ## ## ##

sub get_coin_groups ($amt, @group = [], @bag = @coins) {

    ## base case, cashed out
    $amt == 0 and return @solutions.push: @group;

    ## limit coin bag to those smaller or equal to the current amount
    my @coin_bag = @bag.grep: { $_ <= $amt } ;
    
    ## edge case, cannot complete group with remaining coins
    @coin_bag == 0 and return;

    for @coin_bag -> $coin {
        ## limit coin bag to this coin or smaller than this coin
        ## keeps groups ordered and disallows duplicate rearrangements
        my @smaller_coin_bag = @bag.grep: { $_ <= $coin } ;
        get_coin_groups( $amt - $coin, ( |@group, $coin ) , @smaller_coin_bag );
    }
}

sub print_output ($output) {
    my $count = $output.elems;
    
    say "Input:\n    \@C = ", @coins;
    say "    \$S = $S\n";
    say "Output: $count";
    say $count == 1 
        ?? "There is one possible way to make sum $S"
        !! "There are $count ways to make sum $S";
        
    
    my @letter_prefixes = |('a'..'z'), |('aa'..'zz');
    say "\t", @letter_prefixes.shift, ') ', $_ for @solutions;

}


