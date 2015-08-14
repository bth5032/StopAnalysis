#!/bin/bash

#samples are: ALL,ttbar_madgraph_pythia8_25ns,ttbar_powheg_pythia8_25ns,ttbar_powheg_pythia6_25ns,ttbar_amcnlo_pythia8_25ns,ttbarTo2L2Nu_powheg_25ns,t_tch_5f_amcnlo_pythia8_25ns,t_tch_4f_amcnlo_pythia8_25ns,tbar_tch_4f_powheg_pythia8_25ns,t_tch_4f_powheg_pythia8_25ns,t_sch_4f_amcnlo_pythia8_25ns,t_tbarW_5f_powheg_pythia8_25ns,t_tW_5f_powheg_pythia8_25ns,DYJetsToLL_m10To50_amcnlo_pythia8_25ns,DYJetsToLL_m50_amcnlo_pythia8_25ns,WJetsToLNu_amcnlo_pythia8_25ns,WJetsToLNu_HT100To200_madgraph_pythia8_25ns,WJetsToLNu_HT200To400_madgraph_pythia8_25ns,WJetsToLNu_400To600_madgraph_pythia8_25ns,WJetsToLNu_HT600ToInf_madgraph_pythia8_25ns,WJetsToLNu_HT800To1200_madgraph_pythia8_25ns,WJetsToLNu_HT1200To2500_madgraph_pythia8_25ns,WWToLNuQQ_powheg_25ns,WWTo2l2Nu_powheg_25ns,WpWpJJ_madgraph_pythia8_25ns,WZ_pythia8_25ns,WZTo3LNu_powheg_pythia8_25ns,WZTo1Lnu2Q_amcnlo_pythia8_25ns,ZZ_pythia8_25ns,ZZTo2L2Q_amcnlo_pythia8_25ns,ZZTo4L_powheg_pythia8_25ns,data_double_eg_2015B_50ns,data_double_mu_2015B_50ns,data_muon_eg_2015B_50ns,data_single_electron_2015B_50ns,data_single_muon_2015B_50ns,data_met_2015B_50ns,ttbar_madgraph_pythia8_50ns,ttbar_amcnlo_pythia8_50ns,ttbar_powheg_pythia8_50ns,ttbar_powheg_pythia6_50ns,ttbar_2l2nu_powheg_50ns,T_tch_4f_amcnlo_pythia8_50ns,T_tch_5f_amcnlo_pythia8_50ns,T_tbarW_5f_powheg_pythia8_50ns,T_tch_4f_powheg_pythia8_50ns,Tbar_tch_4f_powheg_pythia8_50ns,DYJetsToLL_m10to50_amcnlo_pythia8_50ns,DYJetsToLL_m50_amcnlo_pythia8_50ns,WJetsToLNu_amcnlo_pythia8_50ns,WW_2l2nu_powheg_50ns,WZ_pythia8_50ns,ZZ_pythia8_50ns,ZZ_4l_powheg_pythia8_50ns

