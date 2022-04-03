#!/usr/bin/env perl
#===============================================================================
#
#        FILE: 7001.pl
#
#        USAGE: ./7001.pl [ string count offset ]
#
#  DESCRIPTION: Swap "count" characters in string with their offests
#
# REQUIREMENTS: Params::Util
#      AUTHOR: Pete Houston (pete), cpan@openstrike.co.uk
# ORGANIZATION: Openstrike
#===============================================================================

use strict;
use warnings;
use Params::Util '_POSINT';

my ($str, $count, $offset) = ('perlandraku', 3, 4);
print chswap($str, $count, $offset) . "\n";

sub chswap {
    my ($str, $count, $offset) = @_;
    my $wrap = $count + $offset == length $str; # Special case
    $str .= substr ($str, 0, 1) if $wrap;
    substr ($str, $offset, $count,
        substr ($str, 1, $count,
        substr ($str, ++$offset, $count)));
    $str =~ s/^.(.*)(.)$/$2$1/ if $wrap;
    return $str;
}
