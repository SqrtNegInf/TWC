#!/usr/bin/env perl
#use v5.36; #  Argument "-" isn't numeric in numeric eq (==) at fred-zinn.pl line 6.

my @a1= ( "00123", "-00123", "123" );
foreach my $nr (@a1)  {
    if (substr($nr,0,1) == '0')  { $nr  =~ s/^0*//; }
    print "($nr)\n";
}
