unit U_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, U_MsgD, System.Actions,
  FMX.ActnList, FMX.Ani;

type
  TFrm_Principal = class(TForm)
    Rct_Menu_Topo: TRectangle;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Btn_Modelo1: TButton;
    ActionList1: TActionList;
    Ac_Ok: TAction;
    Ac_Cancel: TAction;
    FloatAnimation1: TFloatAnimation;
    Btn_Modelo2: TButton;
    FloatAnimation2: TFloatAnimation;
    Ac_Custom: TAction;
    Btn_Modelo3: TButton;
    FloatAnimation3: TFloatAnimation;
    Ac_Alerta: TAction;
    Btn_Modelo4: TButton;
    FloatAnimation4: TFloatAnimation;
    Btn_Modelo5: TButton;
    FloatAnimation5: TFloatAnimation;
    procedure FormCreate(Sender: TObject);
    procedure Btn_Modelo1Click(Sender: TObject);
    procedure Ac_OkExecute(Sender: TObject);
    procedure Ac_CancelExecute(Sender: TObject);
    procedure Btn_Modelo2Click(Sender: TObject);
    procedure Ac_CustomExecute(Sender: TObject);
    procedure Btn_Modelo3Click(Sender: TObject);
    procedure Ac_AlertaExecute(Sender: TObject);
    procedure Btn_Modelo4Click(Sender: TObject);
    procedure Btn_Modelo5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

  MsgD : TMsgD;

implementation

{$R *.fmx}

procedure TFrm_Principal.Ac_AlertaExecute(Sender: TObject);
begin

  MsgD.CloseMsgD;

  while MsgD.IsShowMsgD do
  Application.ProcessMessages;

  Abort;

end;

procedure TFrm_Principal.Ac_CancelExecute(Sender: TObject);
begin

  MsgD.CloseMsgD;

  while MsgD.IsShowMsgD do
  Application.ProcessMessages;

  Btn_Modelo1.AnimateFloat('Position.X',5,0.6);
  Btn_Modelo2.AnimateFloat('Position.X',5,0.6);

end;

procedure TFrm_Principal.Ac_CustomExecute(Sender: TObject);
begin

  MsgD.CloseMsgD;

  while MsgD.IsShowMsgD do
  Application.ProcessMessages;

  if Btn_Modelo2.Opacity = 1 then
   Btn_Modelo2.AnimateFloat('Opacity',0.5,0.6)
  ELse
   Btn_Modelo2.AnimateFloat('Opacity',1,0.6);



end;

procedure TFrm_Principal.Ac_OkExecute(Sender: TObject);
begin

   MsgD.CloseMsgD;

   while MsgD.IsShowMsgD do
   Application.ProcessMessages;

   Btn_Modelo1.AnimateFloat('Position.X',150,0.6);
   Btn_Modelo2.AnimateFloat('Position.X',150,0.6);

end;

procedure TFrm_Principal.Btn_Modelo1Click(Sender: TObject);
begin

   MsgD.FormMsg       := Frm_Principal;
   MsgD.Title         := 'Primeiro modelo';
   MsgD.Text          := 'Você está vendo o primeiro modelo de caixa de dialog.';
   MsgD.ActionOk      := Ac_Ok;
   MsgD.ActionCancel  := Ac_Cancel;
   MsgD.Height        := 220;
   MsgD.ShowMsgD;

end;

procedure TFrm_Principal.Btn_Modelo2Click(Sender: TObject);
begin

   MsgD.FormMsg       := Frm_Principal;
   MsgD.Title         := 'E aí, gostou do resultado ? Mas tem mais ainda.';
   MsgD.Text          := 'Aqui você vai ver como apresentar 3 botões' + #13 +
                         'Botão "OK"' + #13 +
                         'Botão "Cancelar"' + #13 +
                         'E um terceiro a sua escolha' + #13;

   MsgD.ActionOk         := Ac_Ok;
   MsgD.ActionCancel     := Ac_Cancel;
   MsgD.ActionCustom     := Ac_Custom;

   MsgD.ColorBtnCustom   := TAlphaColorRec.Red;
   MsgD.CaptionBtnCustom := 'Não';

   MsgD.Height        := 300;
   MsgD.ShowMsgD;

end;

procedure TFrm_Principal.Btn_Modelo3Click(Sender: TObject);
begin

   MsgD.FormMsg     := Frm_Principal;
   MsgD.Title       := 'Erro';
   MsgD.Text        := 'Ocorreu um erro insperado !';

   MsgD.ActionOk    := Ac_Alerta;
   MsgD.TypeInfo    := tMsgDanger;

   MsgD.Height      := 200;
   MsgD.ShowMsgD;

end;

procedure TFrm_Principal.Btn_Modelo4Click(Sender: TObject);
begin

   MsgD.FormMsg    := Frm_Principal;
   MsgD.Title      := 'Alerta';
   MsgD.Text       := 'O CNPJ é inválido!';

   MsgD.ActionOk   := Ac_Alerta;
   MsgD.TypeInfo   := tMsgDWarning;

   MsgD.Height      := 200;
   MsgD.ShowMsgD;


end;

procedure TFrm_Principal.Btn_Modelo5Click(Sender: TObject);
begin

   MsgD.FormMsg    := Frm_Principal;
   MsgD.Title      := 'Informação';
   MsgD.Text       := 'Cliente salvo com sucesso !';

   MsgD.ActionOk   := Ac_Alerta;
   MsgD.TypeInfo   := tMsgDInformation;

   MsgD.Height      := 200;
   MsgD.ShowMsgD;

end;

procedure TFrm_Principal.FormCreate(Sender: TObject);
begin

   MsgD := TMsgD.Create;

end;

end.
