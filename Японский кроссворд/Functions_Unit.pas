unit Functions_Unit;

 interface
   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Types, ExtCtrls;

//----------------------------------------------------------------------------\\
//----------------------------------------------------------------------------\\
  const
    Connections : array[0..3] of String = (
                                           {0} 'Нет',
                                           {1} 'Только до',
                                           {2} 'Только после',
                                           {3} 'Только одновременно'
                                          );

    sekunda = 1/24/60/60; //~ 0.000012 .
    
//----------------------------------------------------------------------------\\
//----------------------------------------------------------------------------\\
   type
   TTaskCell = record
     X,
     Y       : Integer;
     Chekced : Boolean;
     Value   : Integer;
     Cell    : TPanel;
   end;

   TResultCell = record
     X,
     Y,
     Chekced : Integer;
     ParentX : Integer;
     ParentY : Integer;
     Cell    : TPanel;
   end;

   TTaskField = record
     X,
     Y         : Integer;
     TaskField : array of array of TTaskCell;
   end;

   TResultField = record
     X,
     Y           : Integer;
     ResultField : array of array of TResultCell;
   end;


   TSubjectString = String[50];

     function S(Subject: TSubjectString; jj : String = '' ): String;

 implementation

//---------------------------------------------------------------------------------------------------------------------------------------------------------------\\

     function S(Subject: TSubjectString; jj : String = '' ): String;
begin
 Result := Subject + jj;
end;

{
 procedure TForm1.Button1Click(Sender: TObject);
var
  DataField: TStrings;
begin
  DataField := TStringList.Create;
  DataField.Add(Format('%s=%s', ['Jonas', '15.03.1980']));
  ShowMessage(DataField.Values['Jonas'])
  // will print the Birthday of Jonas
  DataField.Free;
end;
 }
end.
