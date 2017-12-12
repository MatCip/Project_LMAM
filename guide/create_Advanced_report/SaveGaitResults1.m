function SaveGaitResults1(fname, res, marker)

[filename,pathname]=uiputfile(fname,'Save 2D gait specific Excel file');
if ~isequal(filename,0) && ~isequal(pathname,0)
    fname = [pathname,filename];
end


e = actxserver('excel.application');
e.SheetsInNewWorkbook = 1;
eWorkbook = e.Workbooks.Add;
eSheets = e.ActiveWorkbook.Sheets;
sheet = e.Activesheet;
e.Activesheet.Name = 'Summary';

if ~isfield(res(1).Cycle, 'Stance')
    res = AddMoreParams(res);
end

GIC = 1;
GTC = 1;

titles1 = {'Trial', 'Cycles', 'Start', 'Duration (s)'};
vars = {'Cadence', 'Stance', 'DS', 'Limp', 'Stride', 'Speed', 'Shank', ...
        'Thigh', 'Knee', 'PeakSwingSpeed'};
names = {'Cadence (step/min)', 'Stance (%)', 'DS (%)', 'Limp (%)', ...
         'Stride (m)', 'Speed (m/s)', 'Shank (°)', 'Thigh (°)', 'Knee (°)', 'PeakSwingSpeed (°/s)'};
titles3 = {'Mean', 'STD'};
MakeExcelTitleLine(sheet, titles1, names, titles3);

for i=1:length(res)
    n = length(res(i).Cycle);
    sheet.Range(ToExcelCoords(1, 2+i)).Value = ['Trial' num2str(i)];
    sheet.Range(ToExcelCoords(2, 2+i)).Value = n;
    sheet.Range(ToExcelCoords(3, 2+i)).Value = SecsToHMS(res(i).start/200);
    %sheet.Range(ToExcelCoords(4, 2+i)).Value = (res(i).end - res(i).start)/200;
    sheet.Range(ToExcelCoords(4, 2+i)).Value = 2*(res(i).end - res(i).start)/200;
    
    for j=1:length(vars)
        p = [res(i).Cycle.(vars{j})];
        sheet.Range(ToExcelCoords(4+j*2-1, 2+i)).Value = nanmean(p(1+GIC:n-GTC));
        sheet.Range(ToExcelCoords(4+j*2, 2+i)).Value = nanstd(p(1+GIC:n-GTC));
    end
end

sheet.Range(ToExcelCoords(5,3,4+length(vars)*2,2+length(res))).NumberFormat = '0.00';
sheet.Range(ToExcelCoords(4,3,4,2+length(res))).NumberFormat = '0.0';

%this is for the special case where we have a marker device in recordings
if nargin == 3 && ~isempty(marker)
    sheet.Range(ToExcelCoords(1, 4+length(res))).Value = 'Marker On';
    sheet.Range(ToExcelCoords(2, 4+length(res))).Value = 'Marker Off';
    for i=1:length(marker)
        sheet.Range(ToExcelCoords(1, i+4+length(res))).Value = SecsToHMS(marker(i,1)/200);
        sheet.Range(ToExcelCoords(2, i+4+length(res))).Value = SecsToHMS(marker(i,2)/200);
    end
end


