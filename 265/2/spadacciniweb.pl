#!/usr/bin/env perl
use strict;
use warnings;

my $str = 'aBc 11c';
my @str = ('accbbb', 'abc', 'abbc');
completing_word($str, \@str);

$str = 'Da2 abc';
@str = ('abcm', 'baacd', 'abaadc');
completing_word($str, \@str);

$str = 'JB 007';
@str = ('jj', 'bb', 'bjb');
completing_word($str, \@str);

exit 0;

sub completing_word {
    my $str = shift;
    my $strs = shift;

    my $str_lc = lc($str);
    my $return_str = '';
    $str_lc =~ s/\W|\d//g;
    my @strs = sort { (length $a) <=> (length $b) } @$strs;
    foreach my $strs (sort { (length $a) <=> (length $b) } @$strs) {
        my %freq;
        $freq{$_}++
            foreach split //, $strs;
        $freq{$_}--
            foreach split //, $str_lc;

        if ( scalar (map { $freq{$_} < 0 ? 1 : () } keys %freq) == 0) {
            $return_str = $strs;
            last;
        }
    }
    
    printf "'%s' ('%s') -> %s\n",
        $str,
        (join '\', \'', @$strs),
        $return_str;
}
