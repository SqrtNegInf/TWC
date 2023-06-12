#!/usr/bin/env perl
use v5.36;

srand 1;

my @draw = shuffle( 100, 50, 1, 10, 5, 20, 200, 2 );
my $coins = \@draw;

say "draw:\n", join ', ', $coins->@*;
say '';

my %player = map {$_ => 0} (0,1);
my $turn = 0;

while (scalar $coins->@*) {
    my $taken = $turn == 0 ? player0_move($coins) : player1_move($coins);
    $player{"$turn"} += $taken;
    say "player $turn takes:";
    say "\t$taken";
    say "\t\tplayer total : $player{$turn} ";
    say '';

    ## toggle the turn bit
    $turn ^= 1;
}

say "player 0 : $player{0}";
say "player 1 : $player{1}";

sub shuffle {
    my @input = @_;
    my @output;
    while (scalar @input) {
        my $idx = int rand (scalar @input);
        push @output, splice(@input, $idx, 1);
    }
    return @output;
}

sub player0_move {
## apply the winning algorithm to the line
## return the coin taken
    my $coins  = shift @_;
    my $length = scalar $coins->@* - 1;

    ## target_index will always be defined as target is largest value coin in the line
    my $target = find_target( $coins );
    my ($target_index) = grep { $coins->[$_] == $target } (0..$length);

    my $left  = $target_index;
    my $right = $length - $target_index;

    if ($right == 0) {
        return pop $coins->@*;
    }
    elsif ($left == 0 or $left > $right) {
        return shift $coins->@*;
    }
    else {
        return pop $coins->@*;
    }
}

sub player1_move {
## remove the largest coin from the the ends of the line
    my $coins  = shift @_;
    return $coins->[0] > $coins->[scalar $coins->@* - 1] ? shift $coins->@* : pop $coins->@*;
}

sub find_target {
## determines the highest value coin left in the line and returns the value
## without altering the coin list
    my $coins = shift;
    my @sorted = sort {$b <=> $a} $coins->@*;
    return $sorted[0];
}

## included as a bonus, works just fine
sub find_target2 { return +( sort {$b <=> $a} $_[0]->@* )[0] }
