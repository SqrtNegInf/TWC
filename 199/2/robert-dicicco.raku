#!/usr/bin/env raku

my %seen = ();

my @list = (3,0,1,1,9,7);

my $x = 7;

my $y = 2;

my $z = 3;

my $cnt = 0;

sub TestArray(@arr) {

                my $first=@arr[0];

                my $second=@arr[1];

                my $third=@arr[2];

                my $teststr = join("",@list);

                my @x1 = $teststr.indices($first);

                my @x2 = $teststr.indices($second);

                my @x3 = $teststr.indices($third);

                                if @x1[0] > @x2[0] || @x2[0] > @x3[0] || @x1[0] > @x3[0] {

                                return -1;

                }

                if ($first - $second).abs > $x { return -1};

                if ($second - $third).abs > $y { return -1};

                if ($first  - $third).abs > $z { return -1};

                return 1;

}

 

for @list.combinations: 3 -> @res {

                my  $retval = TestArray(@res);

                my $combined = "@res[0]@res[1]@res[2]";

                if ($retval == 1) {

                                if (! defined %seen{$combined}) {

                                                %seen{$combined} = 1;

                                                print "@res[0], @res[1], @res[2]\n";

                                } else {

                                                %seen{$combined}++;

                                }

                }

}
