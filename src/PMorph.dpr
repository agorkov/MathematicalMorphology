program PMorph;

uses
  Forms,
  UFMain in 'UFMain.pas' {FMain},
  UFBigImage in 'UFBigImage.pas' {FBigImage},
  UBinaryImages in '..\..\ImgSharedUnits\src\UBinaryImages.pas',
  UBitMapFunctions in '..\..\ImgSharedUnits\src\UBitMapFunctions.pas',
  UColorImages in '..\..\ImgSharedUnits\src\UColorImages.pas',
  UGrayscaleImages in '..\..\ImgSharedUnits\src\UGrayscaleImages.pas',
  UPixelConvert in '..\..\ImgSharedUnits\src\UPixelConvert.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFBigImage, FBigImage);
  Application.Run;
end.
