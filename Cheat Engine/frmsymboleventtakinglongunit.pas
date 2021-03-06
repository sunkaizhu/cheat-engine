unit frmSymbolEventTakingLongUnit;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, syncobjs;

type

  { TfrmSymbolEventTakingLong }

  TfrmSymbolEventTakingLong = class(TForm)
    Button1: TButton;
    cbSkipThisSymbol: TCheckBox;
    cbSkipAllSymbols: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    lblType: TLabel;
    lblSymbol: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    formcanclose: boolean;
    done: Tevent;
  end;

implementation

{ TfrmSymbolEventTakingLong }

procedure TfrmSymbolEventTakingLong.FormCloseQuery(Sender: TObject;
  var CanClose: boolean);
begin
  CanClose:=formcanclose;
end;

procedure TfrmSymbolEventTakingLong.Button1Click(Sender: TObject);
begin
  formcanclose:=true;
  modalresult:=mrCancel;
end;

procedure TfrmSymbolEventTakingLong.Timer1Timer(Sender: TObject);
begin
  if done.WaitFor(1)<>wrTimeout then
  begin
    formcanclose:=true;
    modalresult:=mrOK;
  end;
end;

initialization
  {$I frmsymboleventtakinglongunit.lrs}

end.

