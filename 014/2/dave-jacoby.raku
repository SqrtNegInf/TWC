#!/usr/bin/env raku

# My first Perl6 entry!

my %states = map { $_ => 1 } , 
    "AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA",
    "HI","ID","IL","IN","IA","KS","KY","LA","ME","MD",
    "MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ",
    "NM","NY","NC","ND","OH","OK","OR","PA","RI","SC",
    "CD","TN","TX","UT","VT","VA","WA","WV","WI","WY";

my $dict = $*VM ~~ /jvm/ ?? 'words' !! '/usr/share/dict/words';
my @words = $dict.IO.lines;

# when testing, use a smaller data set
# @words = "PACT","WIND","PERL","CALAMARI"; 

my $longest = '';
MAIN: for @words -> $word {
    my @word = $word ~~ m:g/\w ** 2/;

    my $join = @word.join('');
    next if $join ne $word;

    for @word -> $wo {
        my $n = %states{$wo.uc} ?? 1 !! 0;
        next MAIN unless $n;
    }

    $longest = $word if $longest.chars < $word.chars;
    }

say $longest;

# the word-list I have here is smaller than the one I have on my 
# laptop, so the longest word I have is "Concorde", being
#   Colorado
#   North Carolina
#   Oregon
#   Delaware

# but my Perl 5 version gets the same, so ¯\_(ツ)_/¯

# I am disappointed by the speed drop, tho
