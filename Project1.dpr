program Project1;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {Main},
  fDM in 'fDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
