#!/usr/bin/env perl
use v5.36;

my $dict = "words.txt";
my $min_length = shift // 5;
open my $IN, "<", $dict or die "unable to open $dict";
my %words = map { $_ => 1 } grep { length $_ >= $min_length }
    map { chomp; $_ } <$IN>;
close $IN;

my @grid = map { s/[\r\n]+//; [split / /, lc $_]} <DATA>;
my $max_row = $#grid;
my $max_col = $#{$grid[0]}; # scalar @{$grid}[0]} - 1;
my %result;

sub find_words {
    my @row = @{$_[0]};
    for my $i (0..$#row) {
        for my $j ($i+$min_length-1..$#row) {
            my $word = join '', @row[$i..$j];
            $result{$word} = 1 if exists $words{$word};
        }
    }
}

# Horizontal
for my $row (@grid) {
    find_words $_ for $row, [reverse @$row];
}
# Vertical
for my $i (0..$max_col) {
    my @vals = map { $grid[$_][$i] } 0..$max_row;
    find_words $_ for [@vals], [reverse @vals];
}
# Oblique, NW to SE
for my $i (0..$max_col - $min_length + 1) {
    my @vals = grep defined $_, map { $grid[$_][$_+$i] } 0..$max_row;
    find_words $_ for [@vals], [reverse @vals];
}
for my $j (1..$max_row-$min_length+1) {
    my @vals = grep defined $_, map { $grid[$_+$j][$_]} 0..$max_row;
    find_words $_ for [@vals], [reverse @vals];
}
# Oblique, NE to Sw
for my $j ($min_length - 1 .. $max_col) {
    my @vals = grep defined $_, map { $grid[$j-$_][$_] } 0..$max_col;
    find_words $_ for [@vals], [reverse @vals];;
}
for my $i (1 ..$max_row - $min_length + 1) {
    my @vals = grep defined $_, map { $grid[$i+$_][$max_col-$_] }  0..$max_col;
    find_words $_ for [@vals], [reverse @vals];
}
say join " ", sort keys %result;


__DATA__
B I D E M I A T S U C C O R S T
L D E G G I W Q H O D E E H D P
U S E I R U B U T E A S L A G U
N G N I Z I L A I C O S C N U D
T G M I D S T S A R A R E I F G
S R E N M D C H A S I V E E L I
S C S H A E U E B R O A D M T E
H W O V L P E D D L A I U L S S
R Y O N L A S F C S T A O G O T
I G U S S R R U G O V A R Y O C
N R G P A T N A N G I L A M O O
E I H A C E I V I R U S E S E D
S E T S U D T T G A R L I C N H
H V R M X L W I U M S N S O T B
A E A O F I L C H T O D C A E U
Z S C D F E C A A I I R L N R F
A R I I A N Y U T O O O U T P F
R S E C I S N A B O S C N E R A
D R S M P C U U N E L T E S I L
