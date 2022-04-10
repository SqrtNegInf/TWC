#!/usr/bin/env raku

srand 1;

sub MAIN () {

    my @coins = ( 100, 50, 1, 10, 5, 20, 200, 2 ).pick: *;
    my %player;
    my $turn = 0;

    say "draw:\n", @coins.join: ', ';
    say '';

    while @coins.elems > 0 {
        my $taken = $turn == 0 ?? player0_move( @coins )
                               !! player1_move( @coins );
        %player{$turn} += $taken;

        say "player $turn takes:   $taken \n";
        say "\t player total:   %player{$turn} ";
        say '';

        ## toggle the turn bit
        $turn +^= 1;
    }

    say "player 0 : %player{0}";
    say "player 1 : %player{1}";
}



sub player0_move ( @coins ) {
## apply the winning algorithm to the line
## return the coin taken

    ## target is the highest value coin left in the line
    my $target = @coins.sort({$^b <=> $^a}).head;
    my ($target_index) = @coins.grep: $target, :k;

    my $left  = $target_index;
    my $right = @coins.end - $target_index;

    ## check the ends of the line first and take
    ## if not take from the larger side and return coin
    if $right == 0 {
        @coins.pop;
    }
    elsif $left == 0 or $left > $right {
        @coins.shift;
    }
    else {
        @coins.pop;
    }
}

sub player1_move ( @coins ) {
## remove the largest coin from the the ends of the line
    @coins.head > @coins.tail ?? @coins.shift !! @coins.pop;

}
