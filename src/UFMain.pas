unit UFMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Vcl.ExtDlgs;

type
  TFMain = class(TForm)
    GBIIn: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EIinW: TEdit;
    UDIInW: TUpDown;
    EIInH: TEdit;
    UDIInH: TUpDown;
    ImgIn: TImage;
    SPD: TSavePictureDialog;
    BSaveIIn: TButton;
    ImgMask: TImage;
    GPIMask: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EMaskW: TEdit;
    UDMaskW: TUpDown;
    EMaskH: TEdit;
    UDMaskH: TUpDown;
    BSaveMask: TButton;
    LMaskX: TLabel;
    LMaskY: TLabel;
    ImgOut: TImage;
    PCMorphology: TPageControl;
    TSMain: TTabSheet;
    BDilatation: TButton;
    BErosion: TButton;
    BClosing: TButton;
    BOpening: TButton;
    procedure UDIInClick(
      Sender: TObject;
      Button: TUDBtnType);
    procedure UDMaskClick(
      Sender: TObject;
      Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure ImgInMouseDown(
      Sender: TObject;
      Button: TMouseButton;
      Shift: TShiftState;
      X, Y: Integer);
    procedure BSaveIInClick(Sender: TObject);
    procedure ImgMaskMouseDown(
      Sender: TObject;
      Button: TMouseButton;
      Shift: TShiftState;
      X, Y: Integer);
    procedure BSaveMaskClick(Sender: TObject);
    procedure BDilatationClick(Sender: TObject);
    procedure BErosionClick(Sender: TObject);
    procedure BClosingClick(Sender: TObject);
    procedure BOpeningClick(Sender: TObject);
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

implementation

{$R *.dfm}

uses
  UBinaryImages, UGrayscaleImages, UFBigImage, Math, UBitMapFunctions;

var
  IIn, IMask, IOut: TCBinaryImage;
  MaskRow, MaskCol: word;

procedure TFMain.DrawIIn;
var
  i, j: word;
  w: word;
begin
  /// Очищаем изображение
  ImgIn.Picture.Bitmap.Height := ImgIn.Height;
  ImgIn.Picture.Bitmap.Width := ImgIn.Width;
  ImgIn.Canvas.Pen.Color := clGray;
  ImgIn.Canvas.Brush.Color := clGray;
  ImgIn.Canvas.Rectangle(
    0,
    0,
    ImgIn.Height - 1,
    ImgIn.Width - 1);
  /// Выбираем размер пикселя
  w := min(
    ImgIn.Height div IIn.Height,
    ImgIn.Width div IIn.Width);
  /// Отрисовываем изображение
  for i := 1 to IIn.Height do
    for j := 1 to IIn.Width do
    begin
      if IIn.Pixels[i - 1, j - 1] then
        ImgIn.Canvas.Brush.Color := clBlack
      else
        ImgIn.Canvas.Brush.Color := clWhite;
      ImgIn.Canvas.Rectangle(
        (j - 1) * w,
        (i - 1) * w,
        j * w,
        i * w);
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
  ImgMask.Canvas.Rectangle(
    0,
    0,
    ImgMask.Height - 1,
    ImgMask.Width - 1);
  /// Выбираем размер пикселя
  w := min(
    ImgMask.Height div IMask.Height,
    ImgMask.Width div IMask.Width);
  /// Отрисовываем маску
  for i := 1 to IMask.Height do
    for j := 1 to IMask.Width do
    begin
      if IMask.Pixels[i - 1, j - 1] then
        ImgMask.Canvas.Brush.Color := clBlack
      else
        ImgMask.Canvas.Brush.Color := clWhite;
      ImgMask.Canvas.Rectangle(
        (j - 1) * w,
        (i - 1) * w,
        j * w,
        i * w);
    end;
  LMaskX.Caption := 'СтрЦ = ' + inttostr(MaskRow);
  LMaskY.Caption := 'СтЦ = ' + inttostr(MaskCol);
end;

procedure TFMain.DrawIOut;
var
  i, j: word;
  w: word;
begin
  /// Очищаем изображение
  ImgOut.Picture.Bitmap.Height := ImgOut.Height;
  ImgOut.Picture.Bitmap.Width := ImgOut.Width;
  ImgOut.Canvas.Pen.Color := clGray;
  ImgOut.Canvas.Brush.Color := clGray;
  ImgOut.Canvas.Rectangle(
    0,
    0,
    ImgOut.Height - 1,
    ImgOut.Width - 1);
  /// Выбираем размер пикселя
  w := min(
    ImgOut.Height div IOut.Height,
    ImgOut.Width div IOut.Width);
  /// Отрисовываем изображение
  for i := 1 to IOut.Height do
    for j := 1 to IOut.Width do
    begin
      if IOut.Pixels[i - 1, j - 1] then
        ImgOut.Canvas.Brush.Color := clBlack
      else
        ImgOut.Canvas.Brush.Color := clWhite;
      ImgOut.Canvas.Rectangle(
        (j - 1) * w,
        (i - 1) * w,
        j * w,
        i * w);
    end;
end;

procedure TFMain.BSaveMaskClick(Sender: TObject);
var
  FileName: string;
  BM: TBitMap;
begin
  if SPD.Execute then
  begin
    FileName := SPD.FileName;
    if UpperCase(ExtractFileExt(FileName)) <> '.PNG' then
      FileName := FileName + '.PNG';
    BM := IMask.SaveToBitMap;
    UBitMapFunctions.SaveToFile(
      BM,
      FileName);
    BM.Free;
  end;
end;

procedure TFMain.DrawAll;
begin
  DrawIIn;
  DrawMask;
  DrawIOut;
end;

procedure TFMain.ImgMaskMouseDown(
  Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState;
  X, Y: Integer);
var
  w: word;
begin
  /// Выбираем размер пикселя
  w := min(
    ImgMask.Height div IMask.Height,
    ImgMask.Width div IMask.Width);
  /// Левой кнопкой создаём макску
  if Button = mbLeft then
  begin
    /// Меняем значение соответствующего пиксела на противоположное
    IMask.Pixels[Y div w, X div w] := not IMask.Pixels[Y div w, X div w];
  end;
  /// Правой кнопкой выбираем центр маски
  if Button = mbRight then
  begin
    MaskRow := (Y div w) + 1;
    MaskCol := (X div w) + 1;
  end;
  /// Отрисовываем маску
  DrawMask;
end;

procedure TFMain.ImgInMouseDown(
  Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState;
  X, Y: Integer);
var
  w: word;
begin
  /// Выбираем размер пикселя
  w := min(
    ImgIn.Height div IIn.Height,
    ImgIn.Width div IIn.Width);
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

  IMask := TCBinaryImage.Create;
  IMask.Height := 3;
  IMask.Width := 3;
  for i := 0 to IMask.Height - 1 do
    for j := 0 to IMask.Width - 1 do
      IMask.Pixels[i, j] := true;
  MaskRow := 2;
  MaskCol := 2;

  IOut := TCBinaryImage.Create;
  IOut.Height := IIn.Height;
  IOut.Width := IIn.Width;

  DrawAll;
end;

procedure TFMain.BClosingClick(Sender: TObject);
begin
  IOut.FreeBinaryImage;
  IOut := TCBinaryImage.CreateCopy(IIn);
  IOut.closing(
    IMask,
    MaskRow - 1,
    MaskCol - 1);
  DrawIOut;
end;

procedure TFMain.BDilatationClick(Sender: TObject);
begin
  IOut.FreeBinaryImage;
  IOut := TCBinaryImage.CreateCopy(IIn);
  IOut.dilatation(
    IMask,
    MaskRow - 1,
    MaskCol - 1);
  DrawIOut;
end;

procedure TFMain.BErosionClick(Sender: TObject);
begin
  IOut.FreeBinaryImage;
  IOut := TCBinaryImage.CreateCopy(IIn);
  IOut.erosion(
    IMask,
    MaskRow - 1,
    MaskCol - 1);
  DrawIOut;
end;

procedure TFMain.BOpeningClick(Sender: TObject);
begin
  IOut.FreeBinaryImage;
  IOut := TCBinaryImage.CreateCopy(IIn);
  IOut.opening(
    IMask,
    MaskRow - 1,
    MaskCol - 1);
  DrawIOut;
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
    UBitMapFunctions.SaveToFile(
      BM,
      FileName);
    BM.Free;
  end;
end;

procedure TFMain.ResizeBI;
begin
  IIn.Height := UDIInH.Position;
  IIn.Width := UDIInW.Position;
  IOut.Height := IIn.Height;
  IOut.Width := IIn.Width;
  DrawIIn;
  DrawIOut;
end;

procedure TFMain.ResizeMask;
begin
  IMask.Height := UDMaskH.Position;
  IMask.Width := UDMaskW.Position;
  MaskRow := (IMask.Height div 2) + 1;
  MaskCol := (IMask.Width div 2) + 1;
  DrawAll;
end;

procedure TFMain.UDIInClick(
  Sender: TObject;
  Button: TUDBtnType);
begin
  ResizeBI;
end;

procedure TFMain.UDMaskClick(
  Sender: TObject;
  Button: TUDBtnType);
begin
  ResizeMask;
end;

end.
