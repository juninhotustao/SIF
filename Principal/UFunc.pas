unit UFunc;

interface

uses
  Forms, Dialogs, System.Classes;

type
  TFunc = class
  public
    class function CPF_Valido(S: String): Boolean;
    class function CGC_Valido(S: String): Boolean;
    class procedure CriaForm(AClassName: TClass); overload;
    class function GetPhoneMask: string; overload;
    class function GetPhoneMask(APhone: string): string; overload;
  end;

implementation

uses SysUtils;

{ TFunc }

class function TFunc.CGC_Valido(S: String): Boolean;
var
  n            : array[1..14] of integer;
  dgt1, dgt2   : integer;
  soma1, soma2 : integer;
begin
  if not(Length(s) = 14) then
  begin
      cgc_valido := false;
      exit;
  end;

  n[1]  := StrToInt(s[1]);
  n[2]  := StrToInt(s[2]);
  n[3]  := StrToInt(s[3]);
  n[4]  := StrToInt(s[4]);
  n[5]  := StrToInt(s[5]);
  n[6]  := StrToInt(s[6]);
  n[7]  := StrToInt(s[7]);
  n[8]  := StrToInt(s[8]);
  n[9]  := StrToInt(s[9]);
  n[10] := StrToInt(s[10]);
  n[11] := StrToInt(s[11]);
  n[12] := StrToInt(s[12]);
  n[13] := StrToInt(s[13]);
  n[14] := StrToInt(s[14]);

  soma1 := (n[1]*5) + (n[2]*4) + (n[3]*3) + (n[4]*2) + (n[5]*9) + (n[6]*8) + (n[7]*7) +
           (n[8]*6) + (n[9]*5) + (n[10]*4) + (n[11]*3) + (n[12]*2);

  dgt1  := 11-(soma1 mod 11);
  if (dgt1 = 10) or (dgt1 = 11) then dgt1 := 0;

  soma2 := (n[1]*6) + (n[2]*5) + (n[3]*4) + (n[4]*3) + (n[5]*2) + (n[6]*9) + (n[7]*8) +
           (n[8]*7) + (n[9]*6) + (n[10]*5) + (n[11]*4) + (n[12]*3) + (dgt1*2);

  dgt2  := 11-(soma2 mod 11);
  if (dgt2 = 10) or (dgt2 = 11) then dgt2 := 0;

  if (dgt1 <> n[13]) or (dgt2 <> n[14]) then
     cgc_valido := false
  else
     cgc_valido := true;
end;

class function TFunc.CPF_Valido(S: String): Boolean;
const
  peso1: array[1..9] of integer = (0,9,8,7,6,5,4,3,2);
  peso2: array[1..10] of integer = (1,0,9,8,7,6,5,4,3,2);

  function Valch(ch: Char): Byte;
  begin
    Valch:= ord(ch)-48;
  end;

var
  //s: string[11];
  d1,d2: byte;
  i,soma: integer;
  function vpeso1: integer;
  begin
    if (i=1) and (peso1[i]=0) then
      vpeso1:= 10
    else
      vpeso1:= peso1[i];
  end;

  function vpeso2: integer;
  begin
    if (i=1) and (peso2[i]=1) then
      vpeso2:= 11
    else if (i=2) and (peso2[i]=0) then
      vpeso2:= 10
    else
      vpeso2:= peso2[i];
  end;

begin
  if not(Length(s) = 11) then
  begin
      CPF_Valido:= false;
      exit;
  end;

  //str(cpf:0:0,s);
  insert(copy('00000000000',1,11-length(s)),s,1);
  soma:= 0;
  for i:= 1 to 9 do
    soma:= soma + vpeso1*Valch(s[i]);
  d1:= soma mod 11;
  if (d1 = 0) or (d1 = 1) then
    d1:= 0
  else
    d1:= 11 - d1;
  if d1 <> Valch(s[10]) then
  begin
    CPF_Valido:= false;
    exit;
  end;
  soma:= 0;
  for i:= 1 to 10 do
    soma:= soma + vpeso2*Valch(s[i]);
  d2:= soma mod 11;

  if (d2 = 0) or (d2 = 1) then
    d2:= 0
  else
    d2:= 11 - d2;

  if d2 = Valch(s[11]) then
    CPF_Valido:= true
  else
    CPF_Valido:= false;
end;

class procedure TFunc.CriaForm(AClassName: TClass);
begin
  try
    with TComponentClass(AClassName).Create(nil) as TForm do
      try
        ShowModal;
      finally
        Free;
      end;
  finally
    Exception.Create('Erro ao criar Tela');
  end;
end;

class function TFunc.GetPhoneMask: string;
begin
  Result := '(99)999999999;0';
end;

class function TFunc.GetPhoneMask(APhone: string): string;
begin
  case Length(APhone) of
   8: Result := '9999-9999;0';     //Ex: 38325664 = 3832-5664
   9: Result := '99999-9999;0';    //Ex: 938325664 = 93832-5664
  10: Result := '(99)9999-9999;0'; //Ex: 3538325664 = +(35)3832-5664
  11: Result := '(99)99999-9999;0';//Ex: 35938325664 = +(35)93832-5664
  else
    Result := '(99)9999-9999;0';  //Fixa o padrão 10
  end;
  //
  {Se precisar utiliziar esta formatação em campos texto por exmeplo TXT
  e so importar a classe "MaskUtils" e utilizar a função "FormatMaskText"
  EX:  sString := FormatMaskText(TFuncUtils.GetPhoneMask('3538325664'), '3538325664'); }
  //
end;

end.
