unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UParallelogramme, ComCtrls, StdCtrls, Math, ShellAPI;

type
  TMainForm = class(TForm)
    ImgPanel: TPanel;
    Img: TImage;
    RotationTimer: TTimer;
    ButtonPanel: TPanel;
    SpeedLbl: TLabel;
    SpeedBar: TTrackBar;
    MinLbl: TLabel;
    MaxLbl: TLabel;
    MiddleLbl: TLabel;
    SepBevel: TBevel;
    ChooseBitmapLbl: TLabel;
    BitmapList: TComboBox;
    SepBevel2: TBevel;
    PauseBtn: TButton;
    QuitBtn: TButton;
    HyperlinkLbl: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RotationTimerTimer(Sender: TObject);
    procedure SpeedBarChange(Sender: TObject);
    procedure BitmapListChange(Sender: TObject);
    procedure PauseBtnClick(Sender: TObject);
    procedure QuitBtnClick(Sender: TObject);
    procedure HyperlinkLblClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure ChangeBitmap;
    procedure ShowRectangle;
  end;

var
  MainForm: TMainForm;
  Rect: TParallelogramme;
  Angle: Integer;
  Bitmap: TBitmap;
  Speed: Integer;

implementation

{$R *.dfm}

procedure TMainForm.ChangeBitmap;
Var
 Points: array [0..3] of TPoint;
begin
 RotationTimer.Enabled := False;

 Angle := 0;
 Bitmap := TBitmap.Create;
 Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Images\' + BitmapList.Text + '.bmp');

 Points[0].X := (Img.ClientWidth div 2) - (Bitmap.Width div 2);
 Points[0].Y := (Img.ClientHeight div 2) - (Bitmap.Height div 2);
 Points[1].X := Points[0].X + Bitmap.Width;
 Points[1].Y := Points[0].Y;
 Points[2].X := Points[1].X;
 Points[2].Y := Points[1].Y + Bitmap.Height;
 Points[3].X := Points[0].X;
 Points[3].Y := Points[0].Y + Bitmap.Height;

 if Assigned(Rect) then Rect.Free;
 Rect := TParallelogramme.Create(Points);

 Img.Picture := nil;
 RotationTimer.Enabled := True;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 InitSCA;
 Speed := 3;
 DoubleBuffered := True;
 ImgPanel.DoubleBuffered := True;
 ButtonPanel.DoubleBuffered := True;
 ChangeBitmap;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Bitmap.Free;
 Rect.Free;
end;

function Clamp(Value: Integer): Integer;
begin
 if Value > 359 then Value := 0;
 Result := Value;
end;

procedure TMainForm.RotationTimerTimer(Sender: TObject);
begin
 Inc(Angle, Speed);
 Clamp(Angle);
 Rect.Rotate(Speed);
 ShowRectangle;
end;

procedure TMainForm.ShowRectangle;
Var
 Pts: array [0..2] of TPoint;
begin
 Pts[0] := Rect.Points[1];
 Pts[1] := Rect.Points[2];
 Pts[2] := Rect.Points[0];

 with Img.Canvas, Rect do
  begin
   FillRect(Img.ClientRect);
   PlgBlt(Handle, Pts, Bitmap.Canvas.Handle, 0, 0, Bitmap.Width, Bitmap.Height, 0, 0, 0);
  end;
end;

procedure TMainForm.SpeedBarChange(Sender: TObject);
begin
 Speed := SpeedBar.Position;
end;

procedure TMainForm.BitmapListChange(Sender: TObject);
begin
 ChangeBitmap;
end;

procedure TMainForm.PauseBtnClick(Sender: TObject);
begin
 RotationTimer.Enabled := not RotationTimer.Enabled;
 case RotationTimer.Enabled of
  False: PauseBtn.Caption := 'Reprendre';
  True: PauseBtn.Caption := 'Pause';
 end;
end;

procedure TMainForm.QuitBtnClick(Sender: TObject);
begin
 Close;
end;

procedure TMainForm.HyperlinkLblClick(Sender: TObject);
begin
 ShellExecute(Handle, 'open', 'http://www.delphifr.com', nil, nil, SW_SHOWNORMAL);
end;

end.
