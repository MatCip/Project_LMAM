function createGaitReport
%ADVANCEDREPORTCREATE This function creates the file AdvancedReport.docx
%   First it calls the function "getAdvancedReportData" to get the data
%   that should be shown in the report. Then it loops through the holes in
%   "AdvancedReportTemplate" and fills the holes with the data.
%   Copyright 2016 - 2016 The MathWorks, Inc.

   import mlreportgen.dom.*
%    data.Image1    = fullfile(pwd, 'barcode.png')
%    data.Image2    = fullfile(pwd, 'barcode.png');
%    data.Image3    = fullfile(pwd, 'spider.png');
   %Create new object of class Document, based on AdvancedReportTemplate
   struct=load('function_interaction/multi_report_struct.mat');
   path=struct.path_multi;
   
   analysis_struct_PA_Baseline=struct.analysis_struct_PA_Baseline;
   patient_ID=analysis_struct_PA_Baseline.ID;
   patient_struct=load(['User_database/Patient_',patient_ID]);
   doc = Document(['Multiple_Perform_report_',patient_ID] ,'docx', 'Multi_report_template_7');
   analysis_struct_PA_Baseline=struct.analysis_struct_PA_Baseline;
   P_Name=[analysis_struct_PA_Baseline.Name,blanks(2),analysis_struct_PA_Baseline.Surname];
   table=load([path,'/TableGaitMetrics_allTests.mat']);
   TableGaitMetrics_allTests_cell=table.DataCell;
   table=load([path,'/TablePAMetrics_allTests.mat']);
   TablePAMetrics_allTests_cell=table.DataCell;
   table=load([path,'/TablePercentBarcodeStates_allTests.mat']);
   TablePercentBarcodeStates_allTests_cell=table.DataCell;
   %% import the images
%    
     data.Image1    = fullfile(path, 'BarplotPostures_allTests.jpg');
     data.Image2    = fullfile(path, 'BoxPlotDurationPosturePeriods_allTests.jpg');
     data.Image3    = fullfile(path, 'BoxPlotDurationPosturePeriods_allTestsTD.jpg');
     data.Image4    = fullfile(path , 'CDFPlotDurationPosturePeriods_allTestsTD.jpg');
     data.Image9    = fullfile(path, 'cadence_allTests.jpg');
     data.Image9_1    = fullfile(path, 'Steps_allTests.jpg');
    data.Image5    = fullfile(path, 'KneeAngle_allTests.jpg');
    data.Image6    = fullfile(path, 'Limp_allTests.jpg');
    data.Image7    = fullfile(path, 'Speed_allTests.jpg');
     data.Image8    = fullfile(path, 'NormalizedSpeed_allTests.jpg');
    data.Image10   = fullfile(path, 'SymmetryIndex_KneeAngle_allTests.jpg');
    data.Image11    = fullfile(path, 'SymmetryIndex_Stance_allTests.jpg');
    data.Image12   = fullfile(path, 'SymmetryIndex_StrideLength_allTests.jpg');
    data.Image13    = fullfile(path, 'SymmetryIndex_Swing_allTests.jpg');
    data.Image14    = fullfile(path, 'spider_GaitParams_allTests.jpg');
    data.Image15    = fullfile(path, 'spider_perf_DL_allTests.jpg');
%     data.Image13   = fullfile(path_imgs, 'KinematicalCurves_MaxWalk.bmp');
%     data.Image14   = fullfile(path_imgs, 'Spider1.bmp');
%     data.Image15   = fullfile(path_imgs, 'Spider2.bmp');
   %Move to the first hole
    
    %1
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(patient_ID);
     append(doc, textObj); 
   
