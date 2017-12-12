function gentxt(str, Cycle)
fid = fopen([str '.xls'],'w');
fprintf(fid,'Gait Analysis Results of %s\n', str);

fprintf(fid, 'HsR\tToR\tHsL\tToL\tGct\tSwingR\tStanceR\tSwingL\tStanceL\tIDS\tTDS\tDS\tLimp\t');
fprintf(fid, 'StrideR\tStrideL\tSpeedR\tSpeedL\tShankR\tShankL\tThighR\tThighL\tKneeR\tKneeL\t');
fprintf(fid, 'PeakSwingSpeedR\tPeakSwingSpeedL\n');

for i=1:length(Cycle)
    fprintf(fid, '%d\t', Cycle(i).HsR);
    fprintf(fid, '%d\t', Cycle(i).ToR);    
    fprintf(fid, '%d\t', Cycle(i).HsL);    
    fprintf(fid, '%d\t', Cycle(i).ToL);    
    fprintf(fid, '%.2f\t', Cycle(i).Gct);
    fprintf(fid, '%.1f\t', Cycle(i).SwingR);
    fprintf(fid, '%.1f\t', Cycle(i).StanceR);
    fprintf(fid, '%.1f\t', Cycle(i).SwingL);
    fprintf(fid, '%.1f\t', Cycle(i).StanceL);
    fprintf(fid, '%.1f\t', Cycle(i).IDS);
    fprintf(fid, '%.1f\t', Cycle(i).TDS);
    fprintf(fid, '%.1f\t', Cycle(i).DS);
    fprintf(fid, '%.1f\t', Cycle(i).Limp);
    fprintf(fid, '%.2f\t', Cycle(i).StrideR);
    fprintf(fid, '%.2f\t', Cycle(i).StrideL);
    fprintf(fid, '%.2f\t', Cycle(i).SpeedR);
    fprintf(fid, '%.2f\t', Cycle(i).SpeedL);
    fprintf(fid, '%.1f\t', Cycle(i).ShankR);
    fprintf(fid, '%.1f\t', Cycle(i).ShankL);
    fprintf(fid, '%.1f\t', Cycle(i).ThighR);
    fprintf(fid, '%.1f\t', Cycle(i).ThighL);
    fprintf(fid, '%.1f\t', Cycle(i).KneeR);
    fprintf(fid, '%.1f\t', Cycle(i).KneeL);
    fprintf(fid, '%.1f\t', Cycle(i).PeakSwingSpeedR);
    fprintf(fid, '%.1f\n', Cycle(i).PeakSwingSpeedL);
end

fprintf(fid, '\n\n\t\t\t\tGct\tSwingR\tStanceR\tSwingL\tStanceL\tIDS\tTDS\tDS\tLimp\t');
fprintf(fid, 'StrideR\tStrideL\tSpeedR\tSpeedL\tShankR\tShankL\tThighR\tThighL\tKneeR\tKneeL\t');
fprintf(fid, 'PeakSwingSpeedR\tPeakSwingSpeedL\n');

fprintf(fid, 'mean\t\t\t\t');
fprintf(fid, '%.2f\t', nanmean([Cycle.Gct]));
fprintf(fid, '%.1f\t', nanmean([Cycle.SwingR]));
fprintf(fid, '%.1f\t', nanmean([Cycle.StanceR]));
fprintf(fid, '%.1f\t', nanmean([Cycle.SwingL]));
fprintf(fid, '%.1f\t', nanmean([Cycle.StanceL]));
fprintf(fid, '%.1f\t', nanmean([Cycle.IDS]));
fprintf(fid, '%.1f\t', nanmean([Cycle.TDS]));
fprintf(fid, '%.1f\t', nanmean([Cycle.DS]));
fprintf(fid, '%.1f\t', nanmean([Cycle.Limp]));
fprintf(fid, '%.2f\t', nanmean([Cycle.StrideR]));
fprintf(fid, '%.2f\t', nanmean([Cycle.StrideL]));
fprintf(fid, '%.2f\t', nanmean([Cycle.SpeedR]));
fprintf(fid, '%.2f\t', nanmean([Cycle.SpeedL]));
fprintf(fid, '%.1f\t', nanmean([Cycle.ShankR]));
fprintf(fid, '%.1f\t', nanmean([Cycle.ShankL]));
fprintf(fid, '%.1f\t', nanmean([Cycle.ThighR]));
fprintf(fid, '%.1f\t', nanmean([Cycle.ThighL]));
fprintf(fid, '%.1f\t', nanmean([Cycle.KneeR]));
fprintf(fid, '%.1f\t', nanmean([Cycle.KneeL]));
fprintf(fid, '%.1f\t', nanmean([Cycle.PeakSwingSpeedR]));
fprintf(fid, '%.1f\n', nanmean([Cycle.PeakSwingSpeedL]));

fprintf(fid, 'std\t\t\t\t');
fprintf(fid, '%.2f\t', nanstd([Cycle.Gct]));
fprintf(fid, '%.1f\t', nanstd([Cycle.SwingR]));
fprintf(fid, '%.1f\t', nanstd([Cycle.StanceR]));
fprintf(fid, '%.1f\t', nanstd([Cycle.SwingL]));
fprintf(fid, '%.1f\t', nanstd([Cycle.StanceL]));
fprintf(fid, '%.1f\t', nanstd([Cycle.IDS]));
fprintf(fid, '%.1f\t', nanstd([Cycle.TDS]));
fprintf(fid, '%.1f\t', nanstd([Cycle.DS]));
fprintf(fid, '%.1f\t', nanstd([Cycle.Limp]));
fprintf(fid, '%.2f\t', nanstd([Cycle.StrideR]));
fprintf(fid, '%.2f\t', nanstd([Cycle.StrideL]));
fprintf(fid, '%.2f\t', nanstd([Cycle.SpeedR]));
fprintf(fid, '%.2f\t', nanstd([Cycle.SpeedL]));
fprintf(fid, '%.1f\t', nanstd([Cycle.ShankR]));
fprintf(fid, '%.1f\t', nanstd([Cycle.ShankL]));
fprintf(fid, '%.1f\t', nanstd([Cycle.ThighR]));
fprintf(fid, '%.1f\t', nanstd([Cycle.ThighL]));
fprintf(fid, '%.1f\t', nanstd([Cycle.KneeR]));
fprintf(fid, '%.1f\t', nanstd([Cycle.KneeL]));
fprintf(fid, '%.1f\t', nanstd([Cycle.PeakSwingSpeedR]));
fprintf(fid, '%.1f\n', nanstd([Cycle.PeakSwingSpeedL]));

fclose(fid);