% Calculate AUC for lorenz curve
%EgDNA_AUC=trapz(FractionGenome{1}(1:1000:possum{1}(1,1),1),FractionCoverage{1}(1:1000:possum{1}(1,1),1))
%SgDNA_AUC=trapz(FractionGenome{2}(1:1000:possum{2}(1,1),1),FractionCoverage{2}(1:1000:possum{2}(1,1),1))

Ep1_AUC=trapz(FractionGenome{1}(1:1000:possum{1}(1,1),1), FractionCoverage{1}(1:1000:possum{1}(1,1),1))
Ep2_AUC=trapz(FractionGenome{1}(1:1000:possum{1}(1,2),2), FractionCoverage{1}(1:1000:possum{1}(1,2),2))
EgDNA_AUC=trapz(FractionGenome{1}(1:1000:possum{1}(1,3),3),FractionCoverage{1}(1:1000:possum{1}(1,3),3))

Ep3_AUC=trapz(FractionGenome{1}(1:1000:possum{1}(1,4),4), FractionCoverage{1}(1:1000:possum{1}(1,4),4))
Ep4_AUC=trapz(FractionGenome{1}(1:1000:possum{1}(1,5),5), FractionCoverage{1}(1:1000:possum{1}(1,5),5))
Ep5_AUC=trapz(FractionGenome{1}(1:1000:possum{1}(1,6),6), FractionCoverage{1}(1:1000:possum{1}(1,6),6))

Sp1_AUC=trapz(FractionGenome{2}(1:1000:possum{2}(1,1),1), FractionCoverage{2}(1:1000:possum{2}(1,1),1))
Sp2_AUC=trapz(FractionGenome{2}(1:1000:possum{2}(1,2),2), FractionCoverage{2}(1:1000:possum{2}(1,2),2))
Sp3_AUC=trapz(FractionGenome{2}(1:1000:possum{2}(1,3),3), FractionCoverage{2}(1:1000:possum{2}(1,3),3))
Sp4_AUC=trapz(FractionGenome{2}(1:1000:possum{2}(1,4),4), FractionCoverage{2}(1:1000:possum{2}(1,4),4))
Sp5_AUC=trapz(FractionGenome{2}(1:1000:possum{2}(1,5),5), FractionCoverage{2}(1:1000:possum{2}(1,5),5))
Sp6_AUC=trapz(FractionGenome{2}(1:1000:possum{2}(1,6),6), FractionCoverage{2}(1:1000:possum{2}(1,6),6))
Sp7_AUC=trapz(FractionGenome{2}(1:1000:possum{2}(1,7),7), FractionCoverage{2}(1:1000:possum{2}(1,7),7))

% MFT2_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,6),6), FractionCoverage{3}(1:1000:possum{3}(1,6),6))
% MFT3_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,7),7), FractionCoverage{3}(1:1000:possum{3}(1,7),7))
% MFT4_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,8),8), FractionCoverage{3}(1:1000:possum{3}(1,8),8))
% MFT5_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,9),9), FractionCoverage{3}(1:1000:possum{3}(1,9),9))
% MFT1_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,5),5), FractionCoverage{3}(1:1000:possum{3}(1,5),5))

MF1_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,1),1), FractionCoverage{3}(1:1000:possum{3}(1,1),1))
MF2_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,2),2), FractionCoverage{3}(1:1000:possum{3}(1,2),2))
MF3_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,3),3), FractionCoverage{3}(1:1000:possum{3}(1,3),3))
MF4_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,4),4), FractionCoverage{3}(1:1000:possum{3}(1,4),4))
MF5_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,5),5), FractionCoverage{3}(1:1000:possum{3}(1,5),5))

% T1_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,1),1), FractionCoverage{3}(1:1000:possum{3}(1,1),1))
% T2_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,2),2), FractionCoverage{3}(1:1000:possum{3}(1,2),2))
% T3_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,3),3), FractionCoverage{3}(1:1000:possum{3}(1,3),3))
% T4_AUC=trapz(FractionGenome{3}(1:1000:possum{3}(1,4),4), FractionCoverage{3}(1:1000:possum{3}(1,4),4))

