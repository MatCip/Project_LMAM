function load_all(FileName_1,Path_1,FileName_2,Path_2,FileName_3,Path_3,FileName_4,Path_4,FileName_5,Path_5) 
s=strcat(Path_1,FileName_1);
mat_1=load(s);
trunk=mat_1.trunk;
disp(' fatto');

s=strcat(Path_2,FileName_2);
mat_1=load(s);
LShank=mat_1.LShank;
disp(' fatto');

s=strcat(Path_3,FileName_3);
mat_1=load(s);
RShank=mat_1.RShank;
disp(' fatto');

s=strcat(Path_4,FileName_4);
mat_1=load(s);
LThigh=mat_1.LThigh;
disp(' fatto');

s=strcat(Path_5,FileName_5);
mat_1=load(s);
RThigh=mat_1.RThigh;
disp(' fatto');

end