unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls, ImgList;

type
  TFormMain = class(TForm)
    TI: TTrayIcon;
    PMTray: TPopupMenu;
    ButtomStartStop: TMenuItem;
    N1: TMenuItem;
    ButtonClose: TMenuItem;
    ILMenuIcons: TImageList;
    ButtomMinimize: TMenuItem;
    StartWMEShiftF71: TMenuItem;
    StopWMEShiftf81: TMenuItem;
    procedure ButtomStartStopClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtomMinimizeClick(Sender: TObject);
    procedure StartWMEShiftF71Click(Sender: TObject);
    procedure StopWMEShiftf81Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure StartStopAdobeEncoder;
    procedure StartWME;
    procedure StopWME;
  public
    { Public declarations }
  protected
    procedure hotykey(var msg:TMessage); message WM_HOTKEY;
  end;

var
  FormMain: TFormMain;
  id1, id2, id3: integer;

implementation

{$R *.dfm}

procedure TFormMain.StartWME;
var
h, h2: HWND;
begin
  h:=findwindow(nil, 'Кодировщик Windows Media');
  SendMessage(h, WM_SYSCOMMAND, SC_HOTKEY, h);
  SendMessage(h, WM_SYSCOMMAND, SC_RESTORE, h);
  h2:=findwindowex(h, 0, 'TEdit' ,nil);
  caption:=format('%d - %d', [h,h2]);
  SetForegroundWindow(h);
  Windows.SetFocus(h2);
  keybd_event(VK_CONTROL, 0, 0, 0);
  keybd_event(VK_SHIFT, 0, 0, 0);
  keybd_event(ord('E'), 0, 0, 0);
  keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);
  keybd_event(ord('E'), 0, KEYEVENTF_KEYUP, 0);
sleep(250);
if (ButtomMinimize.Checked) and (IsWindowVisible(h) and (GetWindow (h, GW_OWNER) = 0) and (GetParent(h) = 0))
then PostMessage(h, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TFormMain.StartWMEShiftF71Click(Sender: TObject);
begin
StartWME;
end;

procedure TFormMain.StopWME;
var
h, h2: HWND;
begin
  h:=findwindow(nil, 'Кодировщик Windows Media');
  SendMessage(h, WM_SYSCOMMAND, SC_HOTKEY, h);
  SendMessage(h, WM_SYSCOMMAND, SC_RESTORE, h);
  h2:=findwindowex(h, 0, 'TEdit', nil);
  caption:=format('%d - %d', [h,h2]);
  SetForegroundWindow(h);
  Windows.SetFocus(h2);
  keybd_event(VK_CONTROL, 0, 0, 0);
  keybd_event(VK_SHIFT, 0, 0, 0);
  keybd_event(ord('S'), 0, 0, 0);
  keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
  keybd_event(VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);
  keybd_event(ord('S'), 0, KEYEVENTF_KEYUP, 0);
sleep(250);
if (ButtomMinimize.Checked) and (IsWindowVisible(h) and (GetWindow (h, GW_OWNER) = 0) and (GetParent(h) = 0))
then PostMessage(h, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TFormMain.StopWMEShiftf81Click(Sender: TObject);
begin
StopWME;
end;

procedure TFormMain.StartStopAdobeEncoder;
var
h, h2: HWND;
begin
  h:=findwindow(nil, 'Adobe Flash Media Live Encoder 3');
  SendMessage(h, WM_SYSCOMMAND, SC_HOTKEY, h);
  SendMessage(h, WM_SYSCOMMAND, SC_RESTORE, h);
  h2:=findwindowex(h, 0, 'TEdit', nil);
  caption:=format('%d - %d', [h,h2]);
  SetForegroundWindow(h);
  Windows.SetFocus(h2);
  keybd_event(VK_RETURN, 0, 0, 0);
  keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
sleep(250);
if (ButtomMinimize.Checked) and (IsWindowVisible(h) and (GetWindow (h, GW_OWNER) = 0) and (GetParent(h) = 0))
then PostMessage(h, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TFormMain.hotykey(var msg:TMessage);
begin
if (msg.LParamLo=MOD_SHIFT) AND (msg.LParamHi=120) then
begin
ButtomStartStop.click;
end;

if (msg.LParamLo=MOD_SHIFT) AND (msg.LParamHi=121) then
begin
StartWME;
end;

if (msg.LParamLo=MOD_SHIFT) AND (msg.LParamHi=122) then
begin
StopWME;
end;

end;

procedure TFormMain.ButtomMinimizeClick(Sender: TObject);
begin
if ButtomMinimize.Checked then
  ButtomMinimize.Checked:= false
  else
  ButtomMinimize.Checked:= true;
end;

procedure TFormMain.ButtonCloseClick(Sender: TObject);
begin
Close;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
id1:=GlobalAddAtom('hotkey1');
RegisterHotKey(handle, id1, MOD_SHIFT, 120);

id2:=GlobalAddAtom('hotkey2');
RegisterHotKey(handle, id2, MOD_SHIFT, 121);

id3:=GlobalAddAtom('hotkey3');
RegisterHotKey(handle, id3, MOD_SHIFT, 122);
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
UnRegisterHotKey(handle, id1);
UnRegisterHotKey(handle, id2);
UnRegisterHotKey(handle, id3);
end;

procedure TFormMain.ButtomStartStopClick(Sender: TObject);
begin
StartStopAdobeEncoder;
end;

end.
