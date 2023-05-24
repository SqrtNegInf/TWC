#!/usr/bin/env perl
use v5.36;

my @uglies=(1); #known uglies
my @u_id=(0,0,0); # indices into uglies array corresponding to
my @factors=(2,3,5); # prime factors of uglies

foreach((7, 10, 150)){
    say "Input: $_ Output: ", ugly($_);
}

sub ugly {
    my $n=shift @_; # desired ugly number. Assume a positive integer
    while($n>@uglies){ # generate uglies until the n-th becomes known
	my ($next_id)=sort {next_from_id($a)<=>next_from_id($b)} 0..2;
	my $next_val=next_from_id($next_id);
	$u_id[$next_id]++;
	push @uglies, $next_val if $next_val>$uglies[-1];
    }
    return $uglies[$n-1];
}

sub next_from_id {
    my $id=shift @_;
    return $uglies[$u_id[$id]]*$factors[$id];
}
