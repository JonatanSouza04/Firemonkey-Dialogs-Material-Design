program PrjDialogs;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_Principal in 'U_Principal.pas' {Frm_Principal},
  U_MsgD in 'U_MsgD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.Run;
end.
