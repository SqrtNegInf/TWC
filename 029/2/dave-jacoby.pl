#!/usr/local/bin/perl
use v5.36;

no lib '/usr/local/lib/perl5/site_perl/5.32.1';
no lib '/usr/local/lib/perl5/site_perl/5.32.0';

use Inline 'C';

print "9 + 16 = ", add( 9, 16 ), "\n";
print "9 - 16 = ", subtract( 9, 16 ), "\n";

__END__
__C__
int add(int x, int y) {
  return x + y;
}
 
int subtract(int x, int y) {
  return x - y;
}
