#!/usr/bin/env perl

use feature 'say';

use Math::Roman qw(roman);

sub roman_maths {
    my ($string)=@_;
    
    ($string =~ /([IVXLCMD]+)\s*([+-\/\*]\**)\s*([IVXLCMD]+)/)
        || die 'Invalid input';
     
     
     ( ($2 eq '-') && ($1 eq $3) ) && return 'nulla';
     
     ( ($2 eq '-') && ( roman($1) < roman($3) ) ) && 
        return 'non potest';
     
     ( ($2 eq '/') && ( (roman($1) % roman($3) ) > 0 ) ) &&
        return 'non potest';
        
     my $roman=eval("roman($1) $2 roman($3)"); 
     if ($roman > 3999) {
        return 'non potest';
     }
     else {
        return $roman;
    }
}


say 'IV+V: ' . &roman_maths('IV+V');
say 'M-I: ' . &roman_maths('M-I');
say 'X/II: ' . &roman_maths('X/II');
say 'XI*VI: ' . &roman_maths('XI*VI');
say 'VII**III: ' . &roman_maths('VII**III');
say 'V-V: ' . &roman_maths('V-V');
say 'V/II: ' . &roman_maths('V/II');
say 'MMM+M: ' . &roman_maths('MMM+M');
say 'V-X: ' . &roman_maths('V-X');

