unit FTMAinUnit;

//Font Test v1.0.2.6 FREEWARE
//(C)2005-2009, 2013, 2022 MoNsTeR/GDC, Jakub Noniewicz, monster@Noniewicz.com
//stared: 20051108 0000-0120
//stared: 20051108 1455-1510
//update: 20051115 0930-0950
//update: 20060326 2200-2235
//update: 20070228 2130-2210 (1.0.0.3)
//update: 20081231 1800-1900 (1.0.1.4)
//update: 20090101 1635-1900 (1.0.1.4)
//update: 20090101 2010-2105 (1.0.1.4)
//update: 20130310 1720-1725 (1.0.1.4)
//update: 20130310 1725-1740 (1.0.1.4)
//update: 20130310 1815-2020 (1.0.2.5)
//update: 20130311 0055-0130 (1.0.2.5)
//update: 20220626 2045-2115 (1.0.2.6)

{note:
- RxRichEdit popup issue
    http://www.delphipages.com/forum/showthread.php?t=48258
}

{todo:
# NEXT:
- refactor to Lazarus?
- (LAZ) mainMenu - showhint
- (LAZ) PL lang + more
# LATER:
- popup menu items to main menu
- icons in popups
- char map - show char code
- char map - bigger font
- jak sie ma zapisana/wczytana lista fontow do listy enum??
}

{change log:
# v1.0.2.6:
- minor/cosmetic hages
# v1.0.2.5:
- D3 to BDS
- date to 2013
- XP manifest
- about
- rich popup fix
- added actnmgr / imglist / shortcuts
- added menu
- added toolbar
- donation
- ask exit
- resize charmap issue
- minor fixes
# v1.0.1.4:
- check/uncheck/invert for selection
- font list - save/load (list+states)
- list of fonts on the right side displayed using each individual font?
- btns - glyph only w/ hint
- splitter memo <-> tree
- font list - allow delete items (multi)
# v1.0.0.3:
- save (was unfinished somehow)
- char map + with given font
- clear option
}


interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, Graphics,
  ExtCtrls, StdCtrls, ComCtrls, Buttons, Menus, Grids,
  {new} ImgList, ActnList, ToolWin, XPMan,
  {my} wwwlabel,
  {my} CharMap,
  {tree} TreeNT,
  {rx} RXSpin, RxRichEd, RXSplit 
  {#END#};

type
  TFTMainForm = class(TForm)
    GB1: TGroupBox;
    EditTxt: TEdit;
    RadioGroup1: TRadioGroup;
    cbNames: TCheckBox;
    PopupMenu1: TPopupMenu;
    Selectall1: TMenuItem;
    Selectnone1: TMenuItem;
    Inverselection1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Selectall2: TMenuItem;
    GB2: TGroupBox;
    Label1: TLabel;
    cbB: TCheckBox;
    cbI: TCheckBox;
    cbU: TCheckBox;
    N1: TMenuItem;
    refreshFONTlist1: TMenuItem;
    cbS: TCheckBox;
    N2: TMenuItem;
    Show1: TMenuItem;
    Saveas1: TMenuItem;
    Label3: TLabel;
    PopupMenu3: TPopupMenu;
    DEFAULTCHARSET1: TMenuItem;
    MACCHARSET1: TMenuItem;
    GREEKCHARSET1: TMenuItem;
    TURKISHCHARSET1: TMenuItem;
    HEBREWCHARSET1: TMenuItem;
    BALTICCHARSET1: TMenuItem;
    RUSSIANCHARSET1: TMenuItem;
    EASTEUROPECHARSET1: TMenuItem;
    PanelMap: TPanel;
    SaveDialog1: TSaveDialog;
    BitBtn1: TBitBtn;
    N3: TMenuItem;
    Useincharactermap1: TMenuItem;
    Clear1: TMenuItem;
    N4: TMenuItem;
    Load1: TMenuItem;
    Save1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog2: TSaveDialog;
    N5: TMenuItem;
    Deletefromlist1: TMenuItem;
    Checkselected1: TMenuItem;
    N6: TMenuItem;
    Uncheckselected1: TMenuItem;
    Invertselected1: TMenuItem;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    ImageList1: TImageList;
    AcExit: TAction;
    AcOpen: TAction;
    AcSave: TAction;
    AcShow: TAction;
    Exit1: TMenuItem;
    Font1: TMenuItem;
    AcChMap: TAction;
    AcRefresh: TAction;
    XPManifest1: TXPManifest;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Loadfontlist1: TMenuItem;
    Savefontlist1: TMenuItem;
    AcRefresh1: TMenuItem;
    AcShow1: TMenuItem;
    ToolButton6: TToolButton;
    Help1: TMenuItem;
    AcAbout: TAction;
    About1: TMenuItem;
    ToolButton7: TToolButton;
    AcWWW: TAction;
    Nonieiwczcom1: TMenuItem;
    N8: TMenuItem;
    Charactermap1: TMenuItem;
    AcSaveRTF: TAction;
    AcDonatePLN: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Result1: TMenuItem;
    SaveasRTF1: TMenuItem;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    AcDonateUSD: TAction;
    N7: TMenuItem;
    N9: TMenuItem;
    AcDonateUSD1: TMenuItem;
    AcDonatePLN1: TMenuItem;
    AcUseIn: TAction;
    CBUseFnt: TCheckBox;
    Label2: TLabel;
    LFree: TLabel;
    Label4: TLabel;
    AcResSelAll: TAction;
    AcResSelCopy: TAction;
    AcResClear: TAction;
    Selectall3: TMenuItem;
    Copy2: TMenuItem;
    Clear2: TMenuItem;
    N10: TMenuItem;
    Copy1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Selectall1Click(Sender: TObject);
    procedure Selectnone1Click(Sender: TObject);
    procedure Inverselection1Click(Sender: TObject);
    procedure DEFAULTCHARSET1Click(Sender: TObject);
    procedure MACCHARSET1Click(Sender: TObject);
    procedure GREEKCHARSET1Click(Sender: TObject);
    procedure TURKISHCHARSET1Click(Sender: TObject);
    procedure HEBREWCHARSET1Click(Sender: TObject);
    procedure BALTICCHARSET1Click(Sender: TObject);
    procedure RUSSIANCHARSET1Click(Sender: TObject);
    procedure EASTEUROPECHARSET1Click(Sender: TObject);
    procedure CharMap1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxSpinEditCHChange(Sender: TObject);
    procedure CBUseFntClick(Sender: TObject);
    procedure Deletefromlist1Click(Sender: TObject);
    procedure Checkselected1Click(Sender: TObject);
    procedure Uncheckselected1Click(Sender: TObject);
    procedure Invertselected1Click(Sender: TObject);
    procedure AcExitExecute(Sender: TObject);
    procedure AcOpenExecute(Sender: TObject);
    procedure AcSaveExecute(Sender: TObject);
    procedure AcRefreshExecute(Sender: TObject);
    procedure AcChMapExecute(Sender: TObject);
    procedure AcAboutExecute(Sender: TObject);
    procedure AcWWWExecute(Sender: TObject);
    procedure AcShowExecute(Sender: TObject);
    procedure AcSaveRTFExecute(Sender: TObject);
    procedure AcDonatePLNExecute(Sender: TObject);
    procedure AcDonateUSDExecute(Sender: TObject);
    procedure AcUseInExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcResClearExecute(Sender: TObject);
    procedure AcResSelAllExecute(Sender: TObject);
    procedure AcResSelCopyExecute(Sender: TObject);
  private
    TreeNT1: TTreeNT;
    WWWLabel1: TWWWLabel;
    CharMap1: TCharMap;
    RxSplitter1: TRxSplitter;
    RxSpinEditFS: TRxSpinEdit;
    RxSpinEditCH: TRxSpinEdit;
    RxSpinEditF: TRxSpinEdit;
    RxSpinEditT: TRxSpinEdit;
    RxRichEdit1: TRxRichEdit;
    procedure MyMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  public
    procedure GetFontList;
    procedure List2TS;
    procedure Fonts2List(FileName: string; reload: boolean);
    procedure GroupSet(mode: integer; forall: boolean);
    procedure DoShow;
  end;

var
  FTMainForm: TFTMainForm;

implementation

{$R *.DFM}



var TS: TStringList;


{$IFDEF WIN32}
function EnumFontsProc(var EnumLogFont: TEnumLogFont;
  var TextMetric: TNewTextMetric; FontType: Integer; Data: LPARAM): Integer;
  export; stdcall;
var
  FaceName: string;
begin
  FaceName := StrPas(EnumLogFont.elfLogFont.lfFaceName);
  TS.Add(FaceName);
  Result := 1;
end;
{$ELSE}
function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; export;
begin
  TS.Add(StrPas(LogFont.lfFaceName));
  Result := 1;
end;
{$ENDIF WIN32}

procedure Donate(lc, cu: string);
var url: string;
begin
  url := 'https://www.paypal.com/cgi-bin/webscr?';
  url := url + 'cmd=_donations';
  url := url + '&business=jakub@noniewicz.com';
  url := url + '&no_shipping=0';
  url := url + '&no_note=1';
  url := url + '&currency_code='+cu;
  url := url + '&tax=0';
  if lc <> '' then url := url + '&lc='+lc;

  GotoWWW(url);
end;

procedure TFTMainForm.MyMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var tmp: TPoint;
begin
  GetCursorPos(tmp);
  if button = mbRight then PopupMenu2.Popup(tmp.x, tmp.y);
end;

procedure TFTMainForm.DoShow;
var i: integer;
    f, s: string;
begin
  Application.ProcessMessages;
  RxRichEdit1.Lines.Clear;
  RxRichEdit1.Visible := false;
  Application.ProcessMessages;

  Screen.Cursor := crHourGlass;

  case RadioGroup1.ItemIndex of
    0: begin
         s := '';
         for i := RxSpinEditF.AsInteger to RxSpinEditT.AsInteger do
           s := s + chr(i);
       end;
    1: s := EditTxt.Text;
  end;

  for i := 0 to TreeNT1.Items.Count-1 do
  if TreeNT1.Items[i].CheckState = csChecked then
  begin
    f := TreeNT1.Items[i].Text;
    RxRichEdit1.SelAttributes.Size := RxSpinEditFS.asInteger;
    RxRichEdit1.SelAttributes.Name := f;
    RxRichEdit1.SelAttributes.Style := [];
    if cbB.Checked then
      RxRichEdit1.SelAttributes.Style := RxRichEdit1.SelAttributes.Style + [fsBold];
    if cbI.Checked then
      RxRichEdit1.SelAttributes.Style := RxRichEdit1.SelAttributes.Style + [fsItalic];
    if cbU.Checked then
      RxRichEdit1.SelAttributes.Style := RxRichEdit1.SelAttributes.Style + [fsUnderline];
    if cbS.Checked then
      RxRichEdit1.SelAttributes.Style := RxRichEdit1.SelAttributes.Style + [fsStrikeout];

    RxRichEdit1.SelAttributes.Charset := RxSpinEditCH.AsInteger;

    if cbNames.Checked then
      RxRichEdit1.Lines.Add(f+': '+s)
    else
      RxRichEdit1.Lines.Add(s);
  end;

  RxRichEdit1.Visible := true;
  Screen.Cursor := crDefault;
end;

procedure RxSpin(var v: TRxSpinEdit; p: TWinControl; R: TRect; tab: integer; vmin, vmax, vval: single; WChange: TNotifyEvent);
begin
  v := TRxSpinEdit.Create(p);
  v.Parent := p;
  v.Left := R.Left;
  v.Top := R.Top;
  v.Width := R.Right;
  v.Height := R.Bottom;
  v.MinValue := vmin;
  v.MaxValue := vmax;
  v.Value := vval;
  v.TabOrder := tab;
  v.OnChange := WChange;
  v.Ctl3D := false;
end;

procedure TFTMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var res: integer;
begin
  res := MessageDlg('Close application?', mtConfirmation, [mbYes, mbNo], 0);
  if res <> mrYes then
    action := caNone
  else begin end;
end;

procedure TFTMainForm.FormCreate(Sender: TObject);
begin
  TS := TStringList.Create;

  RxSpin(RxSpinEditF,   GB1, RECT(80,32,49,21),  2, 0.0, 255.0,  32.0, nil);
  RxSpin(RxSpinEditT,   GB1, RECT(136,32,49,21), 3, 0.0, 255.0, 127.0, nil);
  RxSpin(RxSpinEditFS,  GB2, RECT(64,12,57,21),  0, 1.0, 200.0,  28.0, nil);
  RxSpin(RxSpinEditCH,  GB2, RECT(64,56,57,21),  5, 0.0, 255.0,   1.0, RxSpinEditCHChange);
  RxSpinEditFS.Alignment := taRightJustify;

  RxSpinEditF.Name := 'RxSpinEditF';
  RxSpinEditT.Name := 'RxSpinEditT';
  RxSpinEditFS.Name := 'RxSpinEditFS';
  RxSpinEditCH.Name := 'RxSpinEditCH';

  RxSpinEditF.MaxLength := 3;
  RxSpinEditT.MaxLength := 3;
  RxSpinEditFS.MaxLength := 3;
  RxSpinEditCH.MaxLength := 3;
  
  TreeNT1 := TTreeNT.Create(self);
  TreeNT1.Parent := self;
  TreeNT1.Left := 582;
  TreeNT1.Top := 225;
  TreeNT1.Width := 180;
  TreeNT1.Height := 340;
  TreeNT1.Hint := 'Fonts';
  TreeNT1.Align := alRight;
  TreeNT1.Font.Charset := DEFAULT_CHARSET;
  TreeNT1.Font.Color := clWindowText;
  TreeNT1.Font.Height := -16;
  TreeNT1.Font.Name := 'MS Sans Serif';
  TreeNT1.Font.Style := [];
  TreeNT1.Indent := 22;
  TreeNT1.InsertMarkColor := -16777216;
  TreeNT1.ItemHeight := 16;
  TreeNT1.Options := [toAutoExpand, toCheckSupport, toEvenHeight, toHideSelection, toMultiSelect, toReadOnly, toRightClickSelect];
  TreeNT1.ParentColor := False;
  TreeNT1.PopupMenu := PopupMenu1;
  TreeNT1.ShowHint := True;
  TreeNT1.ScrollTime := 0;
  TreeNT1.TabOrder := 3;

  RxRichEdit1 := TRxRichEdit.Create(self);
  RxRichEdit1.Parent := self;
  RxRichEdit1.Left := 0;
  RxRichEdit1.Top := 225;
  RxRichEdit1.Align := alClient;
  RxRichEdit1.PlainText := false; //for sure
  RxRichEdit1.TabOrder := 1;
  RxRichEdit1.WordWrap := False;
//PROBLEM
//  RxRichEdit1.PopupMenu := PopupMenu2;
//FIX
  RxRichEdit1.OnMouseDown := MyMouseDown;

  RxSplitter1 := TRxSplitter.Create(self);
  RxSplitter1.Parent := self;
  RxSplitter1.Left := 579;
  RxSplitter1.Top := 225;
  RxSplitter1.Width := 6; //was 3
  RxSplitter1.Height := 340;
  RxSplitter1.ControlFirst := TreeNT1;
  RxSplitter1.ControlSecond := RxRichEdit1;
  RxSplitter1.Align := alRight;
  RxSplitter1.Color := clSkyBlue;
  RxSplitter1.Cursor := crHSplit;

  CharMap1 := TCharMap.Create(PanelMap);
  CharMap1.Parent := PanelMap;
  CharMap1.Left := 0;
  CharMap1.Top := 0;
  CharMap1.Hint := 'Double click to add characters to text';
  CharMap1.Align := alClient;
  CharMap1.ShowHint := True;
  CharMap1.TabOrder := 0;
  CharMap1.OnDblClick := CharMap1DblClick;

  WWWLabel1 := TWWWLabel.Create(GB1);
  WWWLabel1.Parent := GB1;
  WWWLabel1.Left := 608;
  WWWLabel1.Top := 32;
  WWWLabel1.Width := 138;
  WWWLabel1.Height := 13;
  WWWLabel1.Cursor := crHandPoint;
  WWWLabel1.URL := 'http://noniewicz.com';
  WWWLabel1.Alignment := taRightJustify;
  WWWLabel1.Caption := '(c)2005-2022 Noniewicz.com';
  WWWLabel1.Font.Charset := DEFAULT_CHARSET;
  WWWLabel1.Font.Color := clBlue;
  WWWLabel1.Font.Name := 'MS Sans Serif';
  WWWLabel1.Font.Style := [fsUnderline];
  WWWLabel1.Anchors := [akTop, akRight];
end;

procedure TFTMainForm.FormDestroy(Sender: TObject);
begin
  TS.Free;
end;

procedure TFTMainForm.GetFontList;
var DC: HDC;
{$IFNDEF WIN32}
    Proc: TFarProc;
{$ENDIF}
    i: integer;
begin
  TS.Clear;
  if not HandleAllocated then Exit;

  DC := GetDC(0);
{$IFDEF WIN32}
  try
    EnumFonts(DC, nil, @EnumFontsProc , PChar(Self));
  except
  end;
{$ELSE}
   Proc := MakeProcInstance(@EnumFontsProc, HInstance);
   try
     EnumFonts(DC, nil, Proc, PChar(Self));
   finally
     FreeProcInstance(Proc);
   end;
{$ENDIF}
  ReleaseDC(0, DC);

  for i := 0 to TS.Count - 1 do TS[i] := TS[i] + '=1';
  TS.Sort;
end;

procedure TFTMainForm.List2TS;
var i: integer;
    s: string;
begin
  TS.Clear;

  for i := 0 to TreeNT1.Items.Count-1 do
  begin
    s := TreeNT1.Items[i].Text;
    if TreeNT1.Items[i].CheckState = csChecked then s := s + '=1' else s := s + '=0';
    TS.Add(s);
  end;
end;

procedure TFTMainForm.Fonts2List(FileName: string; reload: boolean);
var i: integer;
    ti: TTreeNTNode;
    fn, fv: string;
begin
  Screen.Cursor := crHourGlass;

  TreeNT1.Items.Clear;
  TreeNT1.Items.TopLevelCheckType := ctCheckBox;

  if CBUseFnt.Checked then
  begin
    TreeNT1.Font.Size := 12;
    TreeNT1.Font.Name := 'MS Sans Serif';
    TreeNT1.ItemHeight := 22;
  end
  else
  begin
    TreeNT1.Font.Size := 8;
    TreeNT1.Font.Name := 'MS Sans Serif';
    TreeNT1.ItemHeight := 16;
  end;

  if reload then
  begin
    if FileName = '' then
      GetFontList
    else
    try
      TS.LoadFromFile(FileName);
    except
      on E: Exception do
      begin
        Showmessage('Error: '+E.Message);
      end;
    end;
  end;

  for i := 0 to TS.Count-1 do
  begin
    fn := TS.Names[i];
    fv := TS[i];
    delete(fv, 1, pos('=', fv));

    TreeNT1.Items.Add(nil, fn);
    ti := TreeNT1.Items[i];
    if CBUseFnt.Checked then
    begin
      ti.Font.Name := fn;
      ti.Font.Size := 12;
    end
    else
    begin
      ti.Font.Name := 'MS Sans Serif';
      ti.Font.Size := 8;
    end;
    ti.CheckType := ctCheckBox;
    if fv = '0' then
      ti.CheckState := csUnChecked
    else
      ti.CheckState := csChecked;
  end;

  Screen.Cursor := crDefault;
end;

procedure TFTMainForm.FormShow(Sender: TObject);
begin
  AcRefresh.Execute;
end;

procedure TFTMainForm.GroupSet(mode: integer; forall: boolean);
var c, i: integer;
    ti: TTreeNTNode;
begin
  c := TreeNT1.Items.Count-1;
  if forall then
  begin
    case mode of
      0: for i := 0 to c do TreeNT1.Items[i].CheckState := csChecked;
      1: for i := 0 to c do TreeNT1.Items[i].CheckState := csUnChecked;
      2: for i := 0 to c do
         begin
           if TreeNT1.Items[i].CheckState = csUnChecked then
             TreeNT1.Items[i].CheckState := csChecked
           else
             TreeNT1.Items[i].CheckState := csUnChecked;
         end;
    end;
  end
  else
  begin
    case mode of
      0: for i := 0 to c do
         begin
           ti := TreeNT1.Items[i];
           if ti.Selected then ti.CheckState := csChecked; 
         end;
      1: for i := 0 to c do
         begin
           ti := TreeNT1.Items[i];
           if ti.Selected then ti.CheckState := csUnChecked;
         end;
      2: for i := 0 to c do
         begin
           ti := TreeNT1.Items[i];
           if ti.Selected then
           begin
             if ti.CheckState = csUnChecked then
               ti.CheckState := csChecked
             else
               ti.CheckState := csUnChecked;
           end;
         end;
    end;
  end;

end;

procedure TFTMainForm.Selectall1Click(Sender: TObject);
begin
  GroupSet(0, true);
end;

procedure TFTMainForm.Selectnone1Click(Sender: TObject);
begin
  GroupSet(1, true);
end;

procedure TFTMainForm.Inverselection1Click(Sender: TObject);
begin
  GroupSet(2, true);
end;

procedure TFTMainForm.DEFAULTCHARSET1Click(Sender: TObject);
begin
//ANSI_CHARSET	0	ANSI characters.
//SYMBOL_CHARSET	2	Standard symbol set.
//OEM_CHARSET	255	?

  RxSpinEditCH.AsInteger := DEFAULT_CHARSET;
end;

procedure TFTMainForm.MACCHARSET1Click(Sender: TObject);
begin
  RxSpinEditCH.AsInteger := MAC_CHARSET;
end;

procedure TFTMainForm.GREEKCHARSET1Click(Sender: TObject);
begin
  RxSpinEditCH.AsInteger := GREEK_CHARSET;
end;

procedure TFTMainForm.TURKISHCHARSET1Click(Sender: TObject);
begin
  RxSpinEditCH.AsInteger := TURKISH_CHARSET;
end;

procedure TFTMainForm.HEBREWCHARSET1Click(Sender: TObject);
begin
  RxSpinEditCH.AsInteger := HEBREW_CHARSET;
end;

procedure TFTMainForm.AcAboutExecute(Sender: TObject);
begin
  showmessage(
    'FONT TEST v1.0.2.6'#13#10+
    '(c) 2005-2022 Noniewicz.com'#13#10+
    'FREEWARE'#13#10#13#10+
    'Visit http://noniewicz.com for more'#13#10#13#10+
    'Also please consider PayPal donation ;)'
  );
end;

procedure TFTMainForm.AcChMapExecute(Sender: TObject);
begin
  PanelMap.Visible := not PanelMap.Visible;
end;

procedure TFTMainForm.AcDonatePLNExecute(Sender: TObject);
begin
  Donate('PL', 'PLN');
end;

procedure TFTMainForm.AcDonateUSDExecute(Sender: TObject);
begin
  Donate('US', 'USD');
end;

procedure TFTMainForm.AcExitExecute(Sender: TObject);
begin
  close;
end;

procedure TFTMainForm.AcOpenExecute(Sender: TObject);
begin
  Application.ProcessMessages;
  if OpenDialog1.Execute then
    Fonts2List(OpenDialog1.FileName, true);
end;

procedure TFTMainForm.AcRefreshExecute(Sender: TObject);
begin
  Application.ProcessMessages;
  Fonts2List('', true);
end;

procedure TFTMainForm.AcResClearExecute(Sender: TObject);
begin
  RxRichEdit1.Lines.Clear;
end;

procedure TFTMainForm.AcResSelAllExecute(Sender: TObject);
begin
  try RxRichEdit1.SetFocus; except end;
  RxRichEdit1.SelectAll;
end;

procedure TFTMainForm.AcResSelCopyExecute(Sender: TObject);
begin
  RxRichEdit1.CopyToClipboard;
end;

procedure TFTMainForm.AcSaveExecute(Sender: TObject);
begin
  Application.ProcessMessages;
  if SaveDialog2.Execute then
  try
    List2TS;
    TS.SaveToFile(SaveDialog2.FileName);
  except
    on E: Exception do
      Showmessage('Error while saving: '+E.Message);
  end;
end;

procedure TFTMainForm.AcSaveRTFExecute(Sender: TObject);
begin
  if SaveDialog1.Execute then
  try
    RxRichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
  except
    on E: Exception do
      Showmessage('Error while saving RTF: '+E.Message);
  end;
end;

procedure TFTMainForm.AcShowExecute(Sender: TObject);
begin
  DoShow;
end;

procedure TFTMainForm.AcUseInExecute(Sender: TObject);
var f: string;
begin
  if TreeNT1.Selected <> nil then
  begin
    f := TreeNT1.Selected.Text;
    CharMap1.Font.Name := f;
    CharMap1.Font.Style := [];
    CharMap1.Font.Charset := RxSpinEditCH.AsInteger;
  end;
end;

procedure TFTMainForm.AcWWWExecute(Sender: TObject);
begin
  GotoWWW('http://noniewicz.com');
end;

procedure TFTMainForm.BALTICCHARSET1Click(Sender: TObject);
begin
  RxSpinEditCH.AsInteger := BALTIC_CHARSET;
end;

procedure TFTMainForm.RUSSIANCHARSET1Click(Sender: TObject);
begin
  RxSpinEditCH.AsInteger := RUSSIAN_CHARSET;
end;

procedure TFTMainForm.EASTEUROPECHARSET1Click(Sender: TObject);
begin
  RxSpinEditCH.AsInteger := EASTEUROPE_CHARSET;
end;

procedure TFTMainForm.CharMap1DblClick(Sender: TObject);
begin
  EditTxt.Text := EditTxt.Text + CharMap1.SelectedChar;
end;

procedure TFTMainForm.BitBtn1Click(Sender: TObject);
begin
  PopupMenu3.Popup(self.left+GB2.left+RxSpinEditCH.Left, self.top+GB2.top+RxSpinEditCH.Top+RxSpinEditCH.Height);
end;

procedure TFTMainForm.RxSpinEditCHChange(Sender: TObject);
begin
  CharMap1.Font.Charset := RxSpinEditCH.AsInteger;
end;

procedure TFTMainForm.CBUseFntClick(Sender: TObject);
begin
  Fonts2List('', false);
end;

procedure TFTMainForm.Deletefromlist1Click(Sender: TObject);
begin
  if TreeNT1.Items.SelectedCount > 0 then TreeNT1.Items.DeleteSelectedNodes;
end;

procedure TFTMainForm.Checkselected1Click(Sender: TObject);
begin
  GroupSet(0, false);
end;

procedure TFTMainForm.Uncheckselected1Click(Sender: TObject);
begin
  GroupSet(1, false);
end;

procedure TFTMainForm.Invertselected1Click(Sender: TObject);
begin
  GroupSet(2, false);
end;

end.

