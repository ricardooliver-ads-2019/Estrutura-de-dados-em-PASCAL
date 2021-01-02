program inserindo_ordenado_simplesmente_header2;
uses crt;
type
  Tnodo = ^nodo;
  nodo = record
    conteudo : integer;
    prox     : Tnodo;
  end;
type
  Theader = ^header;
  header = record
    ini : Tnodo;
    qtd : integer;
    fim : Tnodo;
  end;
var
  lista : Theader;
  atual, aux, ant, ult : Tnodo;
  i, num, rem: integer;

  procedure exibir_lista;
  begin
   aux:=lista^.ini;
    while (aux <> nil) do
    begin
      write(aux^.conteudo,' ');
      aux:=aux^.prox;
    end;
  end;

begin
  new(lista);
  lista^.ini:=nil;
  lista^.qtd:=0;
  lista^.fim:=nil;

    for i:=1 to 5 do
      begin
        writeln('Digite um numero:');
        readln(num);
        new(aux);
        aux^.conteudo:=num;
        if (lista^.qtd = 0) then
          begin
            lista^.ini:=aux;
            lista^.fim:=aux;
            aux^.prox:=nil;
            inc(lista^.qtd);
          end
        else
        begin
          atual:=lista^.ini;
        begin
          while (atual <> nil) and (atual^.conteudo < num) do
           begin
             ant:=atual;
             atual:=atual^.prox;
           end;
          if(atual = nil) then
         begin
            lista^.fim^.prox:=aux;
            lista^.fim:=aux;
            aux^.prox:=nil;
            inc(lista^.qtd);
        end
          else
           if (atual = lista^.ini) then
             begin
               aux^.prox:=atual;
               lista^.ini:=aux;
               inc(lista^.qtd);
             end
          else
           begin
               aux^.prox:=atual;
               ant^.prox:=aux;
               inc(lista^.qtd);
          end;
          end;
        end;
      exibir_lista;
      end;
     writeln(' ');
     repeat
      aux:=lista^.ini;
      writeln('Digite um numero que deseja remover:');
      readln(rem);
      while (aux <> nil) and (aux^.conteudo <> rem) do
       begin
            ant:=aux;
            aux:=aux^.prox;
       end;
      if (aux = nil) then
       writeln('O numero nao esta na lista!')
       else
         if (aux = lista^.ini) and (lista^.qtd > 1) then
            begin
              lista^.ini:=aux^.prox;
              dispose(aux);
              dec(lista^.qtd);
            end
       else
          if (aux^.prox = nil) then
             begin
               lista^.fim:=ant;
               ant^.prox:=nil;
               dispose(aux);
               dec(lista^.qtd);
             end
       else
          if (aux^.conteudo = rem) and (aux^.prox <> nil) then
            begin
              ant^.prox:=aux^.prox;
              dispose(aux);
              dec(lista^.qtd);
            end
        else
           if(lista^.qtd = 1) then
            begin
              lista^.ini:=nil;
              lista^.fim:=nil;
              dispose(aux);
              dec(lista^.qtd);
            end;
        if (lista^.qtd = 0) then
         writeln('Lista Vazia!')
        else
          exibir_lista;
      until (lista^.qtd = 0);
      readln;
end.
