#!/usr/local/bin/perl
use v5.36;

no lib '/usr/local/lib/perl5/site_perl/5.32.1';
no lib '/usr/local/lib/perl5/site_perl/5.32.0';

#use Data::Dumper;
use Benchmark qw(:all);

use Inline 'C';


sub perl_sqrt( $x )
{
  my $EPSILON = 0.00001;
  my $w=1.0;
  for(;;)
  {
  	my $h=$x/$w;
  last if abs($h-$w)<$EPSILON;
	$w = ($w+$h)/2;
  }
  return $w;
}


#greet('thingy');
#greet(42);
#greet(4.6);
my $sc = c_sqrt( 145 );
my $sp = perl_sqrt( 145 );
print "sqrt(145)=$sc by C, =$sp by perl\n";
__END__
__C__
void greet(SV* sv_name) {
  printf("Hello %s!\n", SvPV(sv_name, PL_na));
}
double c_sqrt( double x ) {
  #define EPSILON 0.00001
  double w=1.0;
  for(;;)
  {
  	double h=x/w;
  if( fabs(h-w)<EPSILON ) break;
	w = (w+h)/2;
  }
  return w;
}
