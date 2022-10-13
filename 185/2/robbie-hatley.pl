#!/usr/bin/env perl


# NOTE: Input should be space-separated 'quoted' command-line arguments:
# ./PWCC_185_P2_Mask_Robbie-Hatley.pl 'ab-cde-123' '123.abc.420' '3abc-0010.xy'
# ./PWCC_185_P2_Mask_Robbie-Hatley.pl '1234567.a' 'a-1234-bc' 'a.b.c.d.e.f'

# NOTE: Output will be (comma-separated list of 'quoted' items):
# ('xx-xxe-123', 'xxx.xbc.420', 'xxxx-0010.xy')
# ('xxxx567.a', 'x-xxx4-bc', 'x.x.x.x.e.f')

use v5.36;
$,="', '";
my @list = ('ab-cde-123', '123.abc.420', '3abc-0010.xy');
my $size = scalar @list;
my $C = qr([0-9a-z]);
for ( my $idx = 0 ; $idx < $size ; ++$idx )
{
   $list[$idx] =~ s/$C/@@@%%%&&&/ for (1..4);
   $list[$idx] =~ s/@@@%%%&&&/x/  for (1..4);
}

print "('"; print @list; print "')\n";
