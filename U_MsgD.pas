unit U_MsgD;

  {** Unit criado por Jonatan Souza

    Esta unit cria uma mensagem do tipo material design - https://www.youtube.com/channel/UC6omhlEXe3ZCMDZd3WyB4_A


    jonatan.souza04@gmail.com
  }


interface

Uses
   System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Actions,
   FMX.Graphics, FMX.Effects, FMX.Forms, FMX.ActnList, FMX.Objects, FMX.StdCtrls, FMX.Types,
   FMX.Ani, FMX.Layouts, System.UIConsts;


 Type

   TTypeMsg = ( tMsgDNone, tMsgDInformation, tMsgDWarning, tMsgDanger );


 Type

  TMsgD = class

    private
    FFormMsg: TForm;
    FActionCancel: TAction;
    FActionOk: TAction;
    FTitle: String;
    FText: String;
    FCaptionBtnOk: String;
    FCaptionBtnCancel: String;
    FBackgroundMsg: Boolean;
    FBackgroundMsgOpacity: Single;
    FHeightMaxMsg: Single;
    FAutoHeight: Boolean;
    FHeighhtMaxMsg: Single;
    FColorBtnOk: TAlphaColor;
    FColorBtnCancel: TAlphaColor;
    FColorTitle: TAlphaColor;
    FColorText: TAlphaColor;
    FHeight: Single;
    FParent: TFmxObject;
    FColorBackgroundTitle: TAlphaColor;
    FTypeInfo: TTypeMsg;
    FActionCustom: TAction;
    FColorBtnCustom: TAlphaColor;
    FCaptionBtnCustom: String;
    FFontName: String;
    FFontSizeTitle: Integer;
    FFontSizeText: Integer;
    procedure SetFormMsg(const Value: TForm);
    procedure SetActionCancel(const Value: TAction);
    procedure SetActionOk(const Value: TAction);
    procedure SetText(const Value: String);
    procedure SetTitle(const Value: String);

    procedure ClickRect(Sender: TObject);
    procedure FinishClose(Sender: TObject);
    procedure OnClickBtnOk(Sender : TObject);
    procedure OnClickBtnCancel(Sender : TObject);
    procedure OnClickBtnCustom(Sender : TObject);

    procedure SetCaptionBtnOk(const Value: String);
    procedure SetCaptionBtnCancel(const Value: String);
    procedure SetBackgroundMsg(const Value: Boolean);
    procedure SetBackgroundMsgOpacity(const Value: Single);
    procedure SetHeightMaxMsg(const Value: Single);
    procedure SetAutoHeight(const Value: Boolean);
    procedure SetColorBtnOk(const Value: TAlphaColor);
    procedure SetColorBtnCancel(const Value: TAlphaColor);
    procedure SetColorTitle(const Value: TAlphaColor);
    procedure SetColorText(const Value: TAlphaColor);

    procedure ClearObj;
    procedure SetHeight(const Value: Single);
    procedure SetColorBackgroundTitle(const Value: TAlphaColor);
    procedure SetTypeInfo(const Value: TTypeMsg);
    procedure SetActionCustom(const Value: TAction);
    procedure SetCaptionBtnCustom(const Value: String);
    procedure SetColorBtnCustom(const Value: TAlphaColor);
    procedure SetFontName(const Value: String);
    procedure SetFontSizeTitle(const Value: Integer);
    procedure SetFontSizeText(const Value: Integer);

  Var

    RectMsg, RectMsgBlack, RectMsgTransp, RectMsgBottom, RectInformation : TRectangle;
    LayoutMsg : TLayout;
    LabelMsgTitle, LabelText : TLabel;
    btnOk, btnCancel, btnCustom : TSpeedButton;
    MsgAnimate, MsgAnimateClose : TFloatAnimation;
    EffectsMsg : TShadowEffect;

  public

      Constructor Create;
      property FormMsg : TForm read FFormMsg write SetFormMsg;

      property ActionCancel : TAction read FActionCancel write SetActionCancel;
      property ActionOk : TAction read FActionOk write SetActionOk;
      property ActionCustom : TAction read FActionCustom write SetActionCustom;


      property Title : String read FTitle write SetTitle;
      property Text : String read FText write SetText;

      property CaptionBtnOk : String read FCaptionBtnOk write SetCaptionBtnOk;
      property CaptionBtnCancel : String read FCaptionBtnCancel write SetCaptionBtnCancel;
      property CaptionBtnCustom : String read FCaptionBtnCustom write SetCaptionBtnCustom;

      property BackgroundMsg : Boolean read FBackgroundMsg write SetBackgroundMsg;
      property BackgroundMsgOpacity : Single read FBackgroundMsgOpacity write SetBackgroundMsgOpacity;

      property Height : Single read FHeight write SetHeight;
      property HeightMaxMsg : Single read FHeighhtMaxMsg write SetHeightMaxMsg;
      property AutoHeight : Boolean read FAutoHeight write SetAutoHeight;

      property ColorBtnOk : TAlphaColor read FColorBtnOk write SetColorBtnOk;
      property ColorBtnCancel : TAlphaColor read FColorBtnCancel write SetColorBtnCancel;
      property ColorBtnCustom : TAlphaColor read FColorBtnCustom write SetColorBtnCustom;

      property ColorTitle : TAlphaColor read FColorTitle write SetColorTitle;
      property ColorText : TAlphaColor read FColorText write SetColorText;
      property ColorBackgroundTitle : TAlphaColor read FColorBackgroundTitle write SetColorBackgroundTitle;

      property TypeInfo : TTypeMsg read FTypeInfo write SetTypeInfo;
      property FontName : String read FFontName write SetFontName;
      property FontSizeTitle : Integer read FFontSizeTitle write SetFontSizeTitle;
      property FontSizeText  : Integer read FFontSizeText write SetFontSizeText;

      procedure ShowMsgD;
      procedure CloseMsgD;
      procedure Clear;

      Function IsShowMsgD : Boolean;

  end;


