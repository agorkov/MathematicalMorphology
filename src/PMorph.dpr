program PMorph;

uses
  Forms,
  UFMain in 'UFMain.pas' {FMain},
  UDMMain in 'UDMMain.pas' {DMMain: TDataModule},
  ULoadImgAndBinarization in 'ULoadImgAndBinarization.pas' {FLoadImgAndBinarization},
  UBinarization in 'D:\ImgSharedUnits\src\UBinarization.pas',
  UBinaryImages in 'D:\ImgSharedUnits\src\UBinaryImages.pas',
  UFilter in 'D:\ImgSharedUnits\src\UFilter.pas',
  UGrayscaleImages in 'D:\ImgSharedUnits\src\UGrayscaleImages.pas',
  UImages in 'D:\ImgSharedUnits\src\UImages.pas',
  UMorphology in 'D:\ImgSharedUnits\src\UMorphology.pas',
  UPixelConvert in 'D:\ImgSharedUnits\src\UPixelConvert.pas',
  URGBImages in 'D:\ImgSharedUnits\src\URGBImages.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TFLoadImgAndBinarization, FLoadImgAndBinarization);
  Application.Run;
end.
