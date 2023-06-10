#!/usr/bin/env perl
use v5.36;

my $sum = 22;
my $binaryTree = buildBinaryTree();
my @aNodes = ();
findCompletePaths(\@aNodes, $binaryTree->{root});

sub findCompletePaths {
    my $refANodes = shift;
    my $node = shift;
    my @aPath =(@{$refANodes},$node->{value} );
    if (defined($node->{left})){
        findCompletePaths(\@aPath,$node->{left});
    }   
    if (defined($node->{right})){            
        findCompletePaths(\@aPath,$node->{right});
    }
    if (scalar @aPath == $binaryTree->{depth}){
        my $total =0;
        map { $total = $total + $_} @aPath;
        if ($total == $sum ){
            foreach my $i (0..$binaryTree->{depth}-1){
                print $aPath[$i].' → ';
            }
            print " sums $sum\n";
        }
    }
}

sub buildBinaryTree {
    my $root = createNode(5);
    $root->{left}  = createNode(4);
    $root->{left}->{left} = createNode(11);
    $root->{left}->{left}->{left} = createNode(7);
    $root->{left}->{left}->{right} = createNode(2);
    $root->{right}  = createNode(8);
    $root->{right}->{left}  = createNode(13);
    $root->{right}->{right}  = createNode(9);
    $root->{right}->{right}->{right}  = createNode(1);
    return  {root => $root, depth => 4};
}

sub createNode {
    my $value = shift;
    my %hTmp =();
    $hTmp{value} = $value;
    $hTmp{left} = undef;
    $hTmp{right} = undef;
    return \%hTmp;
}
