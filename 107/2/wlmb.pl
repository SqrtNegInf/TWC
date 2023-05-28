#!/usr/bin/env perl
use v5.36;

no strict "refs"; # don't be that strict
#die 'Use: ./ch-2.pl package [other package] [...]' unless @ARGV;
use lib '.';
foreach my $package('Calc'){
    eval "require $package";
    die $@ if $@;
    say "Methods of $package";
    foreach my $key(sort keys %{"${package}::"}){
	say "\t$key" if defined &{"${package}::$key"};
    }
}
