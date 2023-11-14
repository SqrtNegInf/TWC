#!/usr/bin/env perl
use v5.36;

use Modern::Perl;
use List::Util 'uniq';

#@ARGV==2 or die "usage: $0 '(a,b,c)' '(d,e,f)'\n";
my @arr1 = (1, 2, 3, 3);#parse(shift);
my @arr2 = (1, 1, 2, 2);#parse(shift);

my @not_in1 = not_in(\@arr1, \@arr2);
my @not_in2 = not_in(\@arr2, \@arr1);

say output(\@not_in1, \@not_in2);


#sub parse {
#    my($text) = @_;
#    my @arr = split ' ', $text =~ s/\D/ /gr;
#    return @arr;
#}

sub output {
    my($arr1, $arr2) = @_;
    my @elems;
    for ($arr1, $arr2) {
        if (@$_) {
            push @elems, "[".join(", ", @$_)."]"
        }
    }
    return "(".join(", ", @elems).")";
}

sub not_in {
    my($arr1, $arr2) = @_;
    my %arr2;
    $arr2{$_}=1 for @$arr2;
    my @not_in;
    push @not_in, $_ for uniq grep {!$arr2{$_}} @$arr1;
    return @not_in;
}
