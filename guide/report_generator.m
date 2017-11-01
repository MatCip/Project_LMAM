import mlreportgen.report.* 
import mlreportgen.dom.* 

rpt=report ('simple-report','-fpdf');  %selecting the format

%creating title 

tp = TitlePage();
tp.Title = 'Report';
tp.Subtitle = 'Monthly Data';
tp.Author = 'John Smith';
tp.Publisher = 'MathWorks';
tp.PubDate = date();

add(rpt,tp);
rptview(report);
%adding table
rptview(rpt)