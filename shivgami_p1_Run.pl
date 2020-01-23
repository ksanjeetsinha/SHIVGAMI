print"
   /\\		Do not provide any of your file name with
  /!!\\		 'seq' , 'outfile' and 'time' word
 /____\\         It may conflict with resulting file names\n";

$arg1=$#ARGV+1;

#print "arg count = $arg1\n";
#print "ARGV[0] = $ARGV[0]\n";

if($arg1==0||$ARGV[0] eq "-h")
{
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

print "==============================\n";
print "PROGRAM-1 : shivgami_p1_Run.pl\n";
print "==============================\n";
print "
(c) 2020, Software written by: Naman Mangukia
naman.neoanderson007(at)gmail.com, namanmangukia(at)gujaratuniversity.ac.in 

If you use this software please cite:
Mangukia N, Raval S, Pandya H and Rawal R (2020)
(Publication is in process)

   SHIVGAMI comes with ABSOLUTELY NO WARRANTY and is a free software to use.

SHIVGAMI assemble the computational power of CPUs from available
LINUX machines and uses them to run blastX process.\n";

print "\n";

	print "USAGE:\tperl $0	file1	file2\n";
	print "Where:\n";
	print "\t'file1' is a FASTA file with a Nucleotide query\n";
	print "\t'file2' is a system-information file of the child nodes\n";
	exit 0;
}

if($arg1!=2)
{
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
print "==============================\n";
print "PROGRAM-1 : shivgami_p1_Run.pl\n";
print "==============================\n";
print "
(c) 2020, Software written by: Naman Mangukia
naman.neoanderson007(at)gmail.com, namanmangukia(at)gujaratuniversity.ac.in 

If you use this software please cite:
Mangukia N, Raval S, Pandya H and Rawal R (2020)
(Publication is in process)

   SHIVGAMI comes with ABSOLUTELY NO WARRANTY and is a free software to use.

SHIVGAMI assemble the computational power of CPUs from available
LINUX machines and uses them to run blastX process.\n";

print "\n";

	print "USAGE:\tperl $0	file1	file2\n";
	print "Where:\n";
	print "\t'file1' is a FASTA file with a Nucleotide query\n";
	print "\t'file2' is a system-information file of the child nodes\n";
	exit 0;
}

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

print "==============================\n";
print "PROGRAM-1 : shivgami_p1_Run.pl\n";
print "==============================\n";
print "
(c) 2020, Software written by: Naman Mangukia
naman.neoanderson007(at)gmail.com, namanmangukia(at)gujaratuniversity.ac.in 

If you use this software please cite:
Mangukia N, Raval S, Pandya H and Rawal R (2020)
(Publication is in process)

   SHIVGAMI comes with ABSOLUTELY NO WARRANTY and is a free software to use.

SHIVGAMI assemble the computational power of CPUs from available
LINUX machines and uses them to run blastX process.\n";

print "\n";


($time1,$path1,$master1_path,$master1_fonm,$master1_pswd,$master1_usr,$master1_ip)='';

$time1=time();
$path1=`pwd`;chomp($path1);

$master1_fonm="master_".$time1;
system("mkdir $master1_fonm");
chdir $master1_fonm;
$master1_path=$path1."/master_".$time1;
$master1_pswd="long_1234";
$master1_usr="lab2";
$master1_ip="172.16.29.127";

($temp1_fasta,$temp1_usrinp)='';
$temp1_fasta=$ARGV[0];chomp($temp1_fasta);
$temp1_usrinp=$ARGV[1];chomp($temp1_usrinp);


system("cp ../$temp1_fasta ../$temp1_usrinp ../shivgami_p2_OneLine.pl ../shivgami_p3_Partition.pl ../shivgami_p4_Status.pl ../shivgami_p5_Merge.pl .");

open(IN1,"$ARGV[1]");

print "\n";
print "--------------------------------------------------\n";
print "|          SYSTEM Information From User          |\n";
print "--------------------------------------------------\n";
print "\n";

while(<IN1>)
{
	chomp;
	($usr0,$ip0)='';
	$usr0=(split '\t',$_)[1];
	$ip0=(split '\t',$_)[2];
	print $usr0."\t\t".$ip0."\n";
}
close IN1;

print "\n";
print "--------------------------------------------------\n";
print "|        Connected System Information            |\n";
print "--------------------------------------------------\n";
print "\n";

