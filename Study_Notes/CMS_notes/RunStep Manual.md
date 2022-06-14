# RunStep Manual

## BasicSteps on MadGraph5(v.273)

### Define the process

```shell
## define the process 
## for example

# when run MG5
generate mu+ mu- > h vl vl~
output <filename>
## then we can change parameters in Cards
# run_card.dat
# me5_configuration.txt
## use Cards we can make gridpack file to genValidation(talk later)

# launch and use Pythia8 
launch <filename>
# and you can change the shower peograms to 'Pythia8'
# after running you can find a hepmc file in <filename>/Events/run_0*
gunzip <filename>.hepmc.gz <filename>

```



## Generate Validation

### 配置环境和制作gridpack

```shell
## Produce gridpack on calculate node

## environment needed
## git clone https://github.com/cms-sw/genproductions.git genproductions

    ssh username@202.116.85.59
    passwd
    ssh compute-0-5
    passwd
    
    conda install git
    git checkout mg29x
    
    export PYTHONPATH=~/anaconda3/envs/py37/bin/python
    export CMS_PATH=/cvmfs/cms.cern.ch
    export SITECONFIG_PATH=/cvmfs/cms.cern.ch/SITECONF/local
    export CVSROOT=:gserver:cmssw.cvs.cern.ch:/local/reps/CMSSW
    export PATH=/cvmfs/cms.cern.ch/common/:$PATH
    export MANPATH=/cvmfs/cms.cern.ch/share/man
    
    nohup ./gridpack_generation.sh <Progress> <Progress:PATH>& <Output.log> &
    
```

Cards needed:

1. **XXX_proc_card.dat**, where one declares the process to be generated [MANDATORY]
2. **XXX_run_card.dat**, where one defines particular options on how the generator will run and generate the process, as well as specific kinematic cut values [MANDATORY]
3. **XXX_madspin_card.dat**, where one instructs [MadSpin![img](https://twiki.cern.ch/twiki/pub/TWiki/TWikiDocGraphics/external-link.gif)](https://cp3.irmp.ucl.ac.be/projects/madgraph/wiki/MadSpin) on how to decay specific particles (optional).

*you can find some Cards example in [here](https://github.com/cms-sw/genproductions/tree/master/bin/MadGraph5_aMCatNLO/cards)*

> **Notation**
>
> - Line 4 ：文件运行中相关的文件需要运行该命令git到本地
> - Line 21 ： 在nohup ./gridpack_generation.sh后跟的是**过程的项目名称**和**Cards文件的母文件夹**
> - 如果成功运行得到的是tar.xz的文件输出，用于后面的genValidation

### Use genval-run to generate yoda files

TestFile

*使用已经生成的girdpack运行*

```shell
# test with some minimal events
## generate configs
./genval-run \
-g /home/jiexiao/public/genval/gps/W0JetsToLNu_mlm_slc7_amd64_gcc900_CMSSW_12_0_2_tarball.tar.xz \
-f genFragment/Hadronizer_TuneCP5_13TeV_MLM_5f_max4j_qCut19_LHE_pythia8_cff.py \
-n 100 -j 10 -d W0Jet_MLM -q cmsconnect -m madgraph -b 13000 -a W
## submit jobs
# rm -rf W0Jet_MLM
```

**可以使用命令 condor_q 来查看工作的进度**，更多condor命令请参见附录

> 其他的工作代码参见https://gitlab.cern.ch/jixiao/genValidation/-/tree/master

# Appendix

## **CMSSW**

Setting Up CMS environment [*](http://cms-sw.github.io/singularity.html)

```shell
cmssw-env <opts> # to choose specific env

# SLC5
cmssw-env --cmsos slc5 --command-to-run cat /etc/redhat-release
# SLC6/CentOS6
cmssw-cc6 --command-to-run cat /etc/redhat-release
# SLC7/CentOS7
cmssw-cc7 --command-to-run cat /etc/redhat-release
# EL8/9
cmssw-el9 --command-to-run cat /etc/redhat-release

######
ssh lxplus.cern.ch
cmsrel CMSSW_10_6_28
cd CMSSW_10_6_28/src
cmsenv
```

[you can look up more information in here](https://twiki.cern.ch/twiki/bin/view/CMSPublic/WorkBookWhichRelease)

### "SCRAM"

## condor命令[[*]](https://twiki.cern.ch/twiki/bin/view/CMSPublic/CompOpsGlideinWMSCondorCommands)

**condor_q  查看正在运行的工作序列**

> Condor_q -name <Job_name> 可以查找指定名字的工作

**condor_rm <job#>  通过工作编号删除序列中的工作** 

> Condor_rm -const (expr) 可以根据表达式判断需要删除的工作
>
> ​	condor_rm -const 'jobstatus==5' 删除所有Hold状态的任务

