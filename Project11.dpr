program Project11;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit13 in 'Unit13.pas' {Form13},
  uClassMessageDTO in 'D:\Telegram_PRJ\uClassMessageDTO.pas',
  uConsts in 'D:\Telegram_PRJ\uConsts.pas',
  uTelegramAPI.Interfaces in 'D:\Telegram_PRJ\uTelegramAPI.Interfaces.pas',
  uTelegramAPI in 'D:\Telegram_PRJ\uTelegramAPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