open(IN1,"$ARGV[1]");
open(OUT1,">$ARGV[2]");
open(OUT2,">phase2_sysinfo_ByScript.txt");
$counter_connected_sytem=0;
while(<IN1>)
{
	if(/^NO/){}
	else
	{
		chomp;
		($usr1,$ip1,$chk1,$cmd1)='';
		$usr1=(split '\t',$_)[1];
		$ip1=(split '\t',$_)[2];
		$chk1=$usr1."@".$ip1;
		$cmd1=`ping $ip1|head -n 2`;chomp($cmd1);
		$cmd1=~s/\n/\|/;
		if($cmd1=~/\s+ms$/)
		{
			$pwd1='';
			$pwd1=(split '\t',$_)[3];
			$cmd2=`sshpass -p $pwd1 ssh $chk1 'cat /proc/cpuinfo|grep -i process|wc -l'`;chomp($cmd2);

			if($cmd2!~/\d+/)
			{
				$cmd2=0;
				print "System:\t\t\t$chk1\nConnected:\t\tNo\n\n";next;
			}
			if($cmd2!=0)
			{
				print "System:\t\t\t$chk1\nConnected:\t\tYes\nCores_available:\t$cmd2\n\n";
				print OUT2 $usr1."\@".$ip1."\t".$cmd2."\n";$counter_connected_sytem++;
			}
		}
		
	}
}

print "Total $counter_connected_sytem Systems are connected\n\n";


close IN1;
close OUT1;
close OUT2;

print "\n";
print "--------------------------------------------------\n";
print "|                   USER_INPUT                   |\n";
print "--------------------------------------------------\n";
print "\n";

=c
  =====
||     ||
  =====
=cut

print "================================================\n";
print "PLEASE ENTER THE AVAILABLE CORES FOR EACH SYSTEM\n";
print "================================================\n\n";
print "( \n  It is wise to select N-1 cores for your system, instead of using full N cores\n";
print "  Where N = Total numbers of cores.\n";
print "  For Example, If a system has total 8 cores then use maximum upto 7 cores (N=8, hence N-1=7)\n)\n\n";


$total=0;
open(IN2,"phase2_sysinfo_ByScript.txt");
open(OUT3,">phase3_runInfo_ByScript.txt");
while(<IN2>)
{
	chomp;
	($usr2,$core2,$usrinp2)='';
	$usr2=(split '\t',$_)[0];
	$core2=(split '\t',$_)[1];
	if($core2==0){next;}
	print "Enter the cores for system=> $usr2:\t";
	$usrinp2=<stdin>;chomp($usrinp2);
	if($usrinp2>$core2)
	{
		print "Hello! You have entered $usrinp2 while the user $usr2 has total $core2\nPlease enter proper number for cores\n";
		next;
	}

	$total+=$usrinp2;
	print OUT3 $usr2."\t".$core2."\t".$usrinp2."\n";
}
close IN2;
close out3;


print "\n";
print "--------------------------------------------------\n";
print "|            shivgami_p2_OneLine.pl              |\n";
print "--------------------------------------------------\n";
print "\n";

$fasta3=$ARGV[0];
chomp($fasta3);

print "conversion into 1-line..........\n\n";
system("perl shivgami_p2_OneLine.pl $fasta3 phase4_sequence_1L.fasta");

print "\n";
print "--------------------------------------------------\n";
print "|           shivgami_p3_Partition.pl              |\n";
print "--------------------------------------------------\n";
print "\n";

print "Partition..........\n\n";
system("perl shivgami_p3_Partition.pl $total phase4_sequence_1L.fasta seq");

$part1='';
$part1=`ls|grep "^seq_"|wc -l`;
chomp($part1);

if($part1<$total)
{

print "\n";
print "--------------------------------------------------\n";
print "|                     WARNING                    |\n";
print "--------------------------------------------------\n";
print "\n";

	print "\tYou have given total ".$total." cores but possible partitions are ".$part1." cores\n\tSo, please enter the cores in such a manner that a sum-total is LESS THAN OR EQUAL TO ".$part1." (<=".$part1.")\n\n";
	system("rm seq_*");
	exit 0;
}

print "\n";
print "--------------------------------------------------\n";
print "|             USER_INPUT for CORES               |\n";
print "--------------------------------------------------\n";
print "\n";


open(IN4,"phase3_runInfo_ByScript.txt");
open(OUT4,">phase5_mergeInfo.txt");

%hash1_merge=();
%hash2_runCore=();
$i=1;
$cnt4=1;
while(<IN4>)
{
	chomp;
	($usr4,$run_core)='';
	$usr4=(split '\t',$_)[0];
	$run_core=(split '\t',$_)[2];
	if($run_core==0){next;}
	$range='';
	$range=($i+$run_core-1);
	$cat4="cat ";

	for($j=$i;$j<=$range;$j++)
	{
		$cat4.="seq_".$j.".fa ";
	}
	$cat4.=">Merge".$cnt4.".fasta";
	system("$cat4");
	print "Merge".$cnt4.".fasta generated.....\n";

	print OUT4 $usr4."\tMerge".$cnt4.".fasta\n";
	$hash1_merge{$usr4}="Merge".$cnt4.".fasta";
	($core4,$temp4)='';
	$temp4=$hash1_merge{$usr4};
	$hash2_runCore{$hash1_merge{$usr4}}=$run_core;
	$cnt4++;
	$i=$j;

}

