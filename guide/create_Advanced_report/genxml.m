function genxml(str, res)
global fid;
vars = {'HsR', 'ToR', 'HsL', 'ToL', 'Gct', 'SwingR', 'SwingL', 'StanceR', 'StanceL', ...
        'IDS', 'TDS', 'DS', 'Limp', 'StrideR', 'StrideL', 'SpeedR', 'SpeedL', 'ShankR', ...
        'ShankL', 'ThighR', 'ThighL', 'KneeR', 'KneeL', 'PeakSwingSpeedR', 'PeakSwingSpeedL' };
figs = [0, 0, 0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

fid = fopen([str '.xml'],'w');

WriteXMLHeader;
CreateWorkSheet(1, length(vars)+1, length(res)+10);

fprintf(fid,'   <Row>\n');
fprintf(fid,'    <Cell><Data ss:Type="String">Gait Analysis Results of %s</Data></Cell>\n',str);
fprintf(fid,'   </Row>\n');

SkipRow;
fprintf(fid,'   <Row>\n');
    fprintf(fid, '    <Cell><Data ss:Type="String">Total Gait Cycles</Data></Cell>\n');
    fprintf(fid, '    <Cell ss:Index="3"><Data ss:Type="Number">%d</Data></Cell>\n', length(res));
    AddParameterNames;
fprintf(fid,'   </Row>\n');

fprintf(fid, '  <Row>\n');
fprintf(fid, '    <Cell ss:Index="4"><Data ss:Type="String">mean</Data></Cell>\n');
for i=5:length(vars)
    eval(sprintf('AddColumnFormula(''AVERAGE'', length(res), 3, nanmean([res.%s]), %d);',vars{i},figs(i)+1));
end
fprintf(fid,'</Row>\n');

fprintf(fid, '  <Row>\n');
fprintf(fid, '    <Cell ss:Index="4"><Data ss:Type="String">std</Data></Cell>');
for i=5:length(vars)
    eval(sprintf('AddColumnFormula(''STDEV'', length(res), 2, nanmean([res.%s]), %d);',vars{i},figs(i)+1));
end
fprintf(fid,'</Row>\n');

SkipRow;
fprintf(fid,'   <Row>\n');
    AddStringCell('HsR');
    AddStringCell('ToR');
    AddStringCell('HsL');
    AddStringCell('ToL');
    AddParameterNames;
fprintf(fid,'   </Row>\n');    

for i = 1:length(res)
    fprintf(fid,'<Row>\n');
    for j=1:length(vars)
        eval(sprintf('AddNumericCell(res(i).%s,%d);', vars{j}, figs(j)));
    end
    fprintf(fid,'</Row>\n');
end

EndWorkSheet;

fprintf(fid,' </Workbook>\n');

fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function AddColumnFormula(str, n, offset, val, figs)
global fid;

if isnan(val)
    fprintf(fid,'<Cell></Cell>\n');    
else
    fprintf(fid, '    <Cell ss:StyleID="f%d" ss:Formula="=%s(R[%d]C:R[%d]C)">\n', figs, str, offset+1, offset+n);
    fprintf(fid, '     <Data ss:Type="Number">%g</Data></Cell>\n',val);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function AddStringCell(s)
global fid;
fprintf(fid,'<Cell><Data ss:Type="String">%s</Data></Cell>\n',s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function AddNumericCell(n, figures)
global fid;
if isnan(n)
    fprintf(fid,'<Cell></Cell>\n');    
else
    if nargin == 1 | figures == 0
        fprintf(fid,'<Cell><Data ss:Type="Number">%g</Data></Cell>\n',n);
    elseif figures < 4 & figures > 0
        fprintf(fid,'<Cell ss:StyleID="f%d"><Data ss:Type="Number">%g</Data></Cell>\n',figures,n);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function SkipRow
global fid;
fprintf(fid, '   <Row></Row>\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function AddParameterNames
global fid;
vars = {'HsR', 'ToR', 'HsL', 'ToL', 'Gct', 'SwingR', 'SwingL', 'StanceR', 'StanceL', ...
        'IDS', 'TDS', 'DS', 'Limp', 'StrideR', 'StrideL', 'SpeedR', 'SpeedL', 'ShankR', ...
        'ShankL', 'ThighR', 'ThighL', 'KneeR', 'KneeL', 'PeakSwingSpeedR', 'PeakSwingSpeedL' };

fprintf(fid,'    <Cell ss:Index="5"><Data ss:Type="String">Gct</Data></Cell>\n');
for i=6:length(vars)
    fprintf(fid,sprintf('    <Cell><Data ss:Type="String">%s</Data></Cell>\n', vars{i}));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function CreateWorkSheet(n,i,j)
global fid;
fprintf(fid,' <Worksheet ss:Name="Sheet%d">\n',n);
fprintf(fid,'  <Table ss:ExpandedColumnCount="%d" ss:ExpandedRowCount="%d" x:FullColumns="1" x:FullRows="1">\n',i,j);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function EndWorkSheet
global fid;
fprintf(fid,'</Table>\n');
fprintf(fid,'  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">\n');
fprintf(fid,'   <Panes>\n');
fprintf(fid,'    <Pane>\n');
fprintf(fid,'     <Number>3</Number>\n');
fprintf(fid,'     <ActiveRow>1</ActiveRow>\n');
fprintf(fid,'     <ActiveCol>1</ActiveCol>\n');
fprintf(fid,'    </Pane>\n');
fprintf(fid,'   </Panes>\n');
fprintf(fid,'   <ProtectObjects>False</ProtectObjects>\n');
fprintf(fid,'   <ProtectScenarios>False</ProtectScenarios>\n');
fprintf(fid,'  </WorksheetOptions>\n');
fprintf(fid,' </Worksheet>\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function WriteXMLHeader
global fid;
fprintf(fid,'<?xml version="1.0"?>\n');
fprintf(fid,'<?mso-application progid="Excel.Sheet"?>\n');
fprintf(fid,'<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"');
fprintf(fid,' xmlns:o="urn:schemas-microsoft-com:office:office"');
fprintf(fid,' xmlns:x="urn:schemas-microsoft-com:office:excel"');
fprintf(fid,' xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"');
fprintf(fid,' xmlns:html="http://www.w3.org/TR/REC-html40">\n');
fprintf(fid,' <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">\n');
fprintf(fid,'  <Version>11.5606</Version>\n');
fprintf(fid,' </DocumentProperties>\n');
fprintf(fid,' <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">\n');
fprintf(fid,'  <DownloadComponents/>\n');
fprintf(fid,' </OfficeDocumentSettings>\n');
fprintf(fid,' <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">\n');
fprintf(fid,'  <ActiveSheet>1</ActiveSheet>\n');
fprintf(fid,'  <ProtectStructure>False</ProtectStructure>\n');
fprintf(fid,'  <ProtectWindows>False</ProtectWindows>\n');
fprintf(fid,' </ExcelWorkbook>\n');
fprintf(fid,' <Styles>\n');
fprintf(fid,'  <Style ss:ID="Default" ss:Name="Normal">\n');
fprintf(fid,'   <Alignment ss:Vertical="Bottom"/>\n');
fprintf(fid,'   <Borders/>\n');
fprintf(fid,'   <Font/>\n');
fprintf(fid,'   <Interior/>\n');
fprintf(fid,'   <NumberFormat/>\n');
fprintf(fid,'   <Protection/>\n');
fprintf(fid,'  </Style>\n');
fprintf(fid,'  <Style ss:ID="s21">\n');
fprintf(fid,'   <NumberFormat ss:Format="Fixed"/>\n');
fprintf(fid,'  </Style>\n');
fprintf(fid,'  <Style ss:ID="f1">\n');
fprintf(fid,'   <NumberFormat ss:Format="0.0"/>\n');
fprintf(fid,'  </Style>\n');
fprintf(fid,'  <Style ss:ID="f2">\n');
fprintf(fid,'   <NumberFormat ss:Format="0.00"/>\n');
fprintf(fid,'  </Style>\n');
fprintf(fid,'  <Style ss:ID="f3">\n');
fprintf(fid,'   <NumberFormat ss:Format="0.000"/>\n');
fprintf(fid,'  </Style>\n');
fprintf(fid,' </Styles>\n');
