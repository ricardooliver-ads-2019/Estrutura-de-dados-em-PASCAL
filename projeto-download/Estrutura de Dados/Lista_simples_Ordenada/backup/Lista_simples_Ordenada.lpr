program Lista_simples_Ordenada;
Uses Crt;
Type
  Tnodo = ^nodo;
   nodo = record
    Conteudo : integer;
    Prox     : Tnodo;
  end;
Var
  Lista, Aux, Atual, Antes : Tnodo;
  i,Num,Remover : integer;
procedure Exibir_Lista;
 begin
   Aux:=Lista;
   while Aux <> Nil do
     begin
       Write(Aux^.conteudo,' ');
       Aux:=Aux^.prox;
     end;
 end;
procedure Procurar_naLista;
begin
  Writeln('Digite um nomero que deseja procurar na lista');
  Readln(Num);
  Aux:=Lista;
  while (Aux <> nil) and (Aux^.Conteudo <> Num) do
   begin
    Aux:=Aux^.prox;
   end;
   if Aux = nil then
     begin
      Writeln('Numero Digitado nao esta na lista');
      Exibir_Lista;
    end
    else
     Begin
      Writeln('Numero Digitado esta na lista');
      Exibir_Lista;
   end;
end;
begin
Lista:=Nil;
for i:=1 to 5 do
 begin
  New(Aux);
  writeln('Digite um numero');
  readln(Aux^.conteudo);
  Atual:=lista;
  if lista = nil then
   begin
     Aux^.prox:=nil;
     Lista:=Aux;
end
 Else
  begin
   while (Atual <> nil) and (Atual^.conteudo < Aux^.conteudo) do
   Begin
    Antes:=Atual;
    Atual:=Atual^.prox;
   end;
    if (Atual = lista)and(Atual^.Conteudo > Aux^.Conteudo)then
     begin
       Aux^.prox:=Atual;
       Lista:=Aux;
     end
      Else
       if (Atual = Nil)then
        begin
         Aux^.Prox:=nil;
         Antes^.prox:=Aux;
        end
       Else
        begin
           Aux^.prox:=Atual;
           Antes^.prox:=Aux;
        end;
     end;
 end;
Write('Lista Ordenada --> ');
Exibir_Lista;
Readln;
ClrScr;
Procurar_naLista;
Repeat
 Writeln('--------------------------------------------');
 Writeln;
 Writeln('Digite um numero que deseja remover da lista');
 Readln(Remover);
 Aux:=Lista;
 While (Aux <> nil) and (Aux^.conteudo <> Remover) do
  begin
   Antes:=Aux;
   Aux:=Aux^.prox;
  end;
 if Aux = nil then
  begin
   Writeln('--------------------------------------------');
   Writeln('Numero Digitado nao esta na lista');
   Exibir_Lista;
   Writeln('--------------------------------------------');
  end
 else
   if (Aux = lista) then
    begin
     Lista:=Aux^.Prox;
     Dispose(Aux);
   end
  else
   if (Aux^.prox = nil) then
    begin
     Antes^.prox:=Nil;
     Dispose(Aux);
    end
  else
   begin
    Antes^.prox:=Aux^.Prox;
    Dispose(Aux);
   end;
   if Lista = nil then
    Begin
     Writeln('Lista Esta vazia');
     Writeln;
     end
    Else
    Exibir_Lista;
until(Lista = nil);
Readln;
end.

