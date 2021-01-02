program Lista_simplesCom_Header;
Uses CRT;
Type
  Tnodo = ^nodo;
  Nodo = Record
    Conteudo : integer;
    Prox : Tnodo;
  end;

Type
  Theader = ^Header;
  Header = Record
    ini : Tnodo;
    QTD : integer;
    Fim : Tnodo;
  end;
 Var
   Lista : Theader;
   Aux, Atual, Antes : Tnodo;
   I, Num, Remover : Integer;
Procedure Exibir_Lista;
 begin
   Aux:=Lista^.ini;
   While Aux <> nil do
    begin
      Write(Aux^.conteudo,' ');
      Aux:=Aux^.prox;
    end;
 end;
begin
  new(Lista);
  Lista^.qtd:=0;
  Lista^.ini:=Nil;
  Lista^.fim:=Nil;
  For i:=1 to 5 do
   begin
    new(Aux);
    Writeln('Digite um numero para ser inserido na lista');
    Readln(Aux^.Conteudo);
    if Lista^.QTD = 0 then
     begin
       Aux^.prox:=Nil;
       Lista^.ini:=Aux;
       Lista^.fim:=Aux;
       Inc(Lista^.QTD);
     end
      Else
       begin
        Atual:=Lista^.ini;
        While (Atual <> nil)and(Atual^.conteudo < Aux^.conteudo) do
         begin
          Antes:=Atual;
          Atual:=Atual^.prox;
         end;
         if Atual = nil then
          begin
            Aux^.prox:=nil;
              Antes^.prox:=Aux;
              Lista^.fim:=Aux;
            Inc(Lista^.QTD);
          end
         else
           if Atual = Lista^.ini then
            begin
               Aux^.prox:=Atual;
                Lista^.ini:=Aux;
               Inc(Lista^.QTD);
            end
          else
           begin
             Aux^.prox:=Atual;
              Antes^.Prox:=Aux;
             Inc(Lista^.QTD);
           end;
      end;
   Exibir_Lista;
   end;
  Repeat
  writeln;
  Aux:=lista^.ini;
  writeln('Digite um numero que deseja remover');
  readln(Remover);
  while (Aux <> nil) and (Aux^.conteudo <> remover) do
   begin
    Antes:=Aux;
    Aux:=Aux^.Prox;
   end;
     if Aux = nil then
      begin
       Writeln('O numero digitado nao esta na lista');
       Writeln('Digite um novo numero');
       Write('Lista ------->>> ');
       Exibir_Lista;
       Writeln;
      end
     else
      begin
      if (Aux = Lista^.ini) and (Lista^.QTD > 1) then
        begin
          Lista^.ini:=Lista^.ini^.prox;
           Dispose(Aux);
          Dec(Lista^.QTD);
        end
         Else
         If (Aux^.Prox = Nil)and(Lista^.QTD > 1) then
           begin
             Lista^.Fim:=Antes;
              Antes^.Prox:=nil;
              Dispose(Aux);
             Dec(Lista^.QTD);
            end
           Else
            If (Antes^.conteudo < Aux^.conteudo) and
               (Aux^.conteudo  = remover)and(Aux^.Prox^.Conteudo > Aux^.conteudo)then
             begin
              Antes^.prox:=Aux^.prox;
               Dispose(Aux);
              Dec(Lista^.QTD);
              end
            Else
             if Lista^.QTD = 1 then
              begin
               Lista^.ini:=nil;
               Lista^.Fim:=nil;
               Dispose(Aux);
               Dec(Lista^.QTD);
              end;
         end;
       If (Lista^.ini = nil)and(Lista^.fim = nil) then
          writeln('Lista esta vazia')
          Else
          Exibir_Lista;
  until(Lista^.QTD = 0);
  Readln;
end.

