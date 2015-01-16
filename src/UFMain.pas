unit UFMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Vcl.ExtDlgs;

type
  TFMain = class(TForm)
    GPImgSettings: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EIinW: TEdit;
    UDIInW: TUpDown;
    EIInH: TEdit;
    UDIInH: TUpDown;
    ImgOrigin: TImage;
    SPD: TSavePictureDialog;
    BSaveIIn: TButton;
    ImgMask: TImage;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EMaskW: TEdit;
    UDMaskW: TUpDown;
    EMaskH: TEdit;
    UDMaskH: TUpDown;
    Button1: TButton;
    procedure UDIInClick(Sender: TObject; Button: TUDBtnType);
    procedure UDMaskClick(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure ImgOriginMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BSaveIInClick(Sender: TObject);
    procedure ImgMaskMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
  private

  public
    procedure DrawIIn;
    procedure DrawMask;
    procedure DrawIOut;
    procedure DrawAll;
    procedure ResizeBI;
    procedure ResizeMask;
  end;

var
  FMain: TFMain;
  tmp: byte;

implementation

{$R *.dfm}

uses
  UBinaryImages, UGrayscaleImages, UFBigImage, Math, UBitMapFunctions;

var
  IIn, Mask: TCBinaryImage;

procedure TFMain.DrawIIn;
var
  i, j: word;
  w: word;
begin
  /// Очищаем изображение
  ImgOrigin.Picture.Bitmap.Height := ImgOrigin.Height;
  ImgOrigin.Picture.Bitmap.Width := ImgOrigin.Width;
  ImgOrigin.Canvas.Pen.Color := clGray;
  ImgOrigin.Canvas.Brush.Color := clGray;
  ImgOrigin.Canvas.Rectangle(0, 0, ImgOrigin.Height - 1, ImgOrigin.Width - 1);
  /// Выбираем размер пикселя
  w := min(ImgOrigin.Height div IIn.Height, ImgOrigin.Width div IIn.Width);
  /// Отрисовываем изображение
  for i := 1 to IIn.Height do
    for j := 1 to IIn.Width do
    begin
      if IIn.Pixels[i - 1, j - 1] then
        ImgOrigin.Canvas.Brush.Color := clBlack
      else
        ImgOrigin.Canvas.Brush.Color := clWhite;
      ImgOrigin.Canvas.Rectangle((j - 1) * w, (i - 1) * w, j * w, i * w);
    end;
end;

procedure TFMain.DrawMask;
var
  i, j: word;
  w: word;
begin
  /// Очищаем изображение
  ImgMask.Picture.Bitmap.Height := ImgMask.Height;
  ImgMask.Picture.Bitmap.Width := ImgMask.Width;
  ImgMask.Canvas.Pen.Color := clGray;
  ImgMask.Canvas.Brush.Color := clGray;
  ImgMask.Canvas.Rectangle(0, 0, ImgMask.Height - 1, ImgMask.Width - 1);
  /// Выбираем размер пикселя
  w := min(ImgMask.Height div Mask.Height, ImgMask.Width div Mask.Width);
  /// Отрисовываем изображение
  for i := 1 to Mask.Height do
    for j := 1 to Mask.Width do
    begin
      if Mask.Pixels[i - 1, j - 1] then
        ImgMask.Canvas.Brush.Color := clBlack
      else
        ImgMask.Canvas.Brush.Color := clWhite;
      ImgMask.Canvas.Rectangle((j - 1) * w, (i - 1) * w, j * w, i * w);
    end;
end;

procedure TFMain.DrawIOut;
begin

end;

procedure TFMain.Button1Click(Sender: TObject);
var
  FileName: string;
  BM: TBitMap;
begin
  if SPD.Execute then
  begin
    FileName := SPD.FileName;
    if UpperCase(ExtractFileExt(FileName)) <> '.PNG' then
      FileName := FileName + '.PNG';
    BM := Mask.SaveToBitMap;
    UBitMapFunctions.SaveToFile(BM, FileName);
    BM.Free;
  end;
end;

procedure TFMain.DrawAll;
begin
  DrawIIn;
  DrawMask;
  DrawIOut;
end;

procedure TFMain.ImgMaskMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  w: word;
begin
  /// Выбираем размер пикселя
  w := min(ImgMask.Height div Mask.Height, ImgMask.Width div Mask.Width);
  /// Меняем значение соответствующего пиксела на противоположное
  Mask.Pixels[Y div w, X div w] := not Mask.Pixels[Y div w, X div w];
  /// Отрисовываем исходное изображение
  DrawMask;
end;

procedure TFMain.ImgOriginMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  w: word;
begin
  /// Выбираем размер пикселя
  w := min(ImgOrigin.Height div IIn.Height, ImgOrigin.Width div IIn.Width);
  /// Меняем значение соответствующего пиксела на противоположное
  IIn.Pixels[Y div w, X div w] := not IIn.Pixels[Y div w, X div w];
  /// Отрисовываем исходное изображение
  DrawIIn;
end;

procedure TFMain.FormCreate(Sender: TObject);
var
  i, j: word;
begin
  IIn := TCBinaryImage.Create;
  IIn.Height := 10;
  IIn.Width := 10;
  Mask := TCBinaryImage.Create;
  Mask.Height := 3;
  Mask.Width := 3;
  for i := 0 to Mask.Height - 1 do
    for j := 0 to Mask.Width - 1 do
      Mask.Pixels[i, j] := true;
  DrawAll;
end;

procedure TFMain.BSaveIInClick(Sender: TObject);
var
  FileName: string;
  BM: TBitMap;
begin
  if SPD.Execute then
  begin
    FileName := SPD.FileName;
    if UpperCase(ExtractFileExt(FileName)) <> '.PNG' then
      FileName := FileName + '.PNG';
    BM := IIn.SaveToBitMap;
    UBitMapFunctions.SaveToFile(BM, FileName);
    BM.Free;
  end;
end;

procedure TFMain.ResizeBI;
begin
  IIn.Height := UDIInH.Position;
  IIn.Width := UDIInW.Position;
  DrawAll;
end;

procedure TFMain.ResizeMask;
begin
  Mask.Height := UDMaskH.Position;
  Mask.Width := UDMaskW.Position;
  DrawAll;
end;

procedure TFMain.UDIInClick(Sender: TObject; Button: TUDBtnType);
begin
  ResizeBI;
end;

procedure TFMain.UDMaskClick(Sender: TObject; Button: TUDBtnType);
begin
  ResizeMask;
end;

end.
