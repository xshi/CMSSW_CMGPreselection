CMSSW_CMGPreselection
=====================

Installation within CMSSW environement:

* Install CMSSW
	ssh <username>@lx64slc5.cern.ch
	setenv SCRAM_ARCH slc5_amd64_gcc472
	cmsrel CMSSW_6_2_6
	cd CMSSW_6_2_6/src
	cmsenv
* Set up preselection code
	git clone https://github.com/qbaza/CMSSW_CMGPreselection.git HiggsAnalysis/CMGPreselection
	git clone https://github.com/qbaza/CMSSW_MacroLibrary.git HiggsAnalysis/CMGPreselection/src
	scram b
	rehash
* Run test preselection job
	cd HiggsAnalysis/CMGPreselection/test
	cmsStage /store/cmst3/user/psilva/5311_ntuples/MC8TeV_ZZ_0.root .
	cmsStage /store/cmst3/user/psilva/5311_ntuples/MC8TeV_ZZ_1.root .
	hadd -f MC8TeV_ZZ.root MC8TeV_ZZ_0.root MC8TeV_ZZ_1.root
	rm MC8TeV_ZZ_0.root MC8TeV_ZZ_1.root
	mkdir OutputSamples
	preselectionHZZ2l2nu MC8TeV_ZZ.config
