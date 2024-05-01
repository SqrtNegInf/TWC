#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

is([uncommon_words('Mango is sweet', 'Mango is sour')], ['sweet', 'sour'], 'Example 1');
is([uncommon_words('Mango Mango', 'Orange')], ['Orange'], 'Example 2');
is([uncommon_words('Mango is Mango', 'Orange is Orange')], [], 'Example 3');
done_testing();


sub uncommon_words
{
     my ($str_1, $str_2) = @_;
     my @wds_1 = split_sentence($str_1);
     my @wds_2 = split_sentence($str_2);
     my %h_1 = sentence_hash(@wds_1);
     my %h_2 = sentence_hash(@wds_2);
     for my $href ( \%h_1, \%h_2 )
     {
         for my $key ( keys %$href )
         {
               delete $href->{$key} if $href->{$key} > 1;
         }
     }
     return hash_xor_keys(\%h_1, \%h_2);
}

sub hash_xor_keys
{
     my ($hr_1, $hr_2) = @_;
     my @keys_1 = keys %$hr_1;
     my @keys_2 = keys %$hr_2;
     delete @{$hr_1}{@keys_2}; 
     delete @{$hr_2}{@keys_1}; 
     return keys %$hr_1, keys %$hr_2;
}

sub sentence_hash
{
     my @arr = @_;
     my %hash;
     do { $hash{$_}++ } for @arr;
     return %hash;
}

sub split_sentence
{
     my $str = $_[0];
     $str =~ tr/,.;:-/ /ds;
     $str =~ s/\s+/ /g;
     my @arr = split(/ /, $str);
     return @arr;
}
