unit Unit13;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.ExtCtrls, FMX.Layouts, System.IOUtils,
  uTelegramAPI, uTelegramAPI.Interfaces, uConsts, uClassMessageDTO,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TForm13 = class(TForm)
    StyleBook1: TStyleBook;
    FramedScrollBox1: TFramedScrollBox;
    ImageViewer1: TImageViewer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label4: TLabel;
    FramedScrollBox2: TFramedScrollBox;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Memo2: TMemo;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure momo1C(Sender: TObject);
    procedure frm13C(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Déclarations privées }
    FTelegram: iTelegramAPI;
    FAsyncHttp: TThread;
    procedure OnAPIError(AExcept: Exception);
  public
    { Déclarations publiques }
  end;

var
  Form13: TForm13;

implementation

{$R *.fmx}

procedure TForm13.Button1Click(Sender: TObject);
begin
  if (Edit1.Text = '') and (Edit2.Text='') then
  begin
    ShowMessage('Champs laissées vides !');
  end else begin
    FramedScrollBox1.Visible := false;
    FramedScrollBox2.Visible := true;
    FTelegram
    .OnError(OnAPIError)
    .SetUserID(Edit2.Text)
    .SetBotToken(Edit1.Text);
  end;

end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  FTelegram.SendMsg(Memo1.Text);
  Memo2.Text := FTelegram.GetResult();
end;

procedure TForm13.Button3Click(Sender: TObject);
var chemin : String;
begin
  if OpenDialog1.Execute then
  begin
  FTelegram.SendFile(OpenDialog1.FileName);
  Memo2.Text := FTelegram.GetResult();
  end;
end;


procedure TForm13.frm13C(Sender: TObject);
begin
  FTelegram := TTelegramAPI.New();
  Memo2.ClearContent;
  Memo1.ClearContent;
  Edit1.Text := '6007813787:AAE5SBLPpHIYLHWwyFYb7ayUSABkOFigfSs';
  Edit2.Text := '-660057343';
end;

procedure TForm13.momo1C(Sender: TObject);
begin
  if Memo1.Text = '' then
  begin
    Button2.Enabled := false;
  end else begin
    Button2.Enabled := true;
  end;
end;


procedure TForm13.OnAPIError(AExcept: Exception);
begin
  TThread.Synchronize(TThread.Current, procedure
  begin
    ShowMessage('Une erreur est survenue !');
  end);
end;
end.
