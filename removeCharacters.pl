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


sub loadFile{
	my $fileName = shift;
	my $chars = "";
    open(inFile, "<".$fileName) or die "[loadFile] Cannot load file: $fileName\n";
    while(my $line = <inFile>){
    	chomp($line);
    	$chars = $chars.$line;
    }
    close(inFile);
    return $chars;
}
sub help{
	my $msg = shift;
	print "$msg\n" if (defined $msg);
	print "USAGE: \n";
	print "      $0 <a text file> <a list of characters to be removed>\n";
	print "For example: \n";
	print "      $0 sampleText.txt sampleChars.txt\n";
	print "\n";
    exit;	
}
######################################
# main

my $fileName;
my $charFileName = "diacritics.txt"; # if the second parameter is not provided
if (defined $ARGV[0]){
    $fileName = $ARGV[0];
    if (not  -f $fileName ){
        help("$fileName does not exist.\n");
    }
}
else{
	help("Error --> Please privide a file name.\n");
}

if (defined $ARGV[1]){
   $charFileName = $ARGV[1];
}
if (not  -f $charFileName ){
    help("$charFileName does not exist.\n");
}

my $charPatterns = loadFile($charFileName);
open(inFile, "<".$fileName) or die "Cannot open $fileName \n";
while (my $line = <inFile>){
   $line =~ s/[$charPatterns]//g; 
   print $line;
}

close(inFile);

