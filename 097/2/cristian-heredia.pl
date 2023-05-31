#!/usr/bin/env perl
use v5.36;

my $B = 101100101;
my $S = 3;
my @cutBinary;
my @C1;
my @C2;
my %hash;

splitBinary();
checkBinaries();

sub splitBinary {
    @cutBinary = $B =~ /\d{1,$S}/g;
}

sub checkBinaries {
    foreach(my $i = 0; $i <@cutBinary; $i++) {
        
        @C1 = split(//,$cutBinary[$i]);
        if (!exists $hash{$cutBinary[$i]}) {
            addKey($cutBinary[$i]);
        }
        else{
            next;
        }
        foreach(my $j = 0; $j <@cutBinary; $j++){
            if($i != $j) {
                @C2 = split(//,$cutBinary[$j]);
                my $total = compareValors(\@C1, \@C2);
                $hash{$cutBinary[$i]} = $hash{$cutBinary[$i]} + $total;
            }
        }
    }
}

sub addKey{
    my $key = shift;
    if(!exists $hash{$key}) {
        $hash{$key} = 0;
    }
}

sub compareValors {
    my @array1 = @{$_[0]};
    my @array2 = @{$_[1]};
    my $counter = 0;
    foreach(my $k = 0; $k <@array1; $k++){
        if ($array1[$k] != $array2[$k]){
            $counter++;
        }
    }
    return $counter;
}

my @small = sort { $hash{$a} <=> $hash{$b} } keys %hash;
my $smallest = $hash{$small[0]};
print "$smallest\n";
