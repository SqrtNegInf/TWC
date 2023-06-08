#!/usr/bin/env perl
use v5.36;

my $string = prepare_input( @ARGV );
$string ||= "aaabaaabaaa";

my @palins = all_palindromes($string);

my $solutions = [];
get_lists( $string, [], $solutions, \@palins);

for ($solutions->@*) {
    say "$_->@*";
}

sub all_palindromes {
## extract every possible palindrome from the input string
    my $string = shift;
    my %palins;
    my $target;
    my $start = -1;
    while ( $start++ < length($string)-2 ) {
        for (2..length($string)-$start) {
            $target = substr( $string, $start, $_);
            if( $target =~ m/^(.+).?(??{reverse($1)})$/)  {
                $palins{$target}++;
            }
        }
    }
    return sort keys %palins;
}

sub get_lists {
## recursively walk lists of combinations of palindrome matches
    my ($string, $list, $solutions, $palins, ) = @_;
    my $joined = join '|', $palins->@*;
    if ($string !~ /$joined/) {
        push $solutions->@*, $list;
        return;
    }
    for ( $palins->@* ) {
        if ($string =~ /$_/) {
            my @list = ( $list->@*, $_ );
            get_lists( $', \@list, $solutions, $palins);
        }
    }
}

sub prepare_input {
    $_ = join '', @_;
    s/\W//g;
    s/_//g;
    return lc;
}
