#!/usr/bin/env perl
use v5.36;

regNum('AB1 2CD', ('abc', 'abcd', 'bcd'));      # abcd
regNum('007 JB',  ('job', 'james', 'bjorg'));   # ('job', 'bjorg')
regNum('C7 RA2',  ('crack', 'road', 'rac'));    # ('crack', 'rac')

sub regNum($reg, @wordlist)
{
    $reg =~ s"\d|\s""g; 

    my @resultArr;

    OUTER:
    foreach my $word (@wordlist)
    {
        foreach my $char (split('', $reg))
        {
            next OUTER  if( $word !~ /$char/i)
        }
        push(@resultArr, $word);
    }
    
    say join(', ', @resultArr);
}
