#!/usr/bin/env perl
use v5.36;

my @input = map {[/\S/g]} <DATA>;

my $X =   @input;
my $Y = @{$input [0]};

#
# Loop over each cell of the board. If the cell contains a mine,
# print the mine. Else, iterate over the 8 neighbours, skipping 
# neighbours outside of the board, and count the mines. Print the count.
#
for my $x (0 .. ($X - 1)) {
    foreach my $y (0 .. ($Y - 1)) {
        print ' ' if $y > 0;
        if ($input  [$x] [$y] eq 'x') { # Mine
            print 'x';
            next;
        }
        my $mines = 0;
        for my $dx (-1 .. 1) {
            next if $x + $dx < 0 || $x + $dx >= $X;     # Above or below board
            for my $dy (-1 .. 1) {
                next if $y + $dy < 0 || $y + $dy >= $Y; # Right or left of board
                next unless $dx || $dy;                 # Skip self
                $mines ++ if $input [$x + $dx] [$y + $dy] eq 'x';
            }
        }
        print $mines;
    }
    print "\n";
}


__END__
x * * * x * x x x x
* * * * * * * * * x
* * * * x * x * x *
* * * x x * * * * *
x * * * x * * * * x