#Choose the sample(s) you want here,separated by commmas
#sampleList_in="ALL"
sampleList_in="ttbar_powheg_pythia8_25ns"
#sampleList_in="ttbar_madgraph_pythia8_25ns,ttbar_powheg_pythia8_25ns,ttbar_powheg_pythia6_25ns,ttbar_amcnlo_pythia8_25ns,ttbarTo2L2Nu_powheg_25ns,t_tch_5f_amcnlo_pythia8_25ns,t_tch_4f_amcnlo_pythia8_25ns,tbar_tch_4f_powheg_pythia8_25ns,t_tch_4f_powheg_pythia8_25ns,t_sch_4f_amcnlo_pythia8_25ns,t_tbarW_5f_powheg_pythia8_25ns,t_tW_5f_powheg_pythia8_25ns,DYJetsToLL_m10To50_amcnlo_pythia8_25ns,DYJetsToLL_m50_amcnlo_pythia8_25ns,WJetsToLNu_amcnlo_pythia8_25ns,WJetsToLNu_HT100To200_madgraph_pythia8_25ns,WJetsToLNu_HT200To400_madgraph_pythia8_25ns,WJetsToLNu_400To600_madgraph_pythia8_25ns,WJetsToLNu_HT600ToInf_madgraph_pythia8_25ns,WJetsToLNu_HT800To1200_madgraph_pythia8_25ns,WJetsToLNu_HT1200To2500_madgraph_pythia8_25ns,WWToLNuQQ_powheg_25ns,WWTo2l2Nu_powheg_25ns,WpWpJJ_madgraph_pythia8_25ns,WZ_pythia8_25ns,WZTo3LNu_powheg_pythia8_25ns,WZTo1Lnu2Q_amcnlo_pythia8_25ns,ZZ_pythia8_25ns,ZZTo2L2Q_amcnlo_pythia8_25ns,ZZTo4L_powheg_pythia8_25ns,data_double_eg_2015B_50ns,data_double_mu_2015B_50ns,data_muon_eg_2015B_50ns,data_single_electron_2015B_50ns,data_single_muon_2015B_50ns,data_met_2015B_50ns,ttbar_madgraph_pythia8_50ns,ttbar_amcnlo_pythia8_50ns,ttbar_powheg_pythia8_50ns,ttbar_powheg_pythia6_50ns,ttbar_2l2nu_powheg_50ns,T_tch_4f_amcnlo_pythia8_50ns,T_tch_5f_amcnlo_pythia8_50ns,T_tbarW_5f_powheg_pythia8_50ns,T_tch_4f_powheg_pythia8_50ns,Tbar_tch_4f_powheg_pythia8_50ns,DYJetsToLL_m10to50_amcnlo_pythia8_50ns,DYJetsToLL_m50_amcnlo_pythia8_50ns,WJetsToLNu_amcnlo_pythia8_50ns,WW_2l2nu_powheg_50ns,WZ_pythia8_50ns,ZZ_pythia8_50ns,ZZ_4l_powheg_pythia8_50ns"

#Choose the number of events (per file): 
nEvents=-1

#Decide if you want lots of printouts telling you the status
verbose="false"

#Set directory to copy results to when finished
copy_dir="$HOME/test/"
if [ ! -d $copy_dir/merged_files ]; then
    >&2 echo "1"
    mkdir $copy_dir/merged_files
    >&2 echo "2"
fi
>&2 echo "3"

#Check that log file folder and tarball files exists
if [ ! -d logs ]; then echo "Run . copy.sh first!"; return 1; fi
if [ ! -e $HOME/forCondor_stopBabyMaker_74x.tar.gz ]; then echo "Run . copy.sh first!"; return 1; fi


#Set directory with the location of the tarball with code
tar_file=$HOME/forCondor_stopBabyMaker_74x.tar.gz

#------HERE THERE BE DRAGONS---------

