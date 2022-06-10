#include "TCanvas.h"
#include "TF1.h"
#include "TH1.h"
#include "TFile.h"
#include "TROOT.h"

void funcFit(){
    //导入root文件并导入直方图数据
TFile *jpdata = new TFile("Jpsi_mass.root");
TH1D *jpsi_mass = (TH1D*) jpdata->Get("jpsi_mass");
//定义参数的初始值和范围
TF1 *usrfunc =new TF1("usrfunc","gaus(0)+pol0(3)",3,3.2);
usrfunc->SetParameters(600,3.09,0.015,98);
usrfunc->SetParLimits(0,500,900);
usrfunc->SetParLimits(1,3.0,3.2);
usrfunc->SetParLimits(2,-1,1);
usrfunc->SetParLimits(3,90,110);
    // 开始拟合并调整相关绘图选项
jpsi_mass->Fit("usrfunc");
jpsi_mass->GetXaxis()->SetTitle("Invariant mass of #mu^{+} #mu^{-} ");
jpsi_mass->GetXaxis()->CenterTitle();
jpsi_mass->Draw("E");
}

