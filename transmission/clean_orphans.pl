#!/usr/bin/perl
#

if ( ! exists $ENV{TRANSMISSION_PASSWORD} ) {
	die "missing environment variable TRANSMISSION_PASSWORD";
}

my $password =$ENV{TRANSMISSION_PASSWORD} ;

use strict;
use File::Find;

my $cmd = "transmission-remote -n transmission:$password";
my $local_path = '/var/lib/transmission-daemon/downloads';

my %file_count;

my @torrent_list_raw = qx($cmd  -l);
for my $torrent_line (@torrent_list_raw) {
	chomp $torrent_line;

	if ( $torrent_line =~ /^\s*(\d+)\s+100%/ ) {
		my $torrent_id = $1;

		my @torrent_files = qx($cmd -t $torrent_id -f);
		
		for my $file_info (@torrent_files) {
			chomp $torrent_line;

			if ( $file_info =~ /^\s*\d+: 100% \S+\s+\w+\s+\S+\s+.B\s+(.+)$/ ) {
				my $file = $1;
				$file_count{"./".$file}++;
			}
		}
	}
}

sub wanted {
	if ( -f ) {
		$file_count{$_}++;
	}
}

chdir $local_path;
find({ wanted => \&wanted, no_chdir => 1 }, '.');

#use Data::Dumper;
#print Dumper(\%file_count);


for my $file ( keys(%file_count) ) {
	if ( $file_count{$file} == 1 ) {
		print "$file\n";
	}
}
