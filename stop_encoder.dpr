program stop_encoder;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm:= False;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
