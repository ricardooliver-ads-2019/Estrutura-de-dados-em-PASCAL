program Lista_DuplamenteEncadeada;
Uses Crt;
Type
  Tnodo = ^nodo;
    nodo = record
      Conteudo : integer;
      Ant : Tnodo;
      Prox: Tnodo;
 end;
Var
  Lista, Aux, Atual, Antes : Tnodo;
  i, Num, Remover : Integer;
Procedure Exibir_Listas;
  begin
    Aux:=Lista;
    While Aux <> nil do
     begin
      Write(Aux^.conteudo,' ');
      Aux:=Aux^.prox;
     end;
  end;
procedure Pesquisando_naLista;
 begin
   writeln;
writeln('----------------------------------------');
writeln('Pesquisando um nuemro na lista');
writeln('----------------------------------------');
writeln('Digite um numero que deseja pesquisar');
Readln(Num);
Aux:=lista;
while (Aux <> nil) and (Aux^.conteudo <> Num) do
  Begin
   Aux:=Aux^.prox;
  end;
 if Aux = Nil then
   Begin
    writeln('O numero digitado NAO esta na Lista');
     writeln('----------------------------------------');
     Exibir_Listas;
     writeln;
    writeln('----------------------------------------');
   end
  Else
   begin
    writeln('O numero digitado ESTA na Lista');
     writeln('----------------------------------------');
     Exibir_Listas;
     writeln;
    writeln('----------------------------------------');
   end;
end;
begin
Lista:=Nil;
For i:=1 to 5 do
Begin
New(aux);
Writeln('Digite um numero');
Readln(Aux^.conteudo);
 if lista = nil then
   begin
     Aux^.Ant:=Nil;
     Aux^.Prox:=Nil;
     Lista:=Aux;
 end
 Else
  begin
    Atual:=Lista;
    While (Atual <> nil) and (Atual^.Conteudo < Aux^.Conteudo) do
     begin
      Antes:=Atual;
      Atual:=Atual^.prox;
    end;
    if Atual = Lista then
      begin
       Aux^.ant:=nil;
       Aux^.prox:=Atual;
       Atual^.Ant:=Aux;
       Lista:=Aux;
     end
   Else
    begin
     if Atual = Nil then
       begin
        Aux^.prox:=nil;
        Aux^.ant:=Antes;
        Antes^.Prox:=Aux;
     end
    Else
     begin
      Aux^.Ant:=Antes;
      Aux^.prox:=Atual;
      Atual^.ant^.prox:=Aux;
      Antes^.prox^.ant:=Aux;
     end;
   end;
  end;
 end;
Exibir_Listas;
Clrscr;
Pesquisando_naLista;
writeln('----------------------------------------');
writeln('Removendo um nuemro na lista');
writeln('----------------------------------------');
Repeat
writeln;
writeln('Digite um numero que deseja Remover');
Readln(Remover);
aux:=Lista;
while (Aux <> nil) and (Aux^.conteudo <> Remover) do
 begin
  Aux:=Aux^.Prox;
 end;
 if Aux = nil then
  begin
   writeln('O numero digitado NAO esta na Lista');
  end
  else
   begin
   Atual:=Lista;
   while (Atual <> nil ) and (Atual^.Conteudo <> Remover) do
    begin
     Antes:=Atual;
     Atual:=Atual^.prox;
    end;
     if (Atual = Lista)and(Atual^.prox <> nil) then
      begin
        Lista:=Lista^.prox;
        Lista^.ant:=Nil;
        Dispose(Atual);
     end
    else
     if (Atual^.Prox = Nil) and (Atual^.Ant <> Nil) then
      begin
       Antes^.prox:=Nil;
       Dispose(Atual);
     end
    else
      if (Atual = Lista) and (atual^.Prox = Nil) and (Atual^.Ant = nil) then
       begin
        Lista:=Nil;
        Dispose(Atual);
       end
    Else
     begin
      Antes^.Prox:=Atual^.pox;
      Atual^.prox^.Ant:=Antes;
      Dispose(Atual);
     end;
end;
   if Lista = nil then
    begin
     writeln('Lista esta Vazia');
   end
 else
  begin

   Exibir_Listas;

  end;
until (Lista = Nil) ;
Readln;
end.

