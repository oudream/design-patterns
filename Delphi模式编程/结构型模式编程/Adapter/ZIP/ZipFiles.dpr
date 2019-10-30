program ZipFiles;

//
// Copyright 2002, Neal C. Stublen
// Commercial use requires permission.
//
// Contact: nstublen_public@yahoo.com
//

uses
  Forms,
  Form_ZipFiles in 'Form_ZipFiles.pas' {FormZipFiles},
  ZipFilesThread in 'ZipFilesThread.pas',
  Zip32 in 'Zip32.pas',
  MyThread in 'MyThread.pas',
  CompressAdapter in 'CompressAdapter.PAS';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ZIP Files';
  Application.CreateForm(TFormZipFiles, FormZipFiles);
  Application.Run;
end.
