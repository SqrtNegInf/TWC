#!/usr/bin/env perl
use v5.36;

use Test::More;

is (last_word('  hello world',                qr/[ea]l/),      'hello',  'Hello world');
is (last_word("Don't match too much, Chet!",  qr/ch.t/i),      'Chet!',  'Chet');
is (last_word("spaces in regexp won't match", qr/in re/),      undef,    'Undef');
is (last_word( join(' ', 1..1e6),             qr/^(3.*?){3}/), '399933', 'Numbers');

done_testing();

sub last_word {
    my ($string, $regex) = @_;
    my @words = reverse (split ('\s', $string));

    for my $word (@words) {
    	return $word
    		if ($word =~ /$regex/);
    }

    return undef;
}
