#CREAte a list of JOBS THAT RAN SUCCESSFULLY
#!/usr/bin/perl
use warnings;
use File::DosGlob qw(bsd_glob);
$count = 1;
@files = glob '*stdout';
    foreach $file (@files) {
	open (INPUT, $file)
	    or die "could not open file '$file' $!";

	open (OUTPUT, ">>output3.txt");
while($row = <INPUT>){
chomp $row;
if ($row =~ m/#BSUB -J/){
    @line =split(/\s+/,$row);
}
if ($row =~ m/Successfully/){
    print OUTPUT "$count "."$line[2]\n";
    print OUTPUT "$file\n";
    print OUTPUT "$row\n";
    print OUTPUT "\n";
    $count++;
}
}
}
close OUTPUT;


