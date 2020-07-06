unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, Windows, SynEdit;

type

  { TForm1 }

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  Memo2.Lines.Add('');
  Memo2.Lines.Add(Edit2.Text);
  Memo2.Lines.Add('Сейчас играет: ' + ComboBox1.Text);
  Memo2.Lines.Add(memo1.Lines.Text);
  Memo2.Lines.Add(Edit3.Text);
  Memo2.Lines.SaveToFile(OpenDialog1.FileName);
  Memo2.SelStart := Length(Memo2.Text);
  memo1.Clear;
  memo1.SetFocus;
end;

procedure TForm1.ToolButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if OpenDialog1.FileName <> '' then
  ToolButton2.Hint := 'Добавить новую запись в файл "' + OpenDialog1.FileName + '"'
  else
  ToolButton2.Hint := 'Файл дневника пока не открыт. Некуда записывать';
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
  with TTaskDialog.Create(Self) do
    begin
      try
        Caption := 'О программе';
        Title := 'Dear Diary by Modenov';
        Text := 'Версия: 1.0' + #13 + #10 + 'Компиляция: 05.07.2020 г.' +
                 #13 + #10 + #13 + #10 + 'Сайт: Modenov.ru' + #13 + #10 +
                 #13 + #10 + 'Автор: Владимир Моденов. Все права защищены.';
        MainIcon := tdiInformation;
        CommonButtons := [tcbOk];
        Execute;
      finally
        Free;
      end;
    end;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ToolButton6Click(Sender: TObject);
begin
  application.Minimize;
  ShellExecute(Handle, nil, 'https://modenov.ru/', nil, nil, SW_SHOW);
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
  Memo2.Clear;
  Memo2.Lines.LoadFromFile(OpenDialog1.FileName);
  form1.Caption := 'Dear Diary by Modenov — [Сейчас открыт ' + OpenDialog1.FileName + ']';
  edit1.Text := OpenDialog1.FileName;
  ToolButton2.Enabled := true;
  Memo2.SelStart := Length(Memo2.Text);
  memo1.SetFocus;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  edit3.Text := FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  edit2.Text := FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

end.