implementation

{ TMsgD }

constructor TMsgD.Create;
begin

  ClearObj;

end;

procedure TMsgD.Clear;
begin

   ClearObj;

end;

procedure TMsgD.ClearObj;
begin

  if Assigned(LayoutMsg) Then
  LayoutMsg.Visible := False;


  if Assigned(FFormMsg) Then
  FFormMsg := Nil;

  if Assigned(FActionCancel) then
  FActionCancel := Nil;

  if Assigned(FActionOk) then
  FActionOk := Nil;

  if Assigned(FActionCustom) then
  FActionCustom := Nil;

  FTitle           := '';
  FText            := '';
  CaptionBtnOk     := '';
  CaptionBtnCancel := '';
  CaptionBtnCustom := '';

  FBackgroundMsg   := True;
  FBackgroundMsgOpacity := 0.4;
  FHeightMaxMsg         := 0;
  FAutoHeight           := False;

  FColorBtnOk     := TAlphaColorRec.Null;
  FColorBtnCancel := TAlphaColorRec.Null;
  FColorBtnCustom := TAlphaColorRec.Null;

  FColorTitle     := TAlphaColorRec.Null;
  FColorText      := TAlphaColorRec.Null;
  FColorBackgroundTitle := TAlphaColorRec.White;

  FTypeInfo := tMsgDNone;

  FFontName := 'Roboto Th';
  FFontSizeTitle := 18;
  FFontSizeText  := 14;

end;

procedure TMsgD.ClickRect(Sender: TObject);
begin

  CloseMsgD;

  while IsShowMsgD do
  Application.ProcessMessages;

end;

procedure TMsgD.CloseMsgD;
begin


   if (RectMsgBlack <> Nil) And (RectMsg <> Nil) then
   Begin

     RectMsgBlack.AnimateFloat('Opacity',0,0.1);
     MsgAnimateClose.Start;


   End;

   ClearObj;


end;