%    %2
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(P_Name);
     append(doc, textObj); 
     
      HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(patient_struct.Date);
     append(doc, textObj); 
     
    HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(patient_struct.Gender);
     append(doc, textObj); 
     
     

     
     %6
     HoleId = moveToNextHole(doc); 
        fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(patient_struct.CP_Subtype);
     append(doc, textObj); 
     
     %7
     HoleId = moveToNextHole(doc); 
      fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(patient_struct.GMFCS_level);
     append(doc, textObj); 
     
     %8
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(patient_struct.Height);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(patient_struct.Weight);
     append(doc, textObj);
     
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.analysis_struct_PA_Baseline.this_analysis_ID);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.analysis_struct_Gait_Baseline.this_analysis_ID);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.analysis_struct_PA_FW1.this_analysis_ID);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.analysis_struct_Gait_FW1.this_analysis_ID);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.analysis_struct_PA_FW2.this_analysis_ID);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.analysis_struct_Gait_FW2.this_analysis_ID);
     append(doc, textObj);
      HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.analysis_struct_PA_FW3.this_analysis_ID);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.analysis_struct_Gait_FW3.this_analysis_ID);
     append(doc, textObj);

     
     
     HoleId = moveToNextHole(doc); 
     img1 = Image(data.Image1);
     fprintf('Current hole ID: %s\n', HoleId);
     img1.Width  = '7cm';
     img1.Height = '6cm';
     append(doc, img1);
    
     
       HoleId = moveToNextHole(doc); 
       fprintf('Current hole ID: %s\n', HoleId);
     img2 = Image(data.Image2);
     img2.Width  = '7cm';
     img2.Height = '6cm';
     append(doc, img2)
     
      HoleId = moveToNextHole(doc); 
       fprintf('Current hole ID: %s\n', HoleId);
     img3 = Image(data.Image3);
     img3.Width  = '7cm';
    img3.Height = '6cm';
    append(doc, img3)


 HoleId = moveToNextHole(doc); 
       fprintf('Current hole ID: %s\n', HoleId);
     img4 = Image(data.Image4);
     img4.Width  = '7cm';
     img4.Height = '6cm';
     append(doc, img4)
     
     
     
    
     
      
 
     HoleId = moveToNextHole(doc); 
     img5 = Image(data.Image5);
     fprintf('Current hole ID: %s\n', HoleId);
     img5.Width  = '7cm';
     img5.Height = '6cm';
     append(doc, img5)
     
     HoleId = moveToNextHole(doc); 
     img6= Image(data.Image6);
     fprintf('Current hole ID: %s\n', HoleId);
     img6.Width  = '9cm';
     img6.Height = '8cm';
     append(doc, img6)
     
       HoleId = moveToNextHole(doc); 
     img7= Image(data.Image7);
     fprintf('Current hole ID: %s\n', HoleId);
     img7.Width  = '9cm';
     img7.Height = '8cm';
     append(doc, img7)
     
     HoleId = moveToNextHole(doc); 
     img8 = Image(data.Image8);
     fprintf('Current hole ID: %s\n', HoleId);
     img8.Width  = '9cm';
     img8.Height = '8cm';
     append(doc, img8)
     
      HoleId = moveToNextHole(doc); 
     img9 = Image(data.Image9);
     fprintf('Current hole ID: %s\n', HoleId);
     img9.Width  = '9cm';
     img9.Height = '8cm';
     append(doc, img9)
      HoleId = moveToNextHole(doc); 
     img9 = Image(data.Image9_1);
     fprintf('Current hole ID: %s\n', HoleId);
     img9.Width  = '9cm';
     img9.Height = '8cm';
     append(doc, img9)
     
      HoleId = moveToNextHole(doc); 
     img10= Image(data.Image10);
     fprintf('Current hole ID: %s\n', HoleId);
     img10.Width  = '9cm';
     img10.Height = '8cm';
     append(doc, img10)
     
       HoleId = moveToNextHole(doc); 
     img11= Image(data.Image11);
     fprintf('Current hole ID: %s\n', HoleId);
     img11.Width  = '9cm';
     img11.Height = '8cm';
     append(doc, img11)
     
     HoleId = moveToNextHole(doc); 
     img12 = Image(data.Image12);
     fprintf('Current hole ID: %s\n', HoleId);
     img12.Width  = '9cm';
     img12.Height = '8cm';
     append(doc, img12)
     
    HoleId = moveToNextHole(doc); 
     img13 = Image(data.Image13);
     fprintf('Current hole ID: %s\n', HoleId);
     img13.Width  = '9cm';
     img13.Height = '8cm';
     append(doc, img13)
     
     
      HoleId = moveToNextHole(doc);
     table = Table( TableGaitMetrics_allTests_cell, 'AR_Table');
     fprintf('Current hole ID: %s\n', HoleId);
     table.Style={FontSize('10')};
     table.Border = 'single';
     table.ColSep = 'single';
     table.RowSep = 'single';
     append(doc, table);   
     
     HoleId = moveToNextHole(doc);
     table = Table( TablePAMetrics_allTests_cell, 'AR_Table');
     fprintf('Current hole ID: %s\n', HoleId);
     table.Style={FontSize('10')};
     table.Border = 'single';
     table.ColSep = 'single';
     table.RowSep = 'single';
     append(doc, table);   
   
     
     HoleId = moveToNextHole(doc);
     table_1 = Table( TablePercentBarcodeStates_allTests_cell, 'AR_Table');
     fprintf('Current hole ID: %s\n', HoleId);
     table_1.Style={FontSize('10')};
     table_1.Border = 'single';
     table_1.ColSep = 'single';
     table_1.RowSep = 'single';
     append(doc, table_1);   
     
       HoleId = moveToNextHole(doc); 
     img14 = Image(data.Image14);
     fprintf('Current hole ID: %s\n', HoleId);
     img14.Width  = '9cm';
     img14.Height = '8cm';
     append(doc, img14)
     
       HoleId = moveToNextHole(doc); 
     img15 = Image(data.Image15);
     fprintf('Current hole ID: %s\n', HoleId);
     img15.Width  = '9cm';
     img15.Height = '8cm';
     append(doc, img15)
   
    
