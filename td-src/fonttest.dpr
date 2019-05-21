program fonttest;

uses
  Forms,
  TreeNT in 'treent\TreeNT.pas',  
  FTMAinUnit in 'FTMAinUnit.pas' {FTMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFTMainForm, FTMainForm);
  Application.Run;
end.
