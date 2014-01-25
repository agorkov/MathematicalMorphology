unit ULoadImgAndBinarization;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ExtDlgs, Vcl.ComCtrls, UBinaryImages;

type
  TFLoadImgAndBinarization = class(TForm)
    IIn: TImage;
    IOut: TImage;
    BClose: TButton;
    OPD: TOpenPictureDialog;
    GBThresold: TGroupBox;
    LEThresold: TLabeledEdit;
    BThresoldBinarization: TButton;
    UpDown1: TUpDown;
    procedure FormActivate(Sender: TObject);
    procedure IInDblClick(Sender: TObject);
    procedure BThresoldBinarizationClick(Sender: TObject);
    procedure BCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLoadImgAndBinarization: TFLoadImgAndBinarization;
  BI: TBinaryImage;

implementation

{$R *.dfm}

uses
  UBinarization, UGrayscaleImages, URGBImages, JPEG;

var
  GSI: TGreyscaleImage;

procedure TFLoadImgAndBinarization.BCloseClick(Sender: TObject);
begin
  BI := ThresoldBinarization(GSI, strtoint(LEThresold.Text));
  FLoadImgAndBinarization.Close;
end;

procedure TFLoadImgAndBinarization.BThresoldBinarizationClick(Sender: TObject);
var
  BM: TBitMap;
begin
  BM := SaveBinaryImgToBitMap(ThresoldBinarization(GSI, strtoint(LEThresold.Text)));
  IOut.Picture.Assign(BM);
  BM.Free;
end;

procedure TFLoadImgAndBinarization.FormActivate(Sender: TObject);
begin
  IIn.Picture.Bitmap.Height := IIn.Height;
  IIn.Picture.Bitmap.Width := IIn.Width;
  IOut.Picture.Bitmap.Height := IOut.Height;
  IOut.Picture.Bitmap.Width := IOut.Width;
  IIn.Canvas.Rectangle(0, 0, IIn.Width, IIn.Height);
  IOut.Canvas.Rectangle(0, 0, IOut.Width, IOut.Height);
  InitBinaryImg(BI, 0, 0);
end;

procedure JPEGtoBMP(const FileName: TFileName);
var
  JPEG: TJPEGImage;
  bmp: TBitMap;
begin
  JPEG := TJPEGImage.Create;
  try
    JPEG.CompressionQuality := 100;
    JPEG.LoadFromFile(FileName);
    bmp := TBitMap.Create;
    try
      bmp.Assign(JPEG);
      bmp.SaveTofile(ChangeFileExt(FileName, '.bmp'));
    finally
      bmp.Free
    end;
  finally
    JPEG.Free
  end;
end;

procedure TFLoadImgAndBinarization.IInDblClick(Sender: TObject);
  procedure TColorToRGB(Color: TColor; var r, g, b: byte);
  begin
    r := Color;
    g := Color shr 8;
    b := Color shr 16;
  end;

var
  BM: TBitMap;
  i, j: word;
  r, g, b: byte;
  RGBI: TRGBImage;
begin
  if OPD.Execute then
  begin
    BM := TBitMap.Create;
    if (pos('.JPG', AnsiUpperCase(OPD.FileName)) <> 0) or (pos('.JPEG', AnsiUpperCase(OPD.FileName)) <> 0) then
    begin
      JPEGtoBMP(OPD.FileName);
      BM.LoadFromFile(ChangeFileExt(OPD.FileName, '.bmp'));
      DeleteFile(ChangeFileExt(OPD.FileName, '.bmp'));
    end
    else
      BM.LoadFromFile(OPD.FileName);
    BM.Canvas.Brush.Style := bsClear;
    BM.Canvas.Pen.Color := clWhite;
    BM.Canvas.Pen.Width := 10;
    BM.Canvas.Rectangle(1, 1, BM.Width, BM.Height);
    for i := 0 to BM.Height - 1 do
      for j := 0 to BM.Width - 1 do
      begin
        TColorToRGB(BM.Canvas.Pixels[j, i], r, g, b);
        BM.Canvas.Pixels[j, i] := RGB(round(0.299 * r + 0.587 * g + 0.114 * b), round(0.299 * r + 0.587 * g + 0.114 * b), round(0.299 * r + 0.587 * g + 0.114 * b));
      end;
    IIn.Picture.Assign(BM);
    RGBI:=LoadRGBIFromBitMap(BM);
    GSI := ConvertRGBIToGSI(RGBI);
    BM.Free;
  end;
end;

end.
