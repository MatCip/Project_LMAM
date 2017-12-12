
filename = 'GaitAnalysisReport.xls';
sheet = 1;
xlRange = 'B3:X400';

walking_params_new = xlsread(filename,sheet,xlRange);
save walking_params_new walking_params_new