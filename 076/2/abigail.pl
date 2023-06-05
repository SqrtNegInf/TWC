#!/usr/bin/env perl
use v5.36;

use List::Util qw [min];

#
# Read in the list of words. Grep all the words longer than 4 characters.
#
my $dictionary = "words.txt";
open my $fh, "<", $dictionary or die "open: $!";
chomp (my @words = grep {/.{5}/} <$fh>);

#
# Turn the word list into a pattern. Longest word first.
# This means if there are words 'foo' and 'foobar', and a
# row contains 'foobar', we grep the 'foobar', not the 'foo'.
#
my $pat = join '|' => sort {length ($b) <=> length ($a)} @words;
   $pat = qr /$pat/;


#
# Read in the grid; lowercase the letters.
#
my @grid = map {[split ' ' => lc]} <DATA>;
my $nr_of_rows = @grid;
my $nr_of_cols = @{$grid [0]};

{
    my %words;
    #
    # Given a list of letters, find any words in them, either
    # in the give direction, or reversed.
    #
    sub collect_words (@letters) {
        my $line = join "" => @letters;
        $words {$_} ++ for          $line  =~ /(?=($pat))/g;
        $words {$_} ++ for reverse ($line) =~ /(?=($pat))/g;
    }
    #
    # Return the list of found words, sorted.
    #
    sub words () {
        sort keys %words;
    }
}

#
# Collect words
#

# Rows:
map {collect_words @$_} @grid;

# Columns:
map {my $i = $_; collect_words map {$$_ [$i]} @grid} 0 .. $nr_of_cols - 1;

# Diagonals in NE & SE quadrants:
for my $i (0 .. $nr_of_cols - 1) {
    my $max = min $nr_of_cols - $i - 1, $nr_of_rows - 1;
    collect_words map {$grid [$_]                        [$_ + $i]} 0 .. $max;
    collect_words map {$grid [$nr_of_rows - 1 - $_]      [$_ + $i]} 0 .. $max;
}

# Diagonals in SW & NW quadrants:
for my $j (0 .. $nr_of_rows - 1) {
    my $max = min $nr_of_rows - $j - 1, $nr_of_cols - 1;
    collect_words map {$grid [$_ + $j]                   [$_]}      0 .. $max;
    collect_words map {$grid [$nr_of_rows - 1 - $_ - $j] [$_]}      0 .. $max;
}

#
# Print the results
#
say for words;

__END__
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
