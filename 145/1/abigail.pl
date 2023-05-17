#!/usr/bin/env perl
use v5.36;

use Math::Matrix;
say Math::Matrix:: -> new ([split ' ' => '1 2 3']) -> dot_product
   (Math::Matrix:: -> new ([split ' ' => '4 5 6']));
#say Math::Matrix:: -> new ([split ' ' => scalar <>]) -> dot_product
#   (Math::Matrix:: -> new ([split ' ' => scalar <>]));
