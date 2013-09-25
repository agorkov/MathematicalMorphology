program PMorph;

uses
  Forms,
  UFMain in 'UFMain.pas' {FMain},
  UDMMain in 'UDMMain.pas' {DMMain: TDataModule},
  ULoadImgAndBinarization in 'ULoadImgAndBinarization.pas' {FLoadImgAndBinarization},
  UBinarization in '..\..\ImgSharedUnits\src\UBinarization.pas',
  UImages in '..\..\ImgSharedUnits\src\UImages.pas',
  UMorphology in '..\..\ImgSharedUnits\src\UMorphology.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TFLoadImgAndBinarization, FLoadImgAndBinarization);
  Application.Run;
end.
