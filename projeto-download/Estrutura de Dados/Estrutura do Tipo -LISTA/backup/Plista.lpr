program Plista;
Uses crt;
Type
  Tnodo = ^nodo;
  Nodo  = record
    Conteudo : integer;
    Prox     : Tnodo;
  end;
Var
   Lista, Aux, Atual :Tnodo;
   i, Num : integer;
   Remover: Char;

Procedure Exibir_Lista;
  begin
   Aux:=Lista;
   While Aux <> Nil do
    begin
     write(Aux^.Conteudo,' ');
     Aux:=Aux^.prox;
    end;
end;
begin
Lista:= Nil;
for i:=1 to 5 do
  Begin
    New(Aux);
     Writeln('Digite um numero');
    readln(Aux^.Conteudo);
   if lista = nil then
    begin
     Aux^.prox:=nil;
     Lista := Aux;
    end
   Else
    begin
     Atual:=Lista;
     while Atual^.prox <> nil do
      begin
       Atual:=Atual^.Prox;
      end;
     Aux^.prox:=Nil;
     Atual^.Prox:=Aux;
    end;
  Exibir_Lista;
end;
ClrScr;
writeln('-----------------------');
writeln('Presquisar numero na lista');
writeln('Digite um numero que deseja procurar');
Readln(Num);
  Atual:=lista;
  While (Atual <> Nil) and (Atual^.conteudo <> Num) do
   begin
     Atual:=Atual^.prox;
   end;
   if Atual = nil then
    begin
     writeln('Numero Digitado Nao esta na lista');
     Exibir_Lista;
    end
   else
     begin
      writeln('Numero Digitado esta na lista');
      Exibir_Lista;
      end;
Repeat
     Writeln('Se Voce deseja Remover um Numero da Lista Tecle [S] se nao Digite [N]');
     Readln(Remover);
      if (Lista <> nil) and (Remover <> 'n') then
       begin
        Aux:=Lista;
        Lista:=Lista.prox;
         Dispose(Aux);
         if Lista = nil then
          begin
          writeln('Lista Esta Vazia');
          break;
          end;
        Exibir_Lista;
       end;
until(Remover = 'n');
Exibir_Lista;

Readln;
end.

