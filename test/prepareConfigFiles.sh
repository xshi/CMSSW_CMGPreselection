#!/bin/bash

rm ConfigFiles/*.config

SYSTEMATICS="
NONE
JER_UP
JER_DOWN
JES_UP
JES_DOWN
LSHAPE_UP
LSHAPE_DOWN
UMET_UP
UMET_DOWN
LES_UP
LES_DOWN
"

MC="
MC8TeV_DYJetsToLL_50toInf
MC8TeV_SingleT_s
MC8TeV_SingleT_t
MC8TeV_SingleT_tW
MC8TeV_SingleTbar_s
MC8TeV_SingleTbar_t
MC8TeV_SingleTbar_tW
MC8TeV_TTJets_TuneP11TeV
MC8TeV_WJets
MC8TeV_WW
"

for i in $MC
do
	echo $i
	cp template.config $i.config
	sed -i 's/sample_name/'$i'/g' $i.config
	sed -i 's/mc/true/g' $i.config
	sed -i 's/data/false/g' $i.config
	sed -i 's/muon_preselection/true/g' $i.config
	sed -i 's/electron_preselection/true/g' $i.config
	sed -i 's/emu_preselection/true/g' $i.config
	sed -i 's/signal/false/g' $i.config
	sed -i 's/uncertainty//g' $i.config
	mv $i.config ConfigFiles
done

DIBOSONS="
MC8TeV_WZ
MC8TeV_ZZ
"

for i in $DIBOSONS
do
	for j in $SYSTEMATICS
	do
		echo ${i}_${j}
		cp template.config ${i}_${j}.config
		sed -i 's/sample_name/'$i'/g' ${i}_${j}.config
		sed -i 's/mc/true/g' ${i}_${j}.config
		sed -i 's/data/false/g' ${i}_${j}.config
		sed -i 's/muon_preselection/true/g' ${i}_${j}.config
		sed -i 's/electron_preselection/true/g' ${i}_${j}.config
		sed -i 's/emu_preselection/true/g' ${i}_${j}.config
		sed -i 's/signal/false/g' ${i}_${j}.config
		sed -i 's/uncertainty/'$j'/g' ${i}_${j}.config
		mv ${i}_${j}.config ConfigFiles
	done
done

SIGNAL_MASS="
200
250
300
350
400
450
500
550
600
700
800
900
1000
"

for mass in $SIGNAL_MASS
do
	for j in $SYSTEMATICS
	do
		i=MC8TeV_GGtoH"$mass"toZZto2L2Nu
		echo ${i}_${j}
		cp template.config ${i}_${j}.config
		sed -i 's/sample_name/'$i'/g' ${i}_${j}.config
		sed -i 's/mc/true/g' ${i}_${j}.config
		sed -i 's/data/false/g' ${i}_${j}.config
		sed -i 's/muon_preselection/true/g' ${i}_${j}.config
		sed -i 's/electron_preselection/true/g' ${i}_${j}.config
		sed -i 's/emu_preselection/true/g' ${i}_${j}.config
		sed -i 's/signal/true/g' ${i}_${j}.config
		sed -i 's/hmass/'$mass'/g' ${i}_${j}.config
		sed -i 's/vbf/false/g' ${i}_${j}.config
		sed -i 's/uncertainty/'$j'/g' ${i}_${j}.config
		mv ${i}_${j}.config ConfigFiles
	done
done

for mass in $SIGNAL_MASS
do
	for j in $SYSTEMATICS
	do
		i=MC8TeV_VBFtoH"$mass"toZZto2L2Nu
		echo ${i}_${j}
		cp template.config ${i}_${j}.config
		sed -i 's/sample_name/'$i'/g' ${i}_${j}.config
		sed -i 's/mc/true/g' ${i}_${j}.config
		sed -i 's/data/false/g' ${i}_${j}.config
		sed -i 's/muon_preselection/true/g' ${i}_${j}.config
		sed -i 's/electron_preselection/true/g' ${i}_${j}.config
		sed -i 's/emu_preselection/true/g' ${i}_${j}.config
		sed -i 's/signal/true/g' ${i}_${j}.config
		sed -i 's/hmass/'$mass'/g' ${i}_${j}.config
		sed -i 's/vbf/true/g' ${i}_${j}.config
		sed -i 's/uncertainty/'$j'/g' ${i}_${j}.config
		mv ${i}_${j}.config ConfigFiles
	done
done

DATA_ELE="
Data8TeV_DoubleElectron2012
"

for i in $DATA_ELE
do
	echo $i
	cp template.config $i.config
	sed -i 's/sample_name/'$i'/g' $i.config
	sed -i 's/mc/false/g' $i.config
	sed -i 's/data/true/g' $i.config
	sed -i 's/muon_preselection/false/g' $i.config
	sed -i 's/electron_preselection/true/g' $i.config
	sed -i 's/emu_preselection/false/g' $i.config
	sed -i 's/signal/false/g' $i.config
	sed -i 's/uncertainty//g' $i.config
	mv $i.config ConfigFiles
done

for i in $DATA_ELE
do
	echo "$i"_Tight
	cp template_Tight.config "$i"_Tight.config
	sed -i 's/sample_name/'$i'/g' "$i"_Tight.config
	sed -i 's/mc/false/g' "$i"_Tight.config
	sed -i 's/data/true/g' "$i"_Tight.config
	sed -i 's/muon_preselection/false/g' "$i"_Tight.config
	sed -i 's/electron_preselection/true/g' "$i"_Tight.config
	sed -i 's/emu_preselection/false/g' "$i"_Tight.config
	sed -i 's/signal/false/g' "$i"_Tight.config
	sed -i 's/uncertainty//g' "$i"_Tight.config
	mv "$i"_Tight.config ConfigFiles
done

DATA_MU="
Data8TeV_AllMu2012
"

for i in $DATA_MU
do
	echo $i
	cp template.config $i.config
	sed -i 's/sample_name/'$i'/g' $i.config
	sed -i 's/mc/false/g' $i.config
	sed -i 's/data/true/g' $i.config
	sed -i 's/muon_preselection/true/g' $i.config
	sed -i 's/electron_preselection/false/g' $i.config
	sed -i 's/emu_preselection/false/g' $i.config
	sed -i 's/signal/false/g' $i.config
	sed -i 's/uncertainty//g' $i.config
	mv $i.config ConfigFiles
done

for i in $DATA_MU
do
	echo "$i"_Tight
	cp template_Tight.config "$i"_Tight.config
	sed -i 's/sample_name/'$i'/g' "$i"_Tight.config
	sed -i 's/mc/false/g' "$i"_Tight.config
	sed -i 's/data/true/g' "$i"_Tight.config
	sed -i 's/muon_preselection/true/g' "$i"_Tight.config
	sed -i 's/electron_preselection/false/g' "$i"_Tight.config
	sed -i 's/emu_preselection/false/g' "$i"_Tight.config
	sed -i 's/signal/false/g' "$i"_Tight.config
	sed -i 's/uncertainty//g' "$i"_Tight.config
	mv "$i"_Tight.config ConfigFiles
done

DATA_EMU="
Data8TeV_MuEG2012
"

for i in $DATA_EMU
do
	echo $i
	cp template.config $i.config
	sed -i 's/sample_name/'$i'/g' $i.config
	sed -i 's/mc/false/g' $i.config
	sed -i 's/data/true/g' $i.config
	sed -i 's/muon_preselection/false/g' $i.config
	sed -i 's/electron_preselection/false/g' $i.config
	sed -i 's/emu_preselection/true/g' $i.config
	sed -i 's/signal/false/g' $i.config
	sed -i 's/uncertainty//g' $i.config
	mv $i.config ConfigFiles
done

