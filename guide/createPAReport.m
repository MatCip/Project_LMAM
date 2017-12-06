function createPAReport
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
   doc = Document('PhysicalActivityReport_2', 'docx', 'PA_Analysis_template_14');
   struct=load('function_interaction/current_analysis_report.mat');
   parts_cell_report=load('function_interaction/parts_cell_report_PA.mat');
   PATableMatric_struct=load('temp_word_PA/table_PATableMetric.mat');
   percentBarcode_table_struct=load('temp_word_PA/table_percentBarcode.mat');
   MetricPA_table_Cell=PATableMatric_struct.DataCell;
   Barcode_table=percentBarcode_table_struct.DataCell;
   
   %% create the structures
   cell_part=parts_cell_report.cell_part;
   dim_cell=size(cell_part);
   chr = blanks(6);
   str_conf='';
   for i=1:dim_cell(2)
       if(isempty(cell_part{i})==1)
           
           cell_part{i}='';
           disp(i)
       end
       str_conf=[str_conf,chr,cell_part{i}];
       
   end
   
   other_details=struct.other_details;
   
   P_Name=[struct.Name,blanks(2),struct.Surname];
   %% import the images
   path_imgs=struct.path_destination;
   data.Image2    = fullfile(path_imgs, 'PiePostures.tif');
   data.Image1    = fullfile(path_imgs, 'BarplotPostures.tif');
   data.Image4    = fullfile(path_imgs, 'BoxPlotDurationPosturePeriods.tif');
    data.Image3    = fullfile(path_imgs, 'posture_allocation_per_hour.jpg');
    data.Image5    = fullfile(path_imgs, 'PAPattern.jpg');
    data.Image6    = fullfile(path_imgs, 'Barcode.jpg');
   %Move to the first hole
    
    %1
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.ID);
     append(doc, textObj); 
   
%    %2
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.this_analysis_ID);
     append(doc, textObj); 
     3
      HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(P_Name);
     append(doc, textObj); 
     
    HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.date);
     append(doc, textObj); 
     
     

     
     %6
     HoleId = moveToNextHole(doc); 
        fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.Date);
     append(doc, textObj); 
     
     %7
     HoleId = moveToNextHole(doc); 
      fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.Gender);
     append(doc, textObj); 
     
     %8
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.CP_Subtype);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.GMFCS_level);
     append(doc, textObj);
     
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.Height);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(struct.Weight);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(other_details.Advance_of_analysis);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(other_details.monitoring_day);
     append(doc, textObj);
     
      HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(str_conf);
     append(doc, textObj);
     
      HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(other_details.duration);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(other_details.start_time_end_time);
     append(doc, textObj);
     
     HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(other_details.weather);
     append(doc, textObj);
     
    
     
     
       HoleId = moveToNextHole(doc); 
     fprintf('Current hole ID: %s\n', HoleId);
     textObj = Text(other_details.remarks);
     append(doc, textObj);
     
     
     HoleId = moveToNextHole(doc); 
     img1 = Image(data.Image1);
     fprintf('Current hole ID: %s\n', HoleId);
     img1.Width  = '6cm';
     img1.Height = '6cm';
     append(doc, img1);
    
     
       HoleId = moveToNextHole(doc); 
       fprintf('Current hole ID: %s\n', HoleId);
     img2 = Image(data.Image2);
     img2.Width  = '9cm';
     img2.Height = '8cm';
     append(doc, img2)
     
     HoleId = moveToNextHole(doc);
     table = Table( MetricPA_table_Cell, 'AR_Table');
     fprintf('Current hole ID: %s\n', HoleId);
     table.Style={FontSize('10')};
     table.Border = 'single';
     table.ColSep = 'single';
     table.RowSep = 'single';
     append(doc, table);   
     
     HoleId = moveToNextHole(doc); 
     img3 = Image(data.Image3);
     fprintf('Current hole ID: %s\n', HoleId);
     img3.Width  = '9cm';
     img3.Height = '8cm';
     append(doc, img3)
     
     HoleId = moveToNextHole(doc); 
     img4 = Image(data.Image4);
     fprintf('Current hole ID: %s\n', HoleId);
     img4.Width  = '9cm';
     img4.Height = '8cm';
     append(doc, img4)

     HoleId = moveToNextHole(doc); 
     img5 = Image(data.Image5);
     fprintf('Current hole ID: %s\n', HoleId);
     img5.Width  = '9cm';
     img5.Height = '8cm';
     append(doc, img5)
     
     HoleId = moveToNextHole(doc); 
     img6= Image(data.Image6);
     fprintf('Current hole ID: %s\n', HoleId);
     img6.Width  = '9cm';
     img6.Height = '8cm';
     append(doc, img6)
     
     HoleId = moveToNextHole(doc);
     table = Table( Barcode_table, 'AR_Table');
     fprintf('Current hole ID: %s\n', HoleId);
     table.Style={FontSize('10')};
     table.Border = 'single';
     table.ColSep = 'single';
     table.RowSep = 'single';
     append(doc, table);   
     
     
     
     
   %Close the document and write the result to disc
   close(doc);
   %Show the result
   rptview('PhysicalActivityReport_2', 'docx');
   
   
   
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
