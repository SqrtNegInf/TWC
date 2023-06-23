#!/usr/bin/env perl
use v5.36;

# get arguments
sub get_args {
    @ARGV==2 or die "Usage: ch-2.pl word1 word2\n";
    my($word1, $word2) = @ARGV;
    length($word1)==length($word2) or die "words must have the same length\n";
    $word1 ne $word2 or die "words must be different\n";
    for ($word1, $word2) {
        /^[a-z]+$/ or die "words must have lower case letters only\n";
    }
    return ($word1, $word2)
}

# read wordlist from dictionary
sub read_words {
    my($file, $length) = @_;

    my %wordlist;
    open(my $fh, "<", $file) or die "open $file: $!\n";
    while (<$fh>) {
        chomp;
        next unless length($_)==$length;
        next unless /^[a-z]+$/;
        $wordlist{$_} = 1;
    }
    return %wordlist;
}

# find shortest ladder
sub find_shortest_ladder {
    my($word1, $word2, %wordlist) = @_;
    my @queue = [$word1, [$word1], {$word1=>1}];    # [node, path, visited]
    while (@queue) {
        my($word, $path, $visited) = @{shift @queue};
        my @next = next_possible_words($word, \%wordlist, $visited);
        for my $next (@next) {
            return (@$path, $next) if $next eq $word2;  # found solution
            push @queue, [$next, [@$path, $next], {%$visited, $next=>1}];
        }
    }
    return ();  # no solution found
}

# find possible next words from %wordlist and not yet %visited
sub next_possible_words {
    my($word, $wordlist, $visited) = @_;
    my @next;
    for (sort keys %$wordlist) {
        push @next, $_ if $_ ne $word && !$visited->{$_} && word_diff($_, $word)==1;
    }
    return @next;
}

sub word_diff {
    my($word1, $word2) = @_;
    my $diff = 0;
    for (0 .. length($word1)-1) {
        $diff++ if substr($word1,$_,1) ne substr($word2,$_,1);
    }
    return $diff;
}


# main
sub solve {
    my($word1, $word2) = ('bat', 'big');
    my %wordlist = read_words("words", length($word1));
    my @ladder = find_shortest_ladder($word1, $word2, %wordlist);
    say "(", join(", ", map {'"'.$_.'"'} @ladder), ")";
}

solve;