procedure TMsgD.FinishClose(Sender: TObject);
begin


  if RectMsgBlack <> Nil then
  RectMsgBlack.Visible := False;

  if RectMsg <> Nil then
  RectMsg.Visible := False;

  FTitle            := '';
  FText             := '';
  FCaptionBtnOk     := '';
  FCaptionBtnCancel := '';
  FCaptionBtnCustom := '';

end;

function TMsgD.IsShowMsgD: Boolean;
begin

   if (RectMsgBlack <> Nil) And (RectMsg <> Nil) then
    Result := (RectMsgBlack.Visible) or (RectMsg.Visible)
   Else
    Result := False;

end;


procedure TMsgD.OnClickBtnCancel(Sender: TObject);
begin

 {$IFDEF IOS}

      FActionCancel.Execute;
      CloseMsgD;

 {$ELSE}

 TThread.CreateAnonymousThread(procedure ()
 Begin

  TThread.Synchronize (TThread.CurrentThread,
    procedure ()
    begin

       FActionCancel.Execute;
       CloseMsgD;

    End);


 End).Start;
 {$ENDIF}



end;

procedure TMsgD.OnClickBtnCustom(Sender: TObject);
begin

 TThread.CreateAnonymousThread(procedure ()
 Begin

  TThread.Synchronize (TThread.CurrentThread,
    procedure ()
    begin

       FActionCustom.Execute;

    End);

    CloseMsgD;

 End).Start;

end;

procedure TMsgD.OnClickBtnOk(Sender: TObject);
begin

 TThread.CreateAnonymousThread(procedure ()
 Begin

  TThread.Synchronize (TThread.CurrentThread,
    procedure ()
    begin

       FActionOk.Execute;

    End);

    CloseMsgD;

 End).Start;

end;

procedure TMsgD.SetActionCancel(const Value: TAction);
begin
  FActionCancel := Value;
end;

procedure TMsgD.SetActionCustom(const Value: TAction);
begin
  FActionCustom := Value;
end;

procedure TMsgD.SetActionOk(const Value: TAction);
begin
  FActionOk := Value;
end;

procedure TMsgD.SetAutoHeight(const Value: Boolean);
begin
  FAutoHeight := Value;
end;

procedure TMsgD.SetBackgroundMsg(const Value: Boolean);
begin
  FBackgroundMsg := Value;
end;

procedure TMsgD.SetBackgroundMsgOpacity(const Value: Single);
begin
  FBackgroundMsgOpacity := Value;
end;

procedure TMsgD.SetCaptionBtnCancel(const Value: String);
begin
  FCaptionBtnCancel := Value;
end;

procedure TMsgD.SetCaptionBtnCustom(const Value: String);
begin
  FCaptionBtnCustom := Value;
end;

procedure TMsgD.SetCaptionBtnOk(const Value: String);
begin
  FCaptionBtnOk := Value;
end;

procedure TMsgD.SetColorBackgroundTitle(const Value: TAlphaColor);
begin
  FColorBackgroundTitle := Value;
end;

procedure TMsgD.SetColorBtnCancel(const Value: TAlphaColor);
begin
  FColorBtnCancel := Value;
end;

procedure TMsgD.SetColorBtnCustom(const Value: TAlphaColor);
begin
  FColorBtnCustom := Value;
end;

procedure TMsgD.SetColorBtnOk(const Value: TAlphaColor);
begin
  FColorBtnOk := Value;
end;

procedure TMsgD.SetColorText(const Value: TAlphaColor);
begin
  FColorText := Value;
end;

procedure TMsgD.SetColorTitle(const Value: TAlphaColor);
begin
  FColorTitle := Value;
end;

procedure TMsgD.SetFontName(const Value: String);
begin
  FFontName := Value;
end;

procedure TMsgD.SetFontSizeText(const Value: Integer);
begin
  FFontSizeText := Value;
end;

procedure TMsgD.SetFontSizeTitle(const Value: Integer);
begin
  FFontSizeTitle := Value;
end;

procedure TMsgD.SetFormMsg(const Value: TForm);
begin
  FFormMsg := Value;
end;

procedure TMsgD.SetHeight(const Value: Single);
begin
  FHeight := Value;
