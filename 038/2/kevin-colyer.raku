#!/usr/bin/env raku

use Test;

my %points;
%points<A G I S U X Z>= 1 xx * ;
%points<E J L R V Y>  = 2 xx * ;
%points<F D P W>      = 3 xx * ;
%points<B N>          = 4 xx * ;
%points<T O H M C>    = 5 xx * ;
%points<K Q>          = 10 xx * ;


my %tilebag is BagHash =
    :A(8), :G(3), :I(5), :S(7), :U(5), :X(2), :Z(5),
    :E(9), :J(3), :L(3), :R(3), :V(3), :Y(5),
    :F(3), :D(3), :P(5), :W(5),
    :B(5), :N(4),
    :T(5), :O(3), :H(3), :M(4), :C(4),
    :K(2), :Q(2),
;


my %wordlist;
# change to use a better dictionary - system directory is not a great one!
my $dict="words";

my $cache="myWordList.txt";
if $cache.IO.e == False {

    say "Processessing wordlist and caching...";
    say "  Slurping...";
    # slurp in dictionary, split on lines, filter any comments (other dictionarys may have them)
    # trim by using .words (just in case), filter to length we want and remove punctuation and Acented words
    my @words=slurp($dict).uc.lines.grep( * !~~ /^ '#' / ).words.grep( *.chars <= 7 ).grep( * !~~ / <-[A..Z]> / );
    say "  Pre-computing...";
    for @words {
        %wordlist{$_.comb.sort.join} = [scoreTiles( $_.comb ), $_];
    }
    say "  Spurting {%wordlist.elems} words...";
    $cache.IO.spurt(%wordlist);

} else {

    say "Loading cached wordlist...";
    for $cache.IO.slurp.lines.words -> $a, $b, $c {
        %wordlist{$a}= [$b,$c];
    }
    say "  Loaded {%wordlist.elems} words.";

}

sub drawTiles ($num is copy = 7) {
    my @tiles;
    while $num>0 and %tilebag.total>0 {
        my $t=%tilebag.roll;
        %tilebag{$t}--;
        @tiles.push: $t;
        $num--;
    }
    return @tiles;
}

sub scoreTiles (@cand) {
    [+] (%points{$_} for @cand);
}

# create all combinations of words, check if exist and score
# note .combinations does not every anagrams so sort and compare with pre-sorted dictionary to find a word
sub makeWords(@tiles) {
    my @result = "", 0;
    for @tiles.combinations -> @cand {
        next if @cand.elems < 2;
        my $cand=@cand.sort.join;
        next unless %wordlist{$cand}:exists;
        my ($s,$w)= %wordlist{$cand};
        if $s > @result[1] and $cand.chars => @result[0].chars {
            @result[0,1]=$w,$s;
        };
    }
    return @result;
}

sub removeTiles(@hand is copy,@tiles) {
    my $i;
    for @tiles -> $t {
        $i = @hand.first: * eq $t, :k;
        @hand.splice( $i, 1 );
    }
    return @hand;
}

    is makeWords(<G C N E S Z L>),("CLEG",10),"test"; # will depend on how good your dictionary is...
    is removeTiles(<K E V I N>, <N I>), <K E V>,"test removeTiles";
    is removeTiles(<K E V I N>, <K I>), <E V N>,"test removeTiles";
    is removeTiles(<K E V I N>, <K E V I N>), (),"test removeTiles";
    done-testing;
