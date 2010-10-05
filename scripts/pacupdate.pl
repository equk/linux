#!/usr/bin/perl
use strict;
use warnings;
my $n = `pacman -Qu | wc -l`;
my $cool = "FFFFFF";
my $medi = "DDDD00";
my $hot = "EE5500";

chomp($n);
if ($n eq "0"){ print '${color '."$cool".'}OK${color}' }
else{ print '${color '."$hot".'}'."$n new".'${color}' }

