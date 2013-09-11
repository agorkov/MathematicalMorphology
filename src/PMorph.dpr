program PMorph;

uses
  Forms,
  UFMain in 'UFMain.pas' {FMain},
  UDMMain in 'UDMMain.pas' {DMMain: TDataModule},
  UMorphology in 'UMorphology.pas',
  UBinarization in 'UBinarization.pas',
  UImages in 'UImages.pas',
  ULoadImgAndBinarization in 'ULoadImgAndBinarization.pas' {FLoadImgAndBinarization};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TFLoadImgAndBinarization, FLoadImgAndBinarization);
  Application.Run;
end.