#Parse sampleList
sampleList=`echo $sampleList_in | tr ',' ' ' `
nSamples=`echo "$sampleList" | wc -w`
echo "$sampleList" | grep "ALL" &>/dev/null
isAll="$?" #note this is opposite
if [ "$isAll" == "0" ] && [ "$nSamples" -gt "1" ]; then echo "Aborting! You can't have ALL as well as other sampleLists, dumbass!"; return 1; fi  
if [ "$isAll" == "0" ]
then 
  sampleList="ttbar_madgraph_pythia8_25ns ttbar_powheg_pythia8_25ns ttbar_powheg_pythia6_25ns ttbar_amcnlo_pythia8_25ns ttbarTo2L2Nu_powheg_25ns t_tch_5f_amcnlo_pythia8_25ns t_tch_4f_amcnlo_pythia8_25ns tbar_tch_4f_powheg_pythia8_25ns t_tch_4f_powheg_pythia8_25ns t_sch_4f_amcnlo_pythia8_25ns t_tbarW_5f_powheg_pythia8_25ns t_tW_5f_powheg_pythia8_25ns DYJetsToLL_m10To50_amcnlo_pythia8_25ns DYJetsToLL_m50_amcnlo_pythia8_25ns WJetsToLNu_amcnlo_pythia8_25ns WJetsToLNu_HT100To200_madgraph_pythia8_25ns WJetsToLNu_HT200To400_madgraph_pythia8_25ns WJetsToLNu_400To600_madgraph_pythia8_25ns WJetsToLNu_HT600ToInf_madgraph_pythia8_25ns WJetsToLNu_HT800To1200_madgraph_pythia8_25ns WJetsToLNu_HT1200To2500_madgraph_pythia8_25ns WWToLNuQQ_powheg_25ns WWTo2l2Nu_powheg_25ns WpWpJJ_madgraph_pythia8_25ns WZ_pythia8_25ns WZTo3LNu_powheg_pythia8_25ns WZTo1Lnu2Q_amcnlo_pythia8_25ns ZZ_pythia8_25ns ZZTo2L2Q_amcnlo_pythia8_25ns ZZTo4L_powheg_pythia8_25ns data_double_eg_2015B_50ns data_double_mu_2015B_50ns data_muon_eg_2015B_50ns data_single_electron_2015B_50ns data_single_muon_2015B_50ns data_met_2015B_50ns ttbar_madgraph_pythia8_50ns ttbar_amcnlo_pythia8_50ns ttbar_powheg_pythia8_50ns ttbar_powheg_pythia6_50ns ttbar_2l2nu_powheg_50ns T_tch_4f_amcnlo_pythia8_50ns T_tch_5f_amcnlo_pythia8_50ns T_tbarW_5f_powheg_pythia8_50ns T_tch_4f_powheg_pythia8_50ns Tbar_tch_4f_powheg_pythia8_50ns DYJetsToLL_m10to50_amcnlo_pythia8_50ns DYJetsToLL_m50_amcnlo_pythia8_50ns WJetsToLNu_amcnlo_pythia8_50ns WW_2l2nu_powheg_50ns WZ_pythia8_50ns ZZ_pythia8_50ns ZZ_4l_powheg_pythia8_50ns"

  sampleList_in="ttbar_madgraph_pythia8_25ns,ttbar_powheg_pythia8_25ns,ttbar_powheg_pythia6_25ns,ttbar_amcnlo_pythia8_25ns,ttbarTo2L2Nu_powheg_25ns,t_tch_5f_amcnlo_pythia8_25ns,t_tch_4f_amcnlo_pythia8_25ns,tbar_tch_4f_powheg_pythia8_25ns,t_tch_4f_powheg_pythia8_25ns,t_sch_4f_amcnlo_pythia8_25ns,t_tbarW_5f_powheg_pythia8_25ns,t_tW_5f_powheg_pythia8_25ns,DYJetsToLL_m10To50_amcnlo_pythia8_25ns,DYJetsToLL_m50_amcnlo_pythia8_25ns,WJetsToLNu_amcnlo_pythia8_25ns,WJetsToLNu_HT100To200_madgraph_pythia8_25ns,WJetsToLNu_HT200To400_madgraph_pythia8_25ns,WJetsToLNu_400To600_madgraph_pythia8_25ns,WJetsToLNu_HT600ToInf_madgraph_pythia8_25ns,WJetsToLNu_HT800To1200_madgraph_pythia8_25ns,WJetsToLNu_HT1200To2500_madgraph_pythia8_25ns,WWToLNuQQ_powheg_25ns,WWTo2l2Nu_powheg_25ns,WpWpJJ_madgraph_pythia8_25ns,WZ_pythia8_25ns,WZTo3LNu_powheg_pythia8_25ns,WZTo1Lnu2Q_amcnlo_pythia8_25ns,ZZ_pythia8_25ns,ZZTo2L2Q_amcnlo_pythia8_25ns,ZZTo4L_powheg_pythia8_25ns,data_double_eg_2015B_50ns,data_double_mu_2015B_50ns,data_muon_eg_2015B_50ns,data_single_electron_2015B_50ns,data_single_muon_2015B_50ns,data_met_2015B_50ns,ttbar_madgraph_pythia8_50ns,ttbar_amcnlo_pythia8_50ns,ttbar_powheg_pythia8_50ns,ttbar_powheg_pythia6_50ns,ttbar_2l2nu_powheg_50ns,T_tch_4f_amcnlo_pythia8_50ns,T_tch_5f_amcnlo_pythia8_50ns,T_tbarW_5f_powheg_pythia8_50ns,T_tch_4f_powheg_pythia8_50ns,Tbar_tch_4f_powheg_pythia8_50ns,DYJetsToLL_m10to50_amcnlo_pythia8_50ns,DYJetsToLL_m50_amcnlo_pythia8_50ns,WJetsToLNu_amcnlo_pythia8_50ns,WW_2l2nu_powheg_50ns,WZ_pythia8_50ns,ZZ_pythia8_50ns,ZZ_4l_powheg_pythia8_50ns"
fi

#nSubmitted (so you know when to quit)
nSubmitted=0