close IN4;
close OUT4;



print "\n";
print "--------------------------------------------------\n";
print "|         SENDING FILES TO CHILD NODES           |\n";
print "--------------------------------------------------\n";
print "\n";


$cnt5=1;
open(IN5,"$ARGV[1]");
open(OUT5,">Phase6_output_stuff.txt");
print OUT5 "USR_IP	Process_path	Blast_program_path	Database_path	Script_Name	FastaInput_fileName	blastXoutput_fileName	No_of_Cores	Folder_extension	timeConsumed_fileName\n";
while(<IN5>)
{
	if(/^NO/){}
	else
	{
		chomp;
		($usr5,$ip5,$comb5)='';
		$usr5=(split '\t',$_)[1];
		$ip5=(split '\t',$_)[2];
		$comb5=$usr5."@".$ip5;

		if(exists $hash1_merge{$comb5})
		{
			($blastx_path5,$db_path5)='';

			$blastx_path5=(split '\t',$_)[5];
			$db_path5=(split '\t',$_)[6];

			($fnm5,$pc_blastx_out_fnm5)='';
			$fnm5="pc".$cnt5."_runNback_shfile.pl";
			$pc_blastx_out_fnm5="pc".$cnt5."_blastx_outfile.xml";

			$time5_span_fnm='';
			$time5_span_fnm="pc".$cnt5."_time_".$time1.".txt";

			open(f5,">$fnm5");

			print f5 "open\(f5_1\,\"\>".$time5_span_fnm."\"\)\;\n";

			print f5 "\(\$time2\,\$time3\,\$time4\)\=\'\'\;\n";
			print f5 "\$time2\=time\(\)\;\n";

			print f5 "system\(\"date && time ".$blastx_path5." -query ".$hash1_merge{$comb5}." -db ".$db_path5." -out ".$pc_blastx_out_fnm5." -evalue 1e-05 -outfmt 5 -max_target_seqs 5 -num_threads ".$hash2_runCore{$hash1_merge{$comb5}}."\"\)\;\n";
			print f5 "system\(\"sshpass -p ".$master1_pswd." scp -o StrictHostKeyChecking=no ".$pc_blastx_out_fnm5." ".$master1_usr."\\@".$master1_ip.":".$master1_path."\"\)\;\n";

			print f5 "\$time3\=time\(\)\;\n";
			print f5 "\$time4\=\$time3\-\$time2\;\n";
			print f5 "print f5_1 \$time4\.\"\\n\"\;\n";

			print f5 "close f5_1\;\n";

			print f5 "system\(\"sshpass -p ".$master1_pswd." scp -o StrictHostKeyChecking=no ".$time5_span_fnm." ".$master1_usr."\\@".$master1_ip.":".$master1_path."\"\)\;\n";

			close f5;

			print "\nSending to Child_Node-".$cnt5.":\t".$comb5."\n\n";

			($remote5_newdir,$remote5_past_path,$remote5_final_path)='';
			$remote5_newdir="shiv_pc".$cnt5."_".$time1;

			$remote5_past_path=(split '\t',$_)[4];
			$remote5_final_path=$remote5_past_path."/".$remote5_newdir;

			($send1,$send2,$send3,$pswd5)='';
			$pswd5=(split '\t',$_)[3];

			$send1="sshpass -p ".$pswd5." ssh -o StrictHostKeyChecking=no ".$comb5." \'mkdir ".$remote5_final_path."\'";

			$send2="sshpass -p ".$pswd5." scp -o StrictHostKeyChecking=no ".$fnm5." ".$hash1_merge{$comb5}." ".$comb5.":".$remote5_final_path;
			$send3="sshpass -p ".$pswd5." ssh -o StrictHostKeyChecking=no ".$comb5." \'cd ".$remote5_final_path.";nohup perl ".$fnm5." >/dev/null 2>/dev/null </dev/null \&\'";

			print OUT5 $comb5."\t".$remote5_final_path."\t".$blastx_path5."\t".$db_path5."\t".$fnm5."\t".$hash1_merge{$comb5}."\t".$pc_blastx_out_fnm5."\t".$hash2_runCore{$hash1_merge{$comb5}}."\t".$time1."\t".$time5_span_fnm."\n";

			system("$send1;$send2;$send3");

			$cnt5++;
		}
	}
}

close IN5;
close OUT5;

