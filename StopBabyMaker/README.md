#Stop Analysis

This code is only a slightly modified version of the cmssw74x branch. The main difference is that it makes no attempt to copy the finished babies to "copydir" on your local and some extra timing output was added to the batch/condorExecutable.sh. 

Additionally, since the main failure mode of the condor script was that the copy would fail, there is no need to run the batch submittion through batch/makeBabies.sh. Rather we only need to run batch/batch.sh once since that will submit the jobs, make the babies on the remote machines and then return. 

In order to get automated timing for the jobs submitted by batch/batch.sh, I've included a script batch/timeit.sh. The script prints the start time to standard output, runs batch/batch.sh, abd polls the output of condor_q for jobs submitted by the user. When there are no more jobs in the que, timeit.sh prints the end time to standard output and exits. 

In order to only compute the run time of batch/batch.sh, it's important that you have no other condor jobs running, or the exit condition of timeit.sh will be tainted by other jobs.

The recommended command to run this code is, following the standard filesystem layout in CMSSW_7_4_1_patch1/. 

```
cd StopBabyMaker/batch/
. copy.sh
nohup ./timeit.sh > RUNNAME.stdout 2> RUNNAME.stderr &
```

Then batch.sh will run in the background. You can run 

```
while [ 1 ]; do cat RUNNAME.*; sleep 10; done
```

to check the output of the job. When the job is complete, you should end up with a line that says 

```
Time at finish: ##UNIX TIMESTAMP##
```

Again be sure to run this on a machine which does not have any other condor jobs running that you have submitted. You can ensure that by running 

```
condor_q | grep `whoami`
```
