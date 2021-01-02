program removendo_ordenado_duplamente_header;
uses crt;
type
  Tnodo = ^nodo;
  nodo = record
    conteudo : integer;
    prox     : Tnodo;
    ant      : Tnodo;
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
  atual, aux,ant, ult : Tnodo;
  i, num,rem: integer;

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
            aux^.ant:=nil;
            inc(lista^.qtd);
          end
        else
        begin
          atual:=lista^.ini;
        //begin
          while (atual <> nil) and (atual^.conteudo < num) do
           begin
             ant:=atual;
             atual:=atual^.prox;
           end;
          if(atual = nil) then
         begin
            aux^.prox:=nil;
            aux^.ant:=ant;
            ant^.prox:=aux;
            lista^.fim:=aux;
            inc(lista^.qtd);
        end
          else
           if (atual = lista^.ini) then
             begin
                aux^.ant:=nil;
               aux^.prox:=atual;
               atual^.ant:=aux;
               lista^.ini:=aux;
               inc(lista^.qtd);
              end
          else
           begin
               aux^.prox:=atual;
               aux^.ant:=ant;
               atual^.ant:=aux;
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
     writeln('Digite o numero que deseja remover:');
     readln(rem);
     while(aux <> nil) and (aux^.conteudo <> rem) do
       begin
            ant:=aux;
            aux:=aux^.prox;
       end;
     if (aux = nil) then
       writeln('O numero nao esta na lista!')
     else
       if(aux = lista^.ini) and (lista^.qtd > 1) then
         begin
           lista^.ini:=aux^.prox;
            aux^.prox^.ant:=nil;
           dispose(aux);
           dec(lista^.qtd);
         end
     else
       if (aux^.prox = nil) and (aux^.ant <> nil) then
         begin
           lista^.fim:=ant;
           ant^.prox:=nil;
           dispose (aux);
           dec(lista^.qtd);
         end
     else
        if (aux^.prox <> nil) and (aux^.ant <> nil) then
          begin
            aux^.ant^.prox:=aux^.prox;
            aux^.prox^.ant:=aux^.ant;
            dispose(aux);
            dec(lista^.qtd);
          end
     else
        if (lista^.qtd = 1) then
          begin
          lista^.ini:=nil;
          lista^.fim:=nil;
          dispose(aux);
          dec(lista^.qtd)
          end;
     if (lista^.qtd = 0) then
       writeln('Lista vazia')
     else
          exibir_lista;



    until (lista^.qtd = 0);
  readln;
end.
