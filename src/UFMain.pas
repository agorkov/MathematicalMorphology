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
    EImgW: TEdit;
    UDImgW: TUpDown;
    EImgH: TEdit;
    UDImgH: TUpDown;
    ImgOrigin: TImage;
    SPD: TSavePictureDialog;
    BSaveIIn: TButton;
    procedure UDClick(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure ImgOriginMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BSaveIInClick(Sender: TObject);
  private

  public
    procedure DrawIIn;
    procedure DrawMask;
    procedure DrawIOut;
    procedure DrawAll;
    procedure ResizeBI;
  end;

var
  FMain: TFMain;
  tmp: byte;

implementation

{$R *.dfm}

uses
  UBinaryImages, UGrayscaleImages, UFBigImage, Math, UBitMapFunctions;

var
  IIn: TCBinaryImage;

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
  w := min(ImgOrigin.Height div IIn.Height, ImgOrigin.Height div IIn.Width);
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

procedure TFMain.ImgOriginMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  w: word;
begin
  /// Выбираем размер пикселя
  w := min(ImgOrigin.Height div IIn.Height, ImgOrigin.Height div IIn.Width);
  /// Меняем значение соответствующего пиксела на противоположное
  IIn.Pixels[Y div w, X div w] := not IIn.Pixels[Y div w, X div w];
  /// Отрисовываем исходное изображение
  DrawIIn;
end;

procedure TFMain.DrawMask;
begin

end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  IIn := TCBinaryImage.Create;
  IIn.Height := 10;
  IIn.Width := 10;
  DrawAll;
end;

procedure TFMain.DrawIOut;
begin

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

procedure TFMain.DrawAll;
begin
  DrawIIn;
  DrawMask;
  DrawIOut;
end;

procedure TFMain.ResizeBI;
begin
  IIn.Height := UDImgH.Position;
  IIn.Width := UDImgW.Position;
  DrawAll;
end;

procedure TFMain.UDClick(Sender: TObject; Button: TUDBtnType);
begin
  ResizeBI;
end;

end.
