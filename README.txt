CMSSW_CMGPreselection
=====================

Installation within CMSSW environement:

* Install CMSSW
	setenv SCRAM_ARCH slc5_amd64_gcc472
	cmsrel CMSSW_5_3_11
	cd CMSSW_5_3_11/src
	cmsenv
* Set up preselection code
	git clone https://github.com/qbaza/CMSSW_CMGPreselection.git HiggsAnalysis/CMGPreselection
	git clone https://github.com/qbaza/CMSSW_MacroLibrary.git HiggsAnalysis/CMGPreselection/src
	scram b
