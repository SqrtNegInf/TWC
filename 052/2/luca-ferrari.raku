#!/usr/bin/env raku

my @moneys = 1, 0.5, 0.01, 0.05, 0.2, 2, 0.02;

@moneys.say;
my @moves;

my ( @player, @computer );


# First approach: let's cheat and make the player choose always the max
# value there is on the table
while ( @moneys.elems ) {
    my $left  = @moneys.shift || 0;
    my $right = @moneys.pop   || 0;

    @player.push:   $left > $right ?? $left !! $right;
    @computer.push: $left > $right ?? $right !! $left;
}


say "Player wins with { @player } = { [+] @player } vs { @computer } = { [+] @computer }";


say "Let's play another random turn";

@player   = ();
@computer = ();
@moneys   = 1, 0.5, 0.01, 0.05, 0.2, 2, 0.02;

my $cnt = 0;
while ( @moneys.elems ) {
   #if 99.rand.Int %% 2 {  # DH flapping, so make deterministic
    if ++$cnt %% 2 {
        @player.push:   @moneys.shift || 0;
        @computer.push: @moneys.pop   || 0;
    }
    else {
        @player.push:   @moneys.pop   || 0;
        @computer.push: @moneys.shift || 0;

    }
}

my $player-score   = [+] @player;
my $computer-score = [+] @computer;

say "Computer wins with { @computer } = $computer-score VS { @player } = $player-score" if $computer-score > $player-score;
say "Computer looses with { @computer } = $computer-score VS { @player } = $player-score" if $computer-score < $player-score;
say "Tie!" if $computer-score == $player-score;
