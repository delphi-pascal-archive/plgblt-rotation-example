unit UParallelogramme;

interface

uses Windows, SysUtils, Classes, Math;

type
  TAngle = 0..359;

  TDoublePoint = record
   X, Y: Double;
  end;

  TParallelogramme = class
  private
   FPoints: array [0..3] of TDoublePoint;
   function GetPoint(Index: Integer): TPoint;
  public
   constructor Create(const Points: array of TPoint); reintroduce;
   property Points[Index: Integer]: TPoint read GetPoint;
   procedure Rotate(Angle: TAngle);
  end;

type
 TSinCos = record
  S, C: Single;
 end;

 TSCA = array [0..359] of TSinCos;

var
 SCA: TSCA;

procedure InitSCA;

implementation

function Rad(Deg: Extended): Extended;
const
 RadConst=Pi/180;
begin
 Result := Deg * RadConst; // Conversion radian => degr�
end;

procedure InitSCA;
Var
 I: Integer;
 S, C: Extended;
begin
 for I := 0 to 359 do
  begin
   SinCos(Rad(I), S, C);
   { R�cup�re le sinus et le cosinus d'un angle (ici exprim� en d�gr�s)
    SinCos utilise l'�galit� Sin(x)� + Cos(x)� = 1 pour trouver le cosinus
    � l'aide du sinus : un seul appel � une routine trigonom�trique. }
   SCA[I].S := S;
   SCA[I].C := C;
  end;
end;

constructor TParallelogramme.Create(const Points: array of TPoint);
Var
 I: Integer;
begin
 inherited Create;
 for I := 1 to Min(4, Length(Points)) do
  begin
   FPoints[I - 1].X := Points[I].X;
   FPoints[I - 1].Y := Points[I].Y;
  end;
end;

function TParallelogramme.GetPoint(Index: Integer): TPoint;
begin
 if (Index in [0..3]) then Result := Point(Round(FPoints[Index].X), ROund(FPoints[Index].Y));
end;

procedure TParallelogramme.Rotate(Angle: TAngle);
Var
 CX, CY: Single;
 I: Integer;
 T: TDoublePoint;
 X, Y: Single;
 S, C: Single;
begin
 CX := (FPoints[0].X + FPoints[2].X) / 2;
 CY := (FPoints[0].Y + FPoints[2].Y) / 2;

 for I := 0 to 3 do
  begin
   T.X := FPoints[I].X - CX; // Translation de centre
   T.Y := FPoints[I].Y - CY;

   S := SCA[Angle].S;
   C := SCA[Angle].C;

   X := T.X * C + T.Y * S; // D�finit le mouvement de chaque point autour du cercle
   Y := -T.X * S + T.Y * C;

   T.X := CX + X; // Translation de retour
   T.Y := CY + Y;

   FPoints[I].X := T.X;
   FPoints[I].Y := T.Y;
  end;
end;

end.
