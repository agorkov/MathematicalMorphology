unit UDMMain;

interface

uses
  SysUtils, Classes, Dialogs;

type
  TDMMain = class(TDataModule)
    OD1: TOpenDialog;
    SD1: TSaveDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMain: TDMMain;

implementation

{$R *.dfm}

end.
