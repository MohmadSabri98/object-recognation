function [ Pathname,Filename] = choose_image( )
[Filename,Pathname]=uigetfile('*.jpg','File Selector');
name=strcat(Pathname,Filename);
end

