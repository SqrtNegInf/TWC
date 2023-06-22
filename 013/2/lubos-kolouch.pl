#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

my $max = 19;

my %f_cache;
my %m_cache;

my @f_result;
my @m_result;

push @f_result, 1;
push @m_result, 0;

$f_cache{0} = 1;
$m_cache{0} = 0;

sub f {
    my $n = shift;

    my $result = $n - $m_cache{$f_cache{$n-1}};

    push @f_result, $result;
    $f_cache{$n} = $result;
}

sub m {
    my $n = shift;

    my $result = $n - $f_cache{$m_cache{$n-1}};

    push @m_result, $result;
    $m_cache{$n} = $result;
}


for (1..$max-1) {
    &f($_);
    &m($_);

}

say 'F : '. join ",", @f_result;
say 'M : '. join ",", @m_result;


