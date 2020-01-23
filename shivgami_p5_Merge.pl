#*****************************************************************************************#
# _______ _     _ _____ _    _  ______ _______ _______ _____        .      __             #
# |______ |_____|   |    \\  /  |  ____ |_____| |  |  |   |         /|     |  |            #
# ______| |     | __|__   \\/   |_____| |     | |  |  | __|__       _|_ o  |__|            #
#                                                                                         #                                          
# Simplifying tHe titanIc blastx process using aVailable GAthering of coMputational unIts #
#                                                                                         #
#*****************************************************************************************#
#	"===========================================\n";
#	"PROGRAM-5 : prog5_merge_xml_resultFiles.pl \n";
#	"===========================================\n";
#	
#	>>>	THIS PROGRAM WILL MERGE THE XML BLASTX RESULT FILES 
#
#	(c) 2020, Software written by: Naman Mangukia
#	naman.neoanderson007(at)gmail.com, namanmangukia(at)gujaratuniversity.ac.in 
#
#	If you use this software please cite:
#	Mangukia N, Raval S, Pandya H and Rawal R (2020)
#	(Publication is in process)
#
#   	SHIVGAMI comes with ABSOLUTELY NO WARRANTY and is a free software to use.

#	SHIVGAMI assemble the computational power of CPUs from available
#	LINUX machines and uses them to run blastX process.\n";
#

	print "
#*****************************************************************************************#
# _______ _     _ _____ _    _  ______ _______ _______ _____        .      __             #
# |______ |_____|   |    \\  /  |  ____ |_____| |  |  |   |         /|     |  |            #
# ______| |     | __|__   \\/   |_____| |     | |  |  | __|__       _|_ o  |__|            #
#                                                                                         #                                          
# Simplifying tHe titanIc blastx process using aVailable GAthering of coMputational unIts #
#                                                                                         #
#*****************************************************************************************#
\n";

print	"=================================\n";
print	"PROGRAM-5 : shivgami_p5_Merge.pl \n";
print	"=================================\n";
print "
(c) 2020, Software written by: Naman Mangukia
naman.neoanderson007(at)gmail.com, namanmangukia(at)gujaratuniversity.ac.in 

If you use this software please cite:
Mangukia N, Raval S, Pandya H and Rawal R (2020)
(Publication is in process)

   SHIVGAMI comes with ABSOLUTELY NO WARRANTY and is a free software to use.

SHIVGAMI assemble the computational power of CPUs from available
LINUX machines and uses them to run blastX process.\n";



$c1=`ls|grep xml\$|grep outfile|sort -V`;
chomp($c1);

@c2=split('\n',$c1);
($cmd1,$cmd2)='';
foreach $line(@c2)
{
	chomp($line);
	$cmd1.=$line." ";
}
$cmd1=~s/\s$//;

$cmd2="cat ".$cmd1." >Temp.txt";
`$cmd2`;

open(IN1,"Temp.txt");
open(OUT,">Final_result.xml");

$cnt=1;

$flag1=0;
while(<IN1>)
{

	if($flag1==0)
	{
		print OUT $_;
		if(/^\<Iteration\>/)
		{
			$flag1=1;next;
		}
	}
	else
	{
		if((/BlastOutput/)||(/version\=/)||(/Parameters/)||(/^$/)){next;}
		if(/Iteration\_iter\-num/)
		{
			print OUT "  <Iteration_iter-num>".$cnt."</Iteration_iter-num>\n";next;
		}
		if(/Iteration\_query\-ID/)
		{
			print OUT "  <Iteration_query-ID>Query_".$cnt."</Iteration_query-ID>\n";$cnt++;next;
		}
		print OUT $_;
	}
}
print OUT "</BlastOutput_iterations>\n</BlastOutput>";
close IN1;
close OUT;

system("rm Temp.txt");
