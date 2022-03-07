#!/usr/bin/env perl

use strict;
use warnings;

__PACKAGE__->run() unless caller;

use lib '.';
use Salesman;

sub run {
    my $s = Salesman->new;
    print "Input: length = 10\ntour = (0 2 1 3 0)";
}

1;

