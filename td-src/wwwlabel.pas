unit wwwlabel;

{----------------------------------------------------}
{ TWWWLabel component for D3 & D7                    }
{ (c)2003-2004,2006 MoNsTeR/GDC, Jakub Noniewicz     }
{ monster@gordon.webmedia.pl                         }
{ Version 1.0, last update: 2003.08.23               }
{ Version 1.1, last update: 2004.01.30               }
{ - added "" and escape function                     }
{ Version 1.2, last update: 2006.05.17               }
{ - fixed registry access rights (now readonly)      }
{ Version 1.3, last update: 2006.05.18               }
{ - fixed registry readonly to old code for D3       }
{----------------------------------------------------}
{                 LEGAL NOTICE:                      }
{ This software is provided 'as-is', without any     }
{ express or implied warranty. In no event will      }
{ the author be held liable for any damages arising  }
{ from the use of this software.                     }                                                   
{ Permission is granted to anyone to use this        }
{ software for any purpose, including commercial     }
{ applications, and to alter it and redistribute it  }
{ freely, subject to the following restrictions:     }                                     
{ 1. The origin of this software must not            }
{    be misrepresented, you must not claim that you  }
{    wrote the original software.                    }
{    If you use this software in a product,          }
{    an acknowledgment in the product documentation  }
{    would be appreciated but is not required.       }                                            
{ 2. Altered source versions must be plainly marked  }
{    as such, and must not be misrepresented as      }
{    being the original software.                    }                                                
{ 3. This notice may not be removed or altered from  }
{    any source distribution.                        }
{----------------------------------------------------}


interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls, SysUtils,
     dialogs,
     Registry;

type
  TWWWLabel = class(TCustomLabel)
  private
    { Private declarations }
    FURL: String;
    procedure ClickGoToWWW(Sender: TObject);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property URL: String read FURL write FURL;

    property Align;
    property Alignment;
    property AutoSize;
    property Caption;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FocusControl;
    property Font;
    property Height;
    property Hint;
    property Layout;
    property Left;
    property Name;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property Tag;
    property Top;
    property Transparent;
    property Visible;
    property Width;
    property WordWrap;

    property OnDblClick;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnStartDrag;
  end;


function MyExec(s: string): boolean;
procedure GoToWWW(URL: String);
function escape(s: string): string;


procedure Register;


implementation



procedure Register;
begin
  RegisterComponents('Monster', [TWWWLabel]);
end;


//exec app
function MyExec(s: string): boolean;
var ret: boolean;
begin
  if s <> '' then
  begin
    if WinExec(PChar(s), SW_SHOWNORMAL)<32 then
      ret:=false
    else
      ret:=true;
  end
  else
    ret:=false;
  Result := ret;
end; { MyExec }


function escape(s: string): string;
const hex='0123456789ABCDEF';
var i, h: integer;
begin
  Result := '';
  for i := 1 to length(s) do
  case s[i] of
    ' ': Result := Result + '+';
    '0'..'9',
    'A'..'Z',
    'a'..'z': Result := Result + s[i];
    else
    begin
      h := ord(s[i]);
      Result := Result + '%'+hex[1+(h shr 4)]+hex[1+(h and 15)];
    end;
  end;
end;

procedure GoToWWW(URL: String);
var www: String;
    key: TRegistry;
    stat: boolean;
begin
  key := TRegistry.create;
  www := '';
  try
    key.RootKey := HKEY_CLASSES_ROOT;

{$IFNDEF VER100} { Borland Delphi 3.0 }
    key.Access := KEY_READ;
{$ENDIF}

{$IFNDEF VER100} { Borland Delphi 3.0 }
    stat := key.OpenKeyReadOnly('\http\shell\open\command');
{$ELSE}
    stat := key.OpenKey('\http\shell\open\command', false);
{$ENDIF}

    if not stat then
    begin
      key.CloseKey;
      key.RootKey := HKEY_LOCAL_MACHINE;
{$IFNDEF VER100} { Borland Delphi 3.0 }
      stat := key.OpenKeyReadOnly('\SOFTWARE\Classes\HTTP\shell\open\command');
{$ELSE}
      stat := key.OpenKey('\SOFTWARE\Classes\HTTP\shell\open\command', false);
{$ENDIF}
    end;

    if stat and key.ValueExists('') then www := key.ReadString('');
  finally
    key.CloseKey;
  end;
  key.Free;

  if strpos(PChar(UpperCase(www)+#0),'"%1"') <> nil then
    Delete(www, pos('"%1"',www), length(www)-pos('"%1"',www)+1);

  if not(stat) or (www = '') or (URL = '') then {ignore}
  else
    MyExec(www+' "'+URL+'"');
end; { GoToWWW }


procedure TWWWLabel.ClickGoToWWW(Sender: TObject);
begin
  GoToWWW(FURL);
end; { ClickGoToWWW }

constructor TWWWLabel.Create(AOwner: TComponent);
begin
  inherited;
  FURL := '';
  Font.Style := Font.Style + [fsUnderline];
  Font.Color := clBlue;
  OnClick := ClickGoToWWW;
  cursor := crHandPoint;
end; { Create }

destructor TWWWLabel.Destroy;
begin
  inherited;
end; { Destroy }

end.
