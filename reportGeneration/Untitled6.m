% Copyright 2016 - 2016 The MathWorks, Inc.
copyfile( fullfile(matlabroot, 'toolbox\shared\mlreportgen\dom', ...
   'resources\templates\docx\default.dotx'), 'myTemplate.dotx');


function fillFirstHole
% This function fills the hole "firstHole" in myTemplate.dotx
% Copyright 2016 - 2016 The MathWorks, Inc.
   import mlreportgen.dom.*;
   
   doc = Document('firstDocument', 'docx', 'myTemplate');
   holeId = moveToNextHole(doc);
   fprintf('Current hole ID: %s\n', holeId);
   textObj = Text('Hello World');
   append(doc, textObj);
   close(doc);
   
   rptview('firstDocument', 'docx');

end

function fillFirstHoleWithStyle
% This function fills the hole "firstHole" in myTemplate.dotx
% Copyright 2016 - 2016 The MathWorks, Inc.
   import mlreportgen.dom.*;
   
   doc = Document('firstDocument', 'docx', 'myTemplate');
   holeId = moveToNextHole(doc);
   fprintf('Current hole ID: %s\n', holeId);
   textObj = Text('Hello World', 'Heading 1');
   textObj.Bold = true;
   append(doc, textObj);
   close(doc);
   

   rptview('firstDocument', 'docx');   

end


% Copyright 2016 - 2016 The MathWorks, Inc.
!"C:\Program Files (x86)\Microsoft Office\Office15\winword.exe" /N myTemplate.dotx