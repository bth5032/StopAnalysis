#!/bin/bash

# This stuff to drive the baby maker macro
NAME=$1
NEVENTS=$2
NUMBER=$3

#This stuff to get output back
export COPYDIR=$4

#Show where you are
hostname

#Environment
export CMS_PATH=/cvmfs/cms.cern.ch
export SCRAM_ARCH=slc6_amd64_gcc491
source /cvmfs/cms.cern.ch/cmsset_default.sh

#Set CMSSW environment

#pushd /cvmfs/cms.cern.ch/slc6_amd64_gcc481/cms/cmssw/CMSSW_7_2_0/src/
#eval `scramv1 runtime -sh`
#popd

#Untar the zip dir
echo "This this the current dir: "
THISDIR=`pwd`
echo $THISDIR
echo "LS to check that all files were transferred: "
ls
tar xzfv forCondor_stopBabyMaker_74x.tar.gz
echo "LS to check that tarball was unpacked: "
ls
cd forCondor_stopBabyMaker_74x/CMSSW_7_4_1_patch1/src
echo "LS to check contents of unpacked CMSSW: "
ls

#Show g++ version
echo " " 
echo "G++ INFORMATION" 
g++ --version
which g++

pushd /cvmfs/cms.cern.ch/slc6_amd64_gcc491/cms/cmssw/CMSSW_7_4_1/src/
eval `scramv1 runtime -sh`
popd

export SAbin=/nfs-7/t2tas/Software/StopAnalysisCMSSW/src/StopAnalysis/StopBabyMaker/
export CMSSWdir=/nfs-7/t2tas/Software/StopAnalysisCMSSW/

pushd $CMSSWdir
cmsenv
popd

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SAbin
ln -s $SAbin/json_files json_files


time $SAbin/runBabyMaker "$NAME" $NEVENTS $NUMBER "./"
ls -l `pwd`/${NAME}_${NUMBER}.root

# Copy the output to the output directory via lcg-cp
#  This preserves grid functionality
#echo "copying.  LS is: "
#ls -l ${NAME}_${NUMBER}.root

#lcg-cp -b -D srmv2 --vo cms --connect-timeout 2400 --verbose file://`pwd`/${NAME}_$NUMBER.root srm://bsrm-3.t2.ucsd.edu:8443/srm/v2/server?SFN=${COPYDIR}/${NAME}_$NUMBER.root
#scp ${NAME}_${NUMBER}.root uaf-4.t2.ucsd.edu:$COPYDIR