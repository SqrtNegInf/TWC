#!/usr/bin/env perl
use v5.36;

srand 1;

use List::Util qw{ sum0 uniq };
use Getopt::Long;

my $verbose = 0;
GetOptions(
    'verbose' => \$verbose,
);

my @tiles = get_tiles();
@tiles = sort @tiles;
say join ' ', @tiles;
say '-------------';

my @list = permute_array(\@tiles);
my @list2;

for my $array ( @list ) {
    for my $l ( 0 .. 6 ) {
        state $dict;
        my @array2 = map { $array->[$_] } 0 .. $l;
        my $word2 = join '', @array2;
        next if $dict->{$word2}++;
        push @list2, \@array2;
    }
}

my $best = '';
my $top = 0;
for my $r ( @list2 ) {
    my $word = join  '', $r->@*;
    my $score = score_word($word);
    next if $score <1;
    say join "\t", '', $score,$word if $verbose;
    if ( $score > $top ) {
        $best = $word;
        $top = $score;
    }
}

say qq{    $best ($top)};

sub permute_array ( $array ) {
    return $array if scalar $array->@* == 1;
    my @response = map {
        my $i        = $_;
        my $d        = $array->[$i];
        my $copy->@* = $array->@*;
        splice $copy->@*, $i, 1;
        my @out = map { unshift $_->@*, $d; $_ } permute_array($copy);
        @out
    } 0 .. scalar $array->@* - 1;
    return @response;
}

sub get_tiles {
    state $counts = counts();
    my @letters = split //, join '', map { $_ x $counts->{$_} } 'a' .. 'z';
    my @output;
    for ( 1 .. 7 ) {
        my $n = int rand scalar @letters;
        my $l = $letters[$n];
        splice @letters, $n, 1;
        push @output, $l;
    }
    return wantarray ? @output : \@output;
}

sub score_word( $word ) {
    state $words  = words();
    state $counts = counts();
    state $scores = scores();
    return 0 unless length $word <= 7;
    return 0 unless $words->{$word};
    for my $letter ( 'a' .. 'z' ) {
        if ( $word =~ /$letter/ ) {
            my $count = () = $word =~ /$letter/gi;
            return 0 if $count > $counts->{$letter};
        }
    }
    return sum0 map { $scores->{$_} } split //, $word;
}

sub words {
    my $file = 'words';
    my $words;
    if ( -f $file && open my $fh, '<', $file ) {
        for my $word ( map { chomp; lc $_ } <$fh> ) {
            $words->{$word} = 1;
        }
    }
    return $words;
}

sub counts {
    my $counts;
    map { $counts->{$_} = 2 } qw{ k q x };
    map { $counts->{$_} = 3 } qw{ d f g h j l o r v };
    map { $counts->{$_} = 4 } qw{ c m n };
    map { $counts->{$_} = 5 } qw{ b i p t u w y z };
    map { $counts->{$_} = 7 } qw{ s };
    map { $counts->{$_} = 8 } qw{ a };
    map { $counts->{$_} = 9 } qw{ e };
    return $counts;
}

sub scores {
    my $scores;
    map { $scores->{$_} = 1 } qw{ a g i s u x z };
    map { $scores->{$_} = 2 } qw{ e j l r v y };
    map { $scores->{$_} = 3 } qw{ f d p w };
    map { $scores->{$_} = 4 } qw{ b n };
    map { $scores->{$_} = 5 } qw{ t o h m c };
    map { $scores->{$_} = 10 } qw{ k q };
    return $scores;
}
