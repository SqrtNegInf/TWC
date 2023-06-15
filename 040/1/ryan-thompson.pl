#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

use Carp;
use List::Util qw< max any >;

sub my_zip6 :prototype(\@\@;\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@);
sub zip6ref :prototype($$;@);
sub zip6ref_check :prototype($$;@);

my @a1 = qw<I L O V E Y O U>;
my @a2 = qw<2 4 0 3 2 0 1 9>;
my @a3 = qw<! ? X $ % ^ & *>;

say join ' ', @$_ for my_zip6 @a1, @a2, @a3;

# Here's one solution, trying to match List::MoreUtils' behaviour
sub my_zip6 :prototype(\@\@;\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@) {
    my $max = max map $#$_, @_;  # Use the size of the longest array

    map { my $i = $_; [ map $_->[$i], @_ ] } 0..$max;
}

# And now the same code, with a different prototype, which is more flexible
sub zip6ref :prototype($$;@) {
    my $max = max map $#$_, @_;  # Use the size of the longest array

    map { my $i = $_; [ map $_->[$i], @_ ] } 0..$max;
}

# As above, but with a check to ensure all args are ARRAY refs. Slower.
sub zip6ref_check :prototype($$;@) {
    croak "Not an ARRAY ref" if any { 'ARRAY' ne ref } @_;
    my $max = max map $#$_, @_;  # Use the size of the longest array

    map { my $i = $_; [ map $_->[$i], @_ ] } 0..$max;
}
