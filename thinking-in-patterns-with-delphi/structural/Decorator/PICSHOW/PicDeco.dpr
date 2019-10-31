program PicDeco;

uses
  Forms,
  frmImage in 'frmImage.pas' {ImageForm},
  PicDecorator in 'PicDecorator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TImageForm, ImageForm);
  Application.Run;
end.
