#!/usr/bin/env perl
use v5.36;

my $words_file = 'words';

# Points for each tile
my %tile_points = (
    A => 1, G => 1, I => 1, S => 1, U => 1, X => 1, Z => 1,
    E => 2, J => 2, L => 2, R => 2, V => 2, Y => 2,
    F => 3, D => 3, P => 3, W => 3,
    B => 4, N => 4,
    T => 5, O => 5, H => 5, M => 5, C => 5,
    K => 10, Q => 10
);

# Lot of available tiles
my @lot = (
    ('K','Q','X') x 2,
    ('D','F','G','H','J','L','O','R','V') x 3,
    ('C','M','N') x 4,
    ('B','I','P','T','U','W','Y','Z') x 5,
    ('S') x 7,
    ('A') x 8,
    ('E') x 9
);

srand 1;
# 7 randomly drawn tiles from the lot
my %tiles;
++$tiles{ splice @lot, int rand @lot, 1 } for (1..7);

print "Tiles drawn (quantity in parentheses): \n";
print join ', ', map { "$_ (x$tiles{$_})" } sort keys %tiles;
print "\n";

# Determine best word
my $best_word  = '';
my $max_points = 0;

open(my $fh, "<", $words_file) or die "Could not open words file '$words_file': $!";
while( my $w = <$fh> ) {
    chomp $w;
    next unless is_word_formed_by_tiles( uc $w , %tiles );

    my $word_points = 0;
    $word_points += $tile_points{$_} foreach split //, uc $w;

    # best word prioritizes the number of tiles used over the points
    ($best_word, $max_points) = ($w, $word_points) if length($w)   >= length($best_word)
                                                   && $word_points >= $max_points
}
close $fh;

print "Best word: $best_word - $max_points points \n";

#Return 1 if $word is formed by the given tiles
sub is_word_formed_by_tiles {
    my ( $word, %tiles ) = @_;
    foreach my $l (split //,$word ){
        return 0 unless (exists $tiles{ $l } && $tiles{ $l } > 0);
        $tiles{ $l }--;
    }
    return 1;
}

__END__

./ch-2.pl words.txt
Tiles drawn (quantity in parentheses):
A (x1), B (x1), E (x2), H (x1), N (x1), T (x1)
Best word: beneath - 23 points