#Start by checking proxy, get path to proxy file
voms-proxy-info --all &> voms_status.txt
if grep "Couldn't find a valid proxy." voms_status.txt &>/dev/null
then 
  echo "Error: couldn't find a valid proxy!  Aborting.  Create a proxy with voms-proxy-init."
  rm voms_status.txt
  return 1
fi
lineWithPath=`sed -n /path/= voms_status.txt`
pathToProxy=`awk -v var="$lineWithPath" 'NR==var {print $3}' voms_status.txt`

#Construct list of all the sample files which will be used for this analysis
for sample in $sampleList
do

  local_sample_dir=`cat ../sample.dat | grep -A2 $sample | grep "LocalPath" | cut -d ' ' -f2`
  hadoop_sample_dir=`cat ../sample.dat | grep -A2 $sample | grep "HadoopPath" | cut -d ' ' -f2`

>&2 echo "for loop"

  for file in `/bin/ls $hadoop_sample_dir/merged_ntuple_*.root`; do
>&2 echo "5"
    number_temp=${file##*/merged_ntuple_}
>&2 echo "6"
    number=${number_temp%*.root}
>&2 echo "7"
    #Except they've finished
    if [ -e $copy_dir/${sample}_${number}.root ] 
    then 
      if [ "$verbose" == "true" ]; then echo "-------------"; echo "${copy_dir}/${sample}_${number} already exists on hadoop, will not resubmit"; fi
      continue
    fi  

    #Status message
    if [ "$verbose" == "true" ]; then echo "-------------"; echo "Working on ${copy_dir}/${sample}_$number"; fi
    
    #Or if they're still running
    if [ -e logs/condorLog_${sample}_${number}.log ] 
    then
      while read line
      do
        if [ `echo $line | awk '{ print $1 }'` == "Cluster" ] 
        then
          cluster=`echo $line | awk '{ print $3 }'`
        elif [ `echo $line | awk '{ print $1 }'` == "Proc" ] 
        then
          process=`echo $line | awk '{ print $3 }'`
        fi  
      done < logs/condorLog_${sample}_${number}.log
      jobid="$cluster.$process"
      condor_q $jobid > temp.txt
      result=`more temp.txt | awk 'END{print $1}'`
      if [ "$result" == "$jobid" ] 
      then
        if [ "$verbose" == "true" ]; then echo "already submitted!"; fi
        let "nSubmitted=$nSubmitted+1"
        continue
      fi  
    fi  
    if [ "$verbose" == "true" ]; then echo "submitting..."; fi
    let "nSubmitted=$nSubmitted+1"

    #Then submit
    cp condorFileTemplate condorFile
    sed -i "s,ARG1,$sample,g" condorFile
    sed -i "s,ARG2,$nEvents,g" condorFile
    sed -i "s,ARG3,$number,g" condorFile
    sed -i "s,ARG4,$copy_dir,g" condorFile
    sed -i "s,USER_PROXY,$pathToProxy,g" condorFile
    sed -i "s,TARFILE,$tar_file,g" condorFile
    condor_submit condorFile
  done
done

#Clean up
rm voms_status.txt &>/dev/null
rm temp.txt &>/dev/null

#Merge
nZombies=0
if [ "$nSubmitted" == "0" ] 
then
  #Check for zombies which should be deleted in copy_dir
  echo "CHECKING FOR ZOMBIES"
  for file in `/bin/ls $copy_dir/*.root`
  do
    root -l -b -q checkForZombies.C'("'$file'")'
    if [ -e listOfZombies.txt ]; then
      zombie=""
      zombie=`tail listOfZombies.txt`
      if [ ! -z $zombie ]; then
	echo "  FOUND ZOMBIE!"
	nZombies=$((nZombies+1))
	echo "  DELETING FILE: $zombie"
	rm -rf $zombie
	echo "  JOB WILL BE RESUBMITTED"
      fi
      rm -rf listOfZombies.txt
    fi
  done

  if [ "$nZombies" == "0" ]; then
    . mergeAll.sh $copy_dir $sampleList_in
    sleep 120
    mv *.root $copy_dir/merged_files/
  fi
fi


#Timer
if [ "$verbose" == "true" ]; then 
    echo `date +"%Y%m%d_%H%M%S"`
fi

#Return exit code
if [ "$nSubmitted" == "0" ] && [ "$nZombies" == "0" ]
then 
    return 1
else 
    return 0
fi