for i=1:length(res)
    eSheets.Add([], eSheets.Item(i));
    eSheets.Item(i+1).Name = ['Trial' num2str(i)];
    eSheets.Item(i+1).Activate;
    sheet = e.Activesheet;
    
    names = { '', 'Cadence (step/min)', 'Gct (s)', 'Swing (%)', 'SwingR (%)', ...
        'SwingL (%)', 'Stance (%)', 'StanceR (%)', 'StanceL (%)', 'IDS (%)', ...
        'TDS (%)', 'DS (%)', 'Limp (%)', 'Stride (m)', 'StrideR (m)', ...
        'StrideL (m)', 'Speed (m/s)', 'SpeedR (m/s)', 'SpeedL (m/s)', ...
        'Shank (°)', 'ShankR (°)', 'ShankL (°)', 'Thigh (°)', 'ThighR (°)', ...
        'ThighL (°)', 'Knee (°)', 'KneeR (°)', 'KneeL (°)', ...
        'PeakSwingSpeed (°/s)', 'PeakSwingSpeedR (°/s)', 'PeakSwingSpeedL (°/s)' };
    MakeExcelTitleLine(sheet, names);
    
    vars = { '', 'Cadence', 'Gct', 'Swing', 'SwingR', ...
        'SwingL', 'Stance', 'StanceR', 'StanceL', 'IDS', ...
        'TDS', 'DS', 'Limp', 'Stride', 'StrideR', ...
        'StrideL', 'Speed', 'SpeedR', 'SpeedL', ...
        'Shank', 'ShankR', 'ShankL', 'Thigh', 'ThighR', ...
        'ThighL', 'Knee', 'KneeR', 'KneeL', ...
        'PeakSwingSpeed', 'PeakSwingSpeedR', 'PeakSwingSpeedL' };
    
    n = length(res(i).Cycle);
    sheet.Range(ToExcelCoords(1,3)).Value = 'mean';
    sheet.Range(ToExcelCoords(1,4)).Value = 'STD';

    for j=2:length(vars)
        p = [res(i).Cycle.(vars{j})]';
        sheet.Range(ToExcelCoords(j, 7, j, 6+n)).Value = Num2CellStr(p);
        sheet.Range(ToExcelCoords(j, 3)).Value = nanmean(p(1+GIC:n-GTC));
        sheet.Range(ToExcelCoords(j, 4)).Value = nanstd(p(1+GIC:n-GTC));
    end
    sheet.Range(ToExcelCoords(1,6)).Value = 'Cycle';
    sheet.Range(ToExcelCoords(1,7,1,6+n)).Value = Num2CellStr([1:n]');
    sheet.Range(ToExcelCoords(2,3,1+length(vars),6+n)).NumberFormat = '0.00';
    sheet.Range(ToExcelCoords(1,7+GIC,1+length(vars),6+n-GTC)).Interior.ColorIndex = 6;
end

eSheets.Item(1).Activate;

try
    eWorkbook.SaveAs([fname], -4143);
catch    
end

eWorkbook.Saved = 1;
eWorkbook.Close;
e.Quit;
e.delete;

% --------------------------------------------------------------------
function MakeExcelTitleLine(sheet, titles1, titles2, titles3)

for i=1:length(titles1)
    sheet.Range(ToExcelCoords(i,1)).Value = titles1{i};
    r = ToExcelCoords(i,1,i,2);
    sheet.Range(r).Merge;
    sheet.Range(r).Interior.ColorIndex = 15;
    sheet.Range(r).VerticalAlignment = -4108; %centered
    sheet.Range(r).HorizontalAlignment = -4108; %centered
    sheet.Range(r).BorderAround(1);
end

if nargin > 2    
    base = length(titles1);
    m = length(titles3);
    for i=1:length(titles2)
        sheet.Range(ToExcelCoords(base + (i-1)*m+1, 1)).Value = titles2{i};
        sheet.Range(ToExcelCoords(base + (i-1)*m+1, 1, base + i*m, 1)).Merge;
        sheet.Range(ToExcelCoords(base + (i-1)*m+1, 1)).HorizontalAlignment = -4108; %centered
        sheet.Range(ToExcelCoords(base + (i-1)*m+1, 1)).BorderAround(1);
        sheet.Range(ToExcelCoords(base + (i-1)*m+1, 1)).Interior.ColorIndex = 15;
    end

    if nargin > 3
        for i=1:length(titles2)
            for j=1:length(titles3)
                sheet.Range(ToExcelCoords(base + (i-1)*m+j, 2)).Value = titles3{j};
                sheet.Range(ToExcelCoords(base + (i-1)*m+j, 2)).BorderAround(1);
                sheet.Range(ToExcelCoords(base + (i-1)*m+j, 2)).Interior.ColorIndex = 15;
            end
        end
    end
end

% --------------------------------------------------------------------
function str = ToExcelCoords(x, y, x2, y2)
% convert an (x,y) or (x1,y1,x2,y2) coordination to an Excel cell address
% example: 1,3 -> A3
%          1,3,1,7 -> A3:A7
x = x - 1;

if x < 26
    str = [char('A'+x) num2str(y)];
elseif x < 26*26
    str = [char('A'+fix(x/26)-1) char('A'+rem(x,26)) num2str(y)];
else
    error('x coordinate too big!');
end

if nargin == 4
    x2 = x2 - 1;
    
    if x2 < 26
        str2 = [char('A'+x2) num2str(y2)];
    elseif x2 < 26*26
        str2 = [char('A'+fix(x2/26)-1) char('A'+rem(x2,26)) num2str(y2)];
    else
        error('x coordinate too big!');
    end
    
    str = [str ':' str2];
end

% --------------------------------------------------------------------
function str = Num2CellStr(a)
% convert elements of a matrix 'a' to strings and put them in a cell array
m = size(a,1);
n = size(a,2);
str = cell(m,n);
for i=1:m
    for j=1:n
        str{i,j} = num2str(a(i,j));
    end
end

% --------------------------------------------------------------------
function str = SecsToHMS(k)
%convert a numerical value of time (in seconds) to text format
H = fix(k/3600);
M = fix((k-H*3600)/60);
S = fix(k-H*3600-M*60);
str = sprintf('%d:%d:%d', H, M, S);