%      HoleId = moveToNextHole(doc);
%      table = Table( Barcode_table, 'AR_Table');
%      fprintf('Current hole ID: %s\n', HoleId);
%      table.Style={FontSize('10')};
%      table.Border = 'single';
%      table.ColSep = 'single';
%      table.RowSep = 'single';
%      append(doc, table);   
     
     
     
     
   %Close the document and write the result to disc
   close(doc);
   %Show the result
   rptview(['Multiple_Perform_report_',patient_ID], 'docx');
   
   
   
end


function processImage(doc, reportData, holeId)
   %This function adds an image to our report
   import mlreportgen.dom.*   

   %We access the reportData structure dynamically
   fileName = reportData.(holeId);
   %A new Image objected is created and the image is sized 10x10cm
   img = Image(fileName);
   img.Width  = '10cm';
   img.Height = '10cm';
   
   %We create a new paragraph, based on the AR_Image style and append the
   %image to this paragraph. This is done because this style has a center
   %alignment, and so the image is centered too.
%    p = Paragraph( '', 'AR_Image' );
%    append(p, img);
%    append(doc, p);

   %After the image we add another paragraph of AR_Caption style. This
   %style counts the number of images and adds "Figure X: " on front of our
   %text
   %p = Paragraph('This is the MATLAB logo.', 'AR_Caption');
   append(doc, img);
end


function processSimpleTable(doc, reportData, holeId)
   %This function adds a simple table, which is based on the Word style
   %"_AR_Table" to our report
   import mlreportgen.dom.*
   
   %We add a new Level2 Heading before this table
   p = Paragraph('Simple Table Example', 'AR_Heading2');
   append(doc, p);
   %And some description
   p = Paragraph(['This is an example of a simple table. The table ' ...
      'is based upon the Word table style "AR_Table".'], 'AR_Normal');
   append(doc, p);
   
   tableData = reportData.(holeId);
   %The Table class constructor accepts a cell array which contains the
   %data we want to display. The complete table is automatically build for
   %us, based on the input data and the table style AR_Table, which is
   %defined in the Word template
   table = Table( tableData, 'AR_Table');
   append(doc, table);   
end

function processAdvancedTable(doc, reportData, holeId)
   %This function adds a table to our report, which is solely constructed
   %with DOM API commands
   import mlreportgen.dom.*
   
   %We add a new Level2 Heading before this table
   p = Paragraph('Complex Table Example', 'AR_Heading2');
   append(doc, p);
   %And some description
   p = Paragraph(['This is an example of an advanced table, which is ' ...
      'completely created with the DOM API.'], 'AR_Normal');
   append(doc, p);
   
   tableData = reportData.(holeId);
   numCol = size(tableData,2);
   numRow = size(tableData,1);
   %The FormalTable class allows us to build a complete table from scratch.
   %We need to provide the number of columns in the constructor
   table = FormalTable( numCol );
   %The table shall span the page width, so we set the attribute to 100%
   table.Width = '100%';

   %Now we need to create a TableRow object for each row we want to add.
   %This loop is for adding a table header which shall be displayed in bold
   row = TableRow();
   for nc=1:numCol
      %We create a Text for each colum in the header and make it bold
      textObj = Text(sprintf('Row %d', nc));
      textObj.Bold = true;      
      te = TableEntry( textObj );
      %Then a TableEntry is added to the TableRow for each column
      append(row, te );
   end
   %This row is appended to the table-header
   append(table.Header, row);
   
   %This loop fills the table body
   for nr=1:numRow
      row = TableRow();
      for nc=1:numCol
         te = TableEntry( tableData{nr,nc} );
         %The BackgroundColor of each TableEntry shall be filled with a
         %random color.
         bgColor = sprintf('#%x', randi(16777215));
         te.Style  = { BackgroundColor(bgColor) };
         te.VAlign = 'middle';
         append(row, te );
      end
      append(table.Body, row);
   end   
   append(doc, table);   
end

function processStandardHole(doc, reportData, holeId)
   import mlreportgen.dom.*
   
   %This function fills all holes that do not require a special handling.
   %The try/catch block performs an error handling in the case that there
   %is a mismatch between the hole-names in the template and the field-
   %names of the reportData-structure
   try
      data = reportData.(holeId);
   catch
      warning('Undefined Hole-Id: %s', holeId);
      data = 'undefined';
   end

   %Create a new text object and add it to the report
   t = Text(data);   
   append(doc, t);
end
