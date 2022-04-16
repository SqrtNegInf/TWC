#!/usr/bin/env perl

use strict;
use warnings;
use Math::Factor::XS qw/count_prime_factors/;
use Math::Prime::XS qw/is_prime/;

sub is_attractive {
    my $what = shift;

    return is_prime(count_prime_factors($what));
}

# TESTS

use Test::More;

is(is_attractive(20),1);
is(is_attractive(23),'');
is(is_attractive(28),1);
is(is_attractive(256),'');

done_testing;