end;

procedure TMsgD.SetHeightMaxMsg(const Value: Single);
begin
  FHeightMaxMsg := Value;
end;


procedure TMsgD.SetText(const Value: String);
begin
  FText := Value;
end;

procedure TMsgD.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

procedure TMsgD.SetTypeInfo(const Value: TTypeMsg);
begin
  FTypeInfo := Value;
end;

procedure TMsgD.ShowMsgD;
begin


       if Not Assigned(LayoutMsg) then
       LayoutMsg := TLayout.Create( FFormMsg );

       LayoutMsg.Parent  := FFormMsg;
       LayoutMsg.Align   := TAlignLayout.Client;


       FFormMsg.AddObject(LayoutMsg);
       LayoutMsg.Visible := True;

       if Not Assigned( RectMsgTransp ) then
       RectMsgTransp := TRectangle.Create( LayoutMsg );

       RectMsgTransp.Parent         := LayoutMsg;
       RectMsgTransp.Fill.Color     := TAlphaColorRec.Null;
       RectMsgTransp.Align          := TAlignLayout.Client;
       RectMsgTransp.OnClick        := ClickRect;
       RectMsgTransp.Stroke.Color   := TAlphaColorRec.Null;

       LayoutMsg.AddObject( RectMsgTransp );

     if FBackgroundMsg then
     Begin

        if Not Assigned(RectMsgBlack) then
        RectMsgBlack := TRectangle.Create( RectMsgTransp );

        RectMsgBlack.Parent         := RectMsgTransp;
        RectMsgBlack.Fill.Color     := TAlphaColorRec.Black;
        RectMsgBlack.Stroke.Color   := TAlphaColorRec.Null;
        RectMsgBlack.Opacity        := FBackgroundMsgOpacity;
        RectMsgBlack.Align          := TAlignLayout.Client;
        RectMsgBlack.Visible        := True;
        RectMsgBlack.Margins.Left   := -100;
        RectMsgBlack.Margins.Right  := -100;
        RectMsgBlack.Margins.Bottom := -100;
        RectMsgBlack.Margins.Top    := -100;
        RectMsgBlack.OnClick        := ClickRect;
        RectMsgTransp.AddObject( RectMsgBlack );

     End;

    if Not Assigned(RectMsg) Then
    RectMsg := TRectangle.Create( LayoutMsg );

    RectMsg.Parent   := LayoutMsg;
    RectMsg.Opacity  := 0;

    if Height <= 0 then
     RectMsg.Height   := (FFormMsg.Height / 2) -50
    Else
     RectMsg.Height   := FHeight;

    RectMsg.Width           := FFormMsg.Width - 50;
    RectMsg.Fill.Color      := TAlphaColorRec.White;
    RectMsg.Stroke.Color    := TAlphaColorRec.Null;
    RectMsg.XRadius         := 5;
    RectMsg.YRadius         := 5;
    RectMsg.Margins.Top     := 0;
    RectMsg.Margins.Left    := 15;
    RectMsg.Margins.Right   := 15;
    RectMsg.Margins.Bottom  := 20;
    RectMsg.Visible         := True;
    RectMsg.Align           := TAlignLayout.Center;
    LayoutMsg.AddObject( RectMsg );


    if Not Assigned(RectInformation) Then
    RectInformation := TRectangle.Create( RectMsg );

    RectInformation.Parent         := RectMsg;
    RectInformation.Align          := TAlignLayout.MostTop;
    RectInformation.Height         := 35;
    RectInformation.Stroke.Color   := TAlphaColorRec.Null;
    RectInformation.Margins.Left   := 15;
    RectInformation.Margins.Right  := 15;
    RectInformation.Margins.Bottom := 5;
    RectInformation.Margins.Top    := 10;
    RectInformation.XRadius        := 2;
    RectInformation.YRadius        := 2;

    RectInformation.Fill.Color := TAlphaColorRec.White;

    if FTypeInfo = tMsgDInformation then
     RectInformation.Fill.Color := StringToAlphaColor('#FFB9B9FE')
    Else
    if FTypeInfo = tMsgDWarning then
     RectInformation.Fill.Color := StringToAlphaColor('#FFFFFFB9')
    Else
    if FTypeInfo = tMsgDanger then
     RectInformation.Fill.Color := StringToAlphaColor('#FFFF7878')
    Else
    if FColorBackgroundTitle <> TAlphaColorRec.Null then
     RectInformation.Fill.Color := FColorBackgroundTitle;


    if FTypeInfo <> tMsgDNone then
    RectInformation.Margins.Bottom := 35;

    RectMsg.AddObject(RectInformation);


    if Not Assigned(RectMsgBottom) Then
    RectMsgBottom := TRectangle.Create( RectMsg );

    RectMsgBottom.Parent := RectMsg;
    RectMsgBottom.Align  := TAlignLayout.Bottom;
    RectMsgBottom.Fill.Color   := TAlphaColorRec.Null;
    RectMsgBottom.Stroke.Color := TAlphaColorRec.Null;
    RectMsgBottom.Height       := 65;


    if Not Assigned(MsgAnimateClose) then
    MsgAnimateClose := TFloatAnimation.Create( RectMsg );

    MsgAnimateClose.Parent := RectMsg;

    MsgAnimateClose.Duration      := 0.2;
    MsgAnimateClose.Interpolation := TInterpolationType.Linear;
    MsgAnimateClose.PropertyName  := 'Opacity';
    MsgAnimateClose.StartValue    := 1;
    MsgAnimateClose.StopValue     := 0;
    MsgAnimateClose.OnFinish      := FinishClose;



    if Not Assigned(LabelMsgTitle) then
    LabelMsgTitle := TLabel.Create( RectInformation );

    LabelMsgTitle.AutoSize := True;
    LabelMsgTitle.Parent   := RectInformation;
    LabelMsgTitle.Align    := TAlignLayout.Client;

    LabelMsgTitle.Text := FTitle;

    LabelMsgTitle.Margins.Top   := 2;
    LabelMsgTitle.Margins.Left  := 7;
    LabelMsgTitle.Margins.Right := 0;
    LabelMsgTitle.Margins.Bottom:= 2;

    LabelMsgTitle.StyledSettings           := LabelMsgTitle.StyledSettings - [TStyledSetting.Style];
    LabelMsgTitle.StyledSettings           := LabelMsgTitle.StyledSettings - [TStyledSetting.Family];
    LabelMsgTitle.StyledSettings           := LabelMsgTitle.StyledSettings - [TStyledSetting.Size];
    LabelMsgTitle.StyledSettings           := LabelMsgTitle.StyledSettings - [TStyledSetting.FontColor];
    LabelMsgTitle.StyledSettings           := LabelMsgTitle.StyledSettings - [TStyledSetting.Other];

    LabelMsgTitle.TextSettings.Font.Style  := LabelMsgTitle.TextSettings.Font.Style + [ TFontStyle.fsBold ];
    LabelMsgTitle.TextSettings.Font.Family := FFontName;
    LabelMsgTitle.TextSettings.Font.Size   := FFontSizeTitle;
    LabelMsgTitle.TextSettings.WordWrap    := True;
    LabelMsgTitle.TextSettings.VertAlign   := TTextAlign.Center;
    LabelMsgTitle.TextSettings.HorzAlign   := TTextAlign.Leading;

    LabelMsgTitle.Visible := ( FTitle <> '' );
    LabelMsgTitle.FontColor := TAlphaColorRec.Black;

    if ColorTitle <> TAlphaColorRec.Null then
     LabelMsgTitle.FontColor := ColorTitle
    Else
    if FTypeInfo = tMsgDInformation then
    Begin

     LabelMsgTitle.FontColor                := TAlphaColorRec.White;
     LabelMsgTitle.TextSettings.HorzAlign   := TTextAlign.Center;

    End
    Else
    if FTypeInfo = tMsgDWarning then
    Begin

     LabelMsgTitle.FontColor                := TAlphaColorRec.Black;
     LabelMsgTitle.TextSettings.HorzAlign   := TTextAlign.Center;

    End
    Else
    if FTypeInfo = tMsgDanger then
    Begin

     LabelMsgTitle.FontColor                := TAlphaColorRec.White;
     LabelMsgTitle.TextSettings.HorzAlign   := TTextAlign.Center;

    End;

     RectInformation.Height := LabelMsgTitle.Height + 25;

    if Not Assigned(LabelText) then
    LabelText := TLabel.Create( RectMsg );

    LabelText.Parent        := RectMsg;
    LabelText.AutoSize      := True;
    LabelText.Align         := TAlignLayout.Top;
    LabelText.Margins.Top   := 5;
    LabelText.Margins.Left  := 20;
    LabelText.Margins.Right := 20;
    LabelText.Margins.Bottom:= 5;

    LabelText.StyledSettings           := LabelText.StyledSettings - [TStyledSetting.Style];
    LabelText.StyledSettings           := LabelText.StyledSettings - [TStyledSetting.Family];
    LabelText.StyledSettings           := LabelText.StyledSettings - [TStyledSetting.Size];
    LabelText.StyledSettings           := LabelText.StyledSettings - [TStyledSetting.FontColor];
    LabelText.StyledSettings           := LabelText.StyledSettings - [TStyledSetting.Other];

    LabelText.TextSettings.Font.Family := FFontName;
    LabelText.TextSettings.Font.Size   := FFontSizeText;
    LabelText.TextSettings.VertAlign   := TTextAlign.Center;


    if ColorText <> TAlphaColorRec.Null then
     LabelText.FontColor := ColorText
    Else
     LabelText.FontColor := TAlphaColorRec.Slategray;

    LabelText.Text := Text;

   // RectMsg.Width           := LabelText.Width - 60;

    {** Btn Custom }
    if Not Assigned(btnCustom) then
    btnCustom := TSpeedButton.Create( RectMsgBottom );

    btnCustom.Parent := RectMsgBottom;
    btnCustom.Align  := TAlignLayout.Left;
    btnCustom.Width          := 120;
    btnCustom.Margins.Left   := 10;
    btnCustom.Margins.Right  := 5;
    btnCustom.StyledSettings := btnCustom.StyledSettings - [TStyledSetting.Style];
    btnCustom.StyledSettings := btnCustom.StyledSettings - [TStyledSetting.Family];
    btnCustom.StyledSettings := btnCustom.StyledSettings - [TStyledSetting.Size];
    btnCustom.StyledSettings := btnCustom.StyledSettings - [TStyledSetting.FontColor];
    btnCustom.StyledSettings := btnCustom.StyledSettings - [TStyledSetting.Other];
    btnCustom.TextSettings.Font.Family := FFontName;
    btnCustom.TextSettings.Font.Size   := 14;
    btnCustom.Text           := 'Custom';


    if FCaptionBtnCustom <> '' then
    btnCustom.Text := FCaptionBtnCustom;

    if ColorBtnCustom <> TAlphaColorRec.Null then
     btnCustom.FontColor := ColorBtnCustom
    Else
     btnCustom.FontColor  := TAlphaColorRec.Cornflowerblue;


    {** Btn Ok }
    if Not Assigned(btnOk) then
    btnOk := TSpeedButton.Create( RectMsgBottom );

    btnOk.Parent := RectMsgBottom;
    btnOk.Align  := TAlignLayout.Right;
    btnOk.Width          := 75;
    btnOk.Margins.Left   := 10;
    btnOk.Margins.Right  := 10;
    btnOk.StyledSettings := btnOk.StyledSettings - [TStyledSetting.Style];
    btnOk.StyledSettings := btnOk.StyledSettings - [TStyledSetting.Family];
    btnOk.StyledSettings := btnOk.StyledSettings - [TStyledSetting.Size];
    btnOk.StyledSettings := btnOk.StyledSettings - [TStyledSetting.FontColor];
    btnOk.StyledSettings := btnOk.StyledSettings - [TStyledSetting.Other];
    btnOk.TextSettings.Font.Family := FFontName;
    btnOk.TextSettings.Font.Size   := 14;
    btnOk.Text           := 'OK';

    if FCaptionBtnOk <> '' then
    btnOk.Text := FCaptionBtnOk;

    if Length(FCaptionBtnOk) > 5 then
    btnOk.Width :=  btnOk.Width + ( Length(FCaptionBtnOk) * 2.5 );


    if ColorBtnOk <> TAlphaColorRec.Null then
     btnOk.FontColor := ColorBtnOk
    Else
     btnOk.FontColor      := TAlphaColorRec.Cornflowerblue;


    {** Btn Cancek }
    if Not Assigned(btnCancel) then
    btnCancel := TSpeedButton.Create( RectMsgBottom );

    btnCancel.Parent := RectMsgBottom;
    btnCancel.Position.Y  := btnOk.Position.Y;
    btnCancel.Position.X  := btnOk.Position.X - 75;
    btnCancel.Height      := btnOk.Height;
    btnCancel.Width       := btnOk.Width;
    btnCancel.StyledSettings := btnCancel.StyledSettings - [TStyledSetting.Style];
    btnCancel.StyledSettings := btnCancel.StyledSettings - [TStyledSetting.Family];
    btnCancel.StyledSettings := btnCancel.StyledSettings - [TStyledSetting.Size];
    btnCancel.StyledSettings := btnCancel.StyledSettings - [TStyledSetting.FontColor];
    btnCancel.StyledSettings := btnCancel.StyledSettings - [TStyledSetting.Other];
    btnCancel.TextSettings.Font.Family := FFontName;
    btnCancel.TextSettings.Font.Size   := 14;
    btnCancel.Text      := 'Cancelar';

    btnCancel.FontColor := TAlphaColorRec.Cornflowerblue;

    if ColorBtnCancel <> TAlphaColorRec.Null then
     btnCancel.FontColor := ColorBtnCancel
    Else
     btnCancel.FontColor := TAlphaColorRec.Cornflowerblue;

    if FCaptionBtnCancel <> '' then
    btnCancel.Text := FCaptionBtnCancel;

    if FAutoHeight then
    Begin

        RectMsg.Height := LabelMsgTitle.Height + LabelMsgTitle.Margins.Top + LabelMsgTitle.Margins.Bottom +
                          LabelText.Height + LabelText.Margins.Top + LabelText.Margins.Bottom +
                          RectMsgBottom.Height + RectMsgBottom.Margins.Top + RectMsgBottom.Margins.Bottom + 10;

    End;

    if RectMsg.Height > (FFormMsg.Height - 35) then
    RectMsg.Height := (FFormMsg.Height - 35);

    if ( FHeightMaxMsg > 0 ) And ( RectMsg.Height > FHeightMaxMsg ) then
    RectMsg.Height   := FHeightMaxMsg;


    btnOk.Visible     := ( ActionOk <> Nil );
    btnCancel.Visible := ( ActionCancel <> Nil );
    btnCustom.Visible := ( ActionCustom <> Nil );

    if btnOk.Visible then
    btnOk.OnClick := OnClickBtnOk;

    if btnCancel.Visible then
    btnCancel.OnClick := OnClickBtnCancel;

    if btnCustom.Visible then
    btnCustom.OnClick := OnClickBtnCustom;

    LayoutMsg.BringToFront;

    if Not Assigned(EffectsMsg) Then
    EffectsMsg := TShadowEffect.Create( LayoutMsg );

    EffectsMsg.Parent      := RectMsg;
    EffectsMsg.Direction   := 45;
    EffectsMsg.Distance    := 5;
    EffectsMsg.Opacity     := 0.5;
    EffectsMsg.Softness    := 0.4;
    EffectsMsg.ShadowColor := TAlphaColorRec.Black;

    RectMsg.AddObject(EffectsMsg);
    RectMsg.BringToFront;

    RectMsg.Opacity := 1;

end;

end.
