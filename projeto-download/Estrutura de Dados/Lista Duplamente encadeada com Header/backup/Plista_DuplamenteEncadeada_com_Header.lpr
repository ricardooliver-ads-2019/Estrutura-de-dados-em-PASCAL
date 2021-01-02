program Plista_DuplamenteEncadeada_com_Header;
Uses Crt;
Type
  Tnodo = ^nodo;
  nodo = Record
    Conteudo : integer;
    Ant : Tnodo;
    Prox: Tnodo;
  end;
  Type
    Theader = ^header;
    Header = Record
      Ini : Tnodo;
      QTD : integer;
      Fim : Tnodo;
    end;
Var
  Lista : Theader;
  Aux,Antes,Atual:Tnodo;
  I,Num,Remover:Integer;
Procedure Exibir_lista;
  Begin
   Aux:=Lista^.ini;
    While Aux <> nil do
     begin
       write(Aux^.conteudo,' ');
       Aux:=Aux^.prox;
     end;
end;
begin
 new(Lista);
 Lista^.ini:=nil;
 Lista^.Fim:=Nil;
 Lista^.QTD:=0;
 for i:=1 to 5 do
 begin
 new(Aux);
 Writeln('Digite um numero para ser inserido na lista');
 Readln(Aux^.conteudo);
  if lista^.QTD = 0 then
   begin
    Aux^.Ant:=nil;
    Aux^.Prox:=nil;
    Lista^.ini:=Aux;
    Lista^.Fim:=Aux;
    inc(Lista^.QTD);
   end
  else
   begin
      Atual:=Lista^.ini;
      While (Atual <> nil) and (Atual^.conteudo < Aux^.conteudo) do
       begin
        Antes:=Atual;
        Atual:=Atual^.prox;
       end;
      if (Atual=Lista^.ini) and (Atual^.conteudo > Aux^.conteudo) then
        begin
         Aux^.Ant:=nil;
         Aux^.Prox:=Atual;
         Atual^.Ant:=Aux;
         Lista^.ini:=Aux;
         inc(Lista^.QTD);
        end
      else
        if Atual = nil then
         begin
          Aux^.prox:=Nil;
          Aux^.ant:=Antes;
          Antes^.prox:=Aux;
          Lista^.Fim:=Aux;
          Inc(Lista^.QTD);
         end
       else
         begin
          Aux^.prox:=Atual;
          Aux^.ant:=Antes;
          Atual^.Ant:=Aux;
          Antes^.prox:=Aux;
          Inc(Lista^.QTD);
         end;
 end;
 Exibir_lista;
 End;
 ClrScr;
 Repeat
 Aux:=Lista^.ini;
 Writeln('Digite um numero que deseje remover da lista');
 Readln(Remover);
 while (Aux <> nil) and (Aux^.conteudo <> remover) do
     begin
      Antes:=Aux;
      Aux:=Aux^.prox;
     end;
  if aux = nil then
    begin
     writeln('Numero digitado nao esta na lista, Digite um novo numero');
     Exibir_lista;
    end
   else
    if (Aux^.Prox = nil)and(Aux^.conteudo = remover)and(Lista^.QTD > 1)then
      begin
       Lista^.Fim:=Antes;
       Antes^.prox:=Nil;
       Dispose(Aux);
       Dec(Lista^.QTD);
    end
    else
      if (Aux = Lista^.ini)and(Aux^.conteudo = remover)and(Lista^.QTD > 1)then
        begin
         Lista^.ini:=Lista^.prox;
         Lista^.ini^.ant:=nil;
         Dispose(Aux);
         Dec(Lista^.QTD);

        end;

     if lista^.QTD = 0 then
       writeln('Lista Esta Vazia')
      else
      Exibir_lista;

 until(Lista^.ini = nil)and(Lista^.fim = Nil);
 Readln;
end.

