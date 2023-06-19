#!/usr/bin/env perl
use v5.36;

use URL::Normalize;

my $in = "HTTP://www.example.com:80/a%C2%B1b/%7Eusername";
die "Usage: perl $0 <url-to-be-normalized>" unless $in;

# first we initialize our normalizer with input url
my $normalizer = URL::Normalize->new($in);

# now we start to apply some normalizations.
# some methods just have an obvious meaning
$normalizer->remove_dot_segments;
$normalizer->remove_duplicate_slashes;
$normalizer->sort_query_parameters;
$normalizer->remove_duplicate_query_parameters;
$normalizer->remove_empty_query_parameters;

# The "make_canonical" method, involves several important steps like
# convert scheme & host to lower case, capitalize escape seqs,
# decode all unreserved chars, and remove default port when possible

$normalizer->make_canonical;

# and that's it, now we just print the normalized result:
say $normalizer->url;

# There are a lot of very interestin methods on this module, that will
# allow to normalize removing several parameters that will not really
# change the content we will get using the url.

# Please take a look at https://metacpan.org/pod/URL::Normalize for
# further information on the module used
