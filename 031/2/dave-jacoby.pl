#!/usr/bin/env perl
use v5.36;

no strict 'refs';

use Encode qw{decode_utf8};
$ARGV[0] = 'foo';

# I can be a literalist
${ $ARGV[0] } = 'boo';

#  and heredocs, because heredocs
print <<"END";

$ARGV[0] = ${ $ARGV[0] }

END

