program inserao_remocao_ornenada_lista_circular_duplamente_encadeada;
uses crt;
type
  Tnodo = ^nodo;
  nodo = record
    conteudo : integer;
    prox : Tnodo;
    ant : Tnodo;
  end;
  type
    Tcabeca = ^cabeca;
    cabeca = record
      ini : Tnodo;
    end;
  var
    lista : Tcabeca;
    aux, ant, atual : Tnodo;
    i, num, rem :  integer;

    procedure exibir_lista;
    begin
      aux:=lista^.ini;
      repeat
        write (aux^.conteudo,' ');
        aux:=aux^.prox;
      until (aux = lista^.ini);
    end;

begin
  new(lista);
  lista^.ini:=nil;
  for i:= 1 to 5 do
     begin
         writeln('Digite um numero que deseja inserir na lista circular duplamente encadeada:');
         readln(num);
         new(aux);
         aux^.conteudo:=num;

       if  (lista^.ini = nil) then
           begin
             aux^.prox:=aux;
             aux^.ant:=aux;
             lista^.ini:=aux;
           end
        else
           begin
             atual:=lista^.ini;
             while (atual^.prox <> lista^.ini) and (atual^.conteudo < num) do
                   begin
                     ant:=atual;
                     atual:=atual^.prox;
                   end;
             if (atual = lista^.ini) and (atual^.conteudo > num) and (atual^.prox = atual) and (atual^.ant = atual) then
                    begin
                      aux^.prox:=atual;
                      atual^.ant:=aux;
                      aux^.ant:=atual;
                      atual^.prox:=aux;
                      lista^.ini:=aux;
                    end
             else
                if (atual = lista^.ini) and (atual^.conteudo > num) and (atual^.prox <> atual) and (atual^.ant <> atual) then
                     begin
                       ant:=atual;
                       while(ant^.prox <> lista^.ini) do
                             begin
                               ant:=ant^.prox;
                             end;
                       aux^.prox:=atual;
                       aux^.ant:=ant;
                       atual^.ant:=aux;
                       ant^.prox:=aux;
                       lista^.ini:=aux;
                     end
             else
                 if (atual^.prox = lista^.ini) and (atual^.conteudo < num) {and (atual^.prox <> atual)} then
                      begin
                         aux^.prox:=lista^.ini;
                         aux^.ant:=atual;
                         atual^.prox:=aux;
                         lista^.ini^.ant:=aux;
                      end
             else
                 if (ant^.conteudo < num) and (atual^.conteudo > num) then
                      begin
                        aux^.prox:=atual;
                        aux^.ant:=ant;
                        atual^.ant:=aux;
                        ant^.prox:=aux;
                      end;
              end;
            writeln(' ');
            exibir_lista;
            writeln(' ');
     end;
           clrscr;
           writeln(' ');
           writeln('Os numeros inseridos na lista sao:');
           writeln(' ');
           exibir_lista;
  writeln(' ');
  writeln(' ');

  writeln('Tecle enter para remover um numero da lista');
  writeln(' ');
  readln;
  writeln(' ');
  aux:=lista^.ini;
  repeat
     writeln('Digite um numero que deseja remover da lista:');
     readln(rem);
     while(aux^.prox <> lista^.ini) and (aux^.conteudo <> rem) do
           begin
             ant:=aux;
             aux:=aux^.prox;
           end;
     if (aux^.prox = lista^.ini) and (aux^.conteudo <> rem) then
           begin
             writeln ('O numero que deseja remover nao esta na lista, digite outro numero:');
           end
     else
        if(aux = lista^.ini) and (aux^.prox <> lista^.ini) and (aux^.conteudo = rem) then
              begin
                lista^.ini:=aux^.prox;
                aux^.ant^.prox:=aux^.prox;
                aux^.prox^.ant:=aux^.ant;
                dispose(aux);
              end
     else
        if (aux^.prox = lista^.ini) and (aux^.conteudo = rem) and (aux^.ant <> aux) then
              begin
                ant^.prox:=aux^.prox;
                lista^.ini^.ant:=ant;
                dispose(aux);
              end
     else
        if (aux^.prox <> lista^.ini) and (ant^.conteudo < rem) and (aux^.prox^.conteudo > rem) then
              begin
                aux^.ant^.prox:=aux^.prox;
                aux^.prox^.ant:= aux^.ant;
                dispose(aux);
              end
     else
        if (aux = lista^.ini) and (aux^.ant = aux) and (aux^.prox = aux) then
              begin
                lista^.ini:=nil;
                dispose(aux);

        end;
      if (lista^.ini = nil) then
            begin
            writeln(' ');
            writeln('Lista vazia, tecle enter para sair');
            writeln(' ');
            end
      else
           begin
            writeln(' ');
            exibir_lista;
            end;

  until (lista^.ini = nil);
  readln;
end.

