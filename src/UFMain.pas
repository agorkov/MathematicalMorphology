unit UFMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, Vcl.ExtDlgs;

type
  TFMain = class(TForm)
    GPImgSettings: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EImgW: TEdit;
    UDImgW: TUpDown;
    EImgH: TEdit;
    UDImgH: TUpDown;
    BSelectImg: TButton;
    BSaveImg: TButton;
    ImgOrigin: TImage;
    GBImgLog: TGroupBox;
    BNot: TButton;
    BAnd: TButton;
    BOR: TButton;
    BXOR: TButton;
    BSaveImage: TButton;
    GBMaskSettings: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    EMaskH: TEdit;
    UDMaskH: TUpDown;
    UDMaskW: TUpDown;
    EMaskW: TEdit;
    EMaskCX: TEdit;
    UDMaskCX: TUpDown;
    EMaskCY: TEdit;
    UDMaskCY: TUpDown;
    BSelectMask: TButton;
    BSaveMask: TButton;
    ImgMask: TImage;
    Скелетизация: TButton;
    GPOperations: TGroupBox;
    BDilation: TButton;
    BErosion: TButton;
    BOpening: TButton;
    BClosing: TButton;
    ImgResult: TImage;
    GBOtherMorphOperation: TGroupBox;
    BHitorMiss: TButton;
    BComditional_dilation: TButton;
    BBorder: TButton;
    BCarcass: TButton;
    BSaveResult: TButton;
    BLoadImage: TButton;
    procedure BSelectImgClick(Sender: TObject);
    procedure BSelectMaskClick(Sender: TObject);
    procedure BDilationClick(Sender: TObject);
    procedure BErosionClick(Sender: TObject);
    procedure BClosingClick(Sender: TObject);
    procedure BOpeningClick(Sender: TObject);
    procedure BComditional_dilationClick(Sender: TObject);
    procedure ImgOriginMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure EImgWChange(Sender: TObject);
    procedure EImgHChange(Sender: TObject);
    procedure ImgMaskMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure EMaskWChange(Sender: TObject);
    procedure EMaskHChange(Sender: TObject);
    procedure EMaskCXChange(Sender: TObject);
    procedure EMaskCYChange(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
    procedure BSaveImgClick(Sender: TObject);
    procedure BSaveMaskClick(Sender: TObject);
    procedure BNotClick(Sender: TObject);
    procedure BXORClick(Sender: TObject);
    procedure BORClick(Sender: TObject);
    procedure BHitorMissClick(Sender: TObject);
    procedure BAndClick(Sender: TObject);
    procedure BSaveImageClick(Sender: TObject);
    procedure BSaveResultClick(Sender: TObject);
    procedure BBorderClick(Sender: TObject);
    procedure BCarcassClick(Sender: TObject);
    procedure СкелетизацияClick(Sender: TObject);
    procedure ImgResultClick(Sender: TObject);
    procedure BLoadImageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;
  tmp: byte;

implementation

{$R *.dfm}

uses
  UDMMain, UMorphology, UBinarization, jpeg, ULoadImgAndBinarization, UBinaryImages, UGrayscaleImages, UFBigImage;

var
  Img, ImgR: TBinaryImage;
  Mask: TBinaryStructElem;
  GSImg: TGreyscaleImage;

procedure DrawImg;
var
  i, j: word;
  wn, wm, w: word;
begin
  if (Img.N > 30) or (Img.M > 30) then
  begin
    FMain.ImgOrigin.Picture.Assign(SaveBinaryImgToBitMap(Img));
    exit;
  end;
  FMain.ImgOrigin.Picture.Bitmap.Height := FMain.ImgOrigin.Height;
  FMain.ImgOrigin.Picture.Bitmap.Width := FMain.ImgOrigin.Width;
  FMain.ImgOrigin.Canvas.Pen.Color := clGray;
  FMain.ImgOrigin.Canvas.Brush.Color := clGray;
  FMain.ImgOrigin.Canvas.Rectangle(0, 0, FMain.ImgOrigin.Height, FMain.ImgOrigin.Width);

  wn := FMain.ImgOrigin.Height div Img.N;
  wm := FMain.ImgOrigin.Height div Img.M;
  if wn > wm then
    w := wm
  else
    w := wn;

  for i := 1 to Img.N do
    for j := 1 to Img.M do
    begin
      if Img.i[i, j] then
        FMain.ImgOrigin.Canvas.Brush.Color := clBlack
      else
        FMain.ImgOrigin.Canvas.Brush.Color := clWhite;
      FMain.ImgOrigin.Canvas.Rectangle((j - 1) * w, (i - 1) * w, j * w, i * w);
    end;
end;

procedure DrawMask;
var
  i, j: word;
  wn, wm, w: word;
begin
  FMain.ImgMask.Canvas.Pen.Color := clGray;
  FMain.ImgMask.Canvas.Brush.Color := clGray;
  FMain.ImgMask.Canvas.Rectangle(0, 0, FMain.ImgMask.Height, FMain.ImgMask.Width);

  wn := FMain.ImgMask.Height div Mask.Mask.N;
  wm := FMain.ImgMask.Height div Mask.Mask.M;
  if wn > wm then
    w := wm
  else
    w := wn;

  for i := 1 to Mask.Mask.N do
    for j := 1 to Mask.Mask.M do
    begin
      if Mask.Mask.i[i, j] then
        FMain.ImgMask.Canvas.Brush.Color := clBlack
      else
        FMain.ImgMask.Canvas.Brush.Color := clWhite;
      FMain.ImgMask.Canvas.Rectangle((j - 1) * w, (i - 1) * w, j * w, i * w);
    end;
end;

procedure DrawImgR;
var
  i, j: word;
  wn, wm, w: word;
begin
  if (ImgR.N > 30) or (ImgR.M > 30) then
  begin
    FMain.ImgResult.Picture.Assign(SaveBinaryImgToBitMap(ImgR));
    exit;
  end;
  FMain.ImgResult.Picture.Bitmap.Height := FMain.ImgResult.Height;
  FMain.ImgResult.Picture.Bitmap.Width := FMain.ImgResult.Width;
  FMain.ImgResult.Canvas.Pen.Color := clGray;
  FMain.ImgResult.Canvas.Brush.Color := clGray;
  FMain.ImgResult.Canvas.Rectangle(0, 0, FMain.ImgResult.Height, FMain.ImgResult.Width);

  wn := FMain.ImgResult.Height div Img.N;
  wm := FMain.ImgResult.Height div Img.M;
  if wn > wm then
    w := wm
  else
    w := wn;

  for i := 1 to Img.N do
    for j := 1 to Img.M do
    begin
      if ImgR.i[i, j] then
        FMain.ImgResult.Canvas.Brush.Color := clBlack
      else
        FMain.ImgResult.Canvas.Brush.Color := clWhite;
      FMain.ImgResult.Canvas.Rectangle((j - 1) * w, (i - 1) * w, j * w, i * w);
    end;
end;

procedure ImgSettingsChange;
begin
  InitBinaryImg(Img, FMain.UDImgH.Position, FMain.UDImgW.Position);
  InitBinaryImg(ImgR, FMain.UDImgH.Position, FMain.UDImgW.Position);
  DrawImg;
  DrawImgR;
end;

procedure MaskSettingsChange;
begin
  Mask.Mask.N := FMain.UDMaskH.Position;
  Mask.Mask.M := FMain.UDMaskW.Position;
  InitBinaryImg(Mask.Mask, Mask.Mask.N, Mask.Mask.M);
  DrawMask;
  FMain.UDMaskCX.Max := Mask.Mask.M;
  FMain.UDMaskCY.Max := Mask.Mask.N;
  FMain.UDMaskCX.Position := 1;
  FMain.UDMaskCY.Position := 1;
end;

procedure TFMain.BSelectImgClick(Sender: TObject);
var
  f: TextFile;
  i, j: word;
  value: word;
begin
  if UDMMain.DMMain.OD1.Execute then
  begin
    AssignFile(f, UDMMain.DMMain.OD1.FileName);
    reset(f);
    begin
      read(f, Img.N);
      FMain.EImgH.Text := inttostr(Img.N);
      read(f, Img.M);
      FMain.EImgW.Text := inttostr(Img.M);

      InitBinaryImg(Img, Img.N, Img.M);
      InitBinaryImg(ImgR, Img.N, Img.M);

      for i := 1 to Img.N do
        for j := 1 to Img.M do
        begin
          read(f, value);
          Img.i[i, j] := Boolean(value);
        end;
    end;
    CloseFile(f);

    DrawImg;
  end;
end;

procedure TFMain.BSelectMaskClick(Sender: TObject);
var
  f: TextFile;
  i, j: word;
  value: word;
begin
  if UDMMain.DMMain.OD1.Execute then
  begin
    AssignFile(f, UDMMain.DMMain.OD1.FileName);
    reset(f);
    begin
      read(f, Mask.Mask.N);
      FMain.EMaskH.Text := inttostr(Mask.Mask.N);
      read(f, Mask.Mask.M);
      FMain.EMaskW.Text := inttostr(Mask.Mask.M);

      InitBinaryImg(Mask.Mask, Mask.Mask.N, Mask.Mask.M);

      for i := 1 to Mask.Mask.N do
        for j := 1 to Mask.Mask.M do
        begin
          read(f, value);
          Mask.Mask.i[i, j] := Boolean(value);
        end;
      read(f, Mask.Cy);
      FMain.EMaskCY.Text := inttostr(Mask.Cy);
      read(f, Mask.Cx);
      FMain.EMaskCX.Text := inttostr(Mask.Cx);
    end;
    CloseFile(f);

    DrawMask;
  end;
end;

procedure TFMain.BNotClick(Sender: TObject);
begin
  ImgR := ImgNOT(Img);
  DrawImgR;
end;

procedure TFMain.BXORClick(Sender: TObject);
begin
  ImgR := ImgXOR(Img, ImgR);
  DrawImgR;
end;

procedure TFMain.BORClick(Sender: TObject);
begin
  ImgR := ImgOR(Img, ImgR);
  DrawImgR;
end;

procedure TFMain.СкелетизацияClick(Sender: TObject);
var
  i, j: word;
begin
  for i := 1 to Img.N do
  begin
    Img.i[i, 1] := false;
    Img.i[i, Img.M] := false;
  end;
  for j := 1 to Img.M do
  begin
    Img.i[1, j] := false;
    Img.i[Img.N, j] := false;
  end;
  ImgR := Skeleton(Img);
  DrawImgR;
end;

procedure TFMain.BHitorMissClick(Sender: TObject);
begin
  ImgR := HitOrMiss(Img, Mask.Mask);
  DrawImg;
  DrawImgR;
end;

procedure TFMain.BSaveImgClick(Sender: TObject);
var
  f: TextFile;
  i, j: word;
begin
  if UDMMain.DMMain.SD1.Execute then
  begin
    AssignFile(f, UDMMain.DMMain.SD1.FileName);
    rewrite(f);
    writeln(f, Img.N);
    writeln(f, Img.M);
    for i := 1 to Img.N do
    begin
      for j := 1 to Img.M do
        write(f, byte(Img.i[i, j]), ' ');
      writeln(f);
    end;
    CloseFile(f);
  end;
end;

procedure TFMain.BSaveMaskClick(Sender: TObject);
var
  f: TextFile;
  i, j: word;
begin
  if UDMMain.DMMain.SD1.Execute then
  begin
    AssignFile(f, UDMMain.DMMain.SD1.FileName);
    rewrite(f);
    writeln(f, Mask.Mask.N);
    writeln(f, Mask.Mask.M);
    for i := 1 to Mask.Mask.N do
    begin
      for j := 1 to Mask.Mask.M do
        write(f, byte(Mask.Mask.i[i, j]), ' ');
      writeln(f);
    end;
    writeln(f, Mask.Cy);
    writeln(f, Mask.Cx);
    CloseFile(f);
  end;
end;

procedure TFMain.BSaveImageClick(Sender: TObject);
begin
  ImgOrigin.Picture.SaveToFile('ORIGIN.bmp');
end;

procedure TFMain.BSaveResultClick(Sender: TObject);
begin
  ImgResult.Picture.SaveToFile('RESULT.bmp');
end;

procedure TFMain.BDilationClick(Sender: TObject);
begin
  ImgR := dilation(Img, Mask);
  DrawImgR;
end;

procedure TFMain.BErosionClick(Sender: TObject);
begin
  ImgR := erosion(Img, Mask);
  DrawImgR;
end;

procedure TFMain.BLoadImageClick(Sender: TObject);
begin
  ULoadImgAndBinarization.FLoadImgAndBinarization.ShowModal;
  if (ULoadImgAndBinarization.BI.N > 0) and (ULoadImgAndBinarization.BI.M > 0) then
  begin
    EImgH.Text := inttostr(ULoadImgAndBinarization.BI.N);
    EImgW.Text := inttostr(ULoadImgAndBinarization.BI.M);
    Img := ImgOR(ULoadImgAndBinarization.BI, ULoadImgAndBinarization.BI);
    DrawImg;
  end;
end;

procedure TFMain.BAndClick(Sender: TObject);
begin
  ImgR := ImgAND(Img, ImgR);
  DrawImgR;
end;

procedure TFMain.BBorderClick(Sender: TObject);
begin
  ImgR := Borders(Img, Mask);
  DrawImgR;
end;

procedure TFMain.BCarcassClick(Sender: TObject);
begin
  ImgR := MorphologyCarcass(Img, Mask);
  DrawImgR;
end;

procedure TFMain.BClosingClick(Sender: TObject);
begin
  ImgR := closing(Img, Mask);
  DrawImgR;
end;

procedure TFMain.BOpeningClick(Sender: TObject);
begin
  ImgR := opening(Img, Mask);
  DrawImgR;
end;

procedure TFMain.BComditional_dilationClick(Sender: TObject);
begin
  ImgR := conditional_dilatation(ImgR, Img, Mask);
  DrawImgR;
end;

procedure TFMain.EImgHChange(Sender: TObject);
begin
  ImgSettingsChange;
end;

procedure TFMain.EImgWChange(Sender: TObject);
begin
  ImgSettingsChange;
end;

procedure TFMain.EMaskCXChange(Sender: TObject);
begin
  Mask.Cx := UDMaskCX.Position;
  Mask.Cy := UDMaskCY.Position;
end;

procedure TFMain.EMaskCYChange(Sender: TObject);
begin
  Mask.Cx := UDMaskCX.Position;
  Mask.Cy := UDMaskCY.Position;
end;

procedure TFMain.EMaskHChange(Sender: TObject);
begin
  MaskSettingsChange;
end;

procedure TFMain.EMaskWChange(Sender: TObject);
begin
  MaskSettingsChange;
end;

procedure TFMain.FormActivate(Sender: TObject);
begin
  ImgSettingsChange;
  MaskSettingsChange;
  Mask.Cx := UDMaskCX.Position;
  Mask.Cy := UDMaskCY.Position;
  DrawImgR;
end;

procedure TFMain.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

procedure TFMain.ImgOriginMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  wn, wm, w, i, j: word;
begin
  if ssCtrl in Shift then
  begin
    UFBigImage.FBigImage.Image1.Picture.Bitmap.Assign(ImgOrigin.Picture.Bitmap);
    UFBigImage.FBigImage.ShowModal;
  end
  else
    if (Img.N <= 30) and (Img.M <= 30) then
    begin
      if (FMain.ImgOrigin.Canvas.Pixels[X, Y] = clBlack) or (FMain.ImgOrigin.Canvas.Pixels[X, Y] = clWhite) then
      begin
        wn := FMain.ImgOrigin.Height div Img.N;
        wm := FMain.ImgOrigin.Height div Img.M;
        if wn > wm then
          w := wm
        else
          w := wn;
        i := (Y div w) + 1;
        j := (X div w) + 1;
        Img.i[i, j] := not Img.i[i, j];
        DrawImg;
      end;
    end;
end;

procedure TFMain.ImgMaskMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  wn, wm, w, i, j: word;
begin
  w := 0;
  i := 0;
  j := 0;
  if (FMain.ImgMask.Canvas.Pixels[X, Y] = clBlack) or (FMain.ImgMask.Canvas.Pixels[X, Y] = clWhite) then
  begin
    wn := FMain.ImgMask.Height div Mask.Mask.N;
    wm := FMain.ImgMask.Height div Mask.Mask.M;
    if wn > wm then
      w := wm
    else
      w := wn;
    i := (Y div w) + 1;
    j := (X div w) + 1;
    Mask.Mask.i[i, j] := not Mask.Mask.i[i, j];
    DrawMask;
  end;
  if Button = mbRight then
  begin
    EMaskCY.Text := inttostr((Y div w) + 1);
    EMaskCX.Text := inttostr((X div w) + 1);
    Mask.Mask.i[i, j] := not Mask.Mask.i[i, j];
    DrawMask;
  end;
end;

procedure TFMain.ImgResultClick(Sender: TObject);
begin
  Img := ImgOR(ImgR, ImgR);
  DrawImg;
end;

end.
