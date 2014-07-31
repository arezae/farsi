#!/usr/bin/perl -w

# Created: 31 July 2014
# By: Ali Reza Ebadat

# The goal is to remove diacritics from the given file

use FindBin;
use lib "$FindBin::Bin/.";

use strict;
use warnings;
use utf8;


use open ':encoding(UTF-8)';
binmode(STDOUT,"utf8");
binmode(STDERR,"utf8");


######################################
# main

my $fileName;
if (defined $ARGV[0]){
   $fileName = $ARGV[0];
   if (not  -f $fileName ){
       print "$fileName does not exist.\n";
   }
}
else{
   print "Error --> Please privide a file name.\n";
   exit;
}

open(inFile, "<".$fileName) or die "Cannot open $fileName \n";
while (my $line = <inFile>){
   $line =~ s/ ً//g; # tanvin
   $line =~ s/ ٍ//g; # 
   $line =~ s/ َ//g; # fatha
   $line =~ s/ ُ//g; # damma
   $line =~ s/ ِ//g; # kasra
   $line =~ s/ ّ//g; # shadda
   print $line;
}

close(inFile);

