program insercao_e_remocao_lista_ordenada_cirular;
uses crt;
type
  Tnodo = ^nodo;
  nodo = record
    conteudo : integer;
    prox: Tnodo;

  end;
  type
    Tcabeca = ^cabeca;
    cabeca = record
      ini : Tnodo;
    end;
    var
      lista : Tcabeca;
      atual, ant, aux : Tnodo;
      i,num,rem: integer;

      procedure exibir_lista;
       begin
         aux:=lista^.ini;
         repeat

                write(aux^.conteudo,' ');
                aux:=aux^.prox;

          until (aux = lista^.ini);

       end;

begin
  new(lista);
  lista^.ini:=nil;
  for i:=1 to 5 do
     begin
        Writeln ('Digite um numero que deseja inserir na lista circular:');
        readln(num);
        new(aux);
        aux^.conteudo:=num;
        if (lista^.ini = nil) then
           begin
            lista^.ini :=aux;
            aux^.prox:= aux;

           end
        else
        begin
        atual:=lista^.ini;
        while (atual^.prox <> lista^.ini) and (atual^.conteudo < num) do
              begin
                ant:=atual;
                atual:=atual^.prox;
              end;

           if (atual = lista^.ini) and (atual^.prox = lista^.ini) and (atual^.conteudo > num) then
                  begin
                     aux^.prox:=atual;
                     lista^.ini:=aux;
                     atual^.prox:=aux;
                  end
           else
            if (atual = lista^.ini) and (atual^.prox <> lista^.ini) and (atual^.conteudo > num) then
                  begin
                     ant:=atual;
                     while (atual^.prox <> lista^.ini) do

                           begin
                                atual:=atual^.prox;
                           end;
                               aux^.prox:=ant;
                               lista^.ini:=aux;
                               atual^.prox:=aux;

                  end
        else
          if (atual^.prox = lista^.ini) and (atual^.conteudo < num) then
                    begin

                       atual^.prox:=aux;
                       aux^.prox:=lista^.ini;


                    end
        else
          begin
          aux^.prox:=atual;
          ant^.prox:=aux;
          end;
        writeln;

       writeln;
     end;
  end;
exibir_lista;
 writeln(' ');
aux:=lista^.ini;
repeat
       writeln('Digite um numero que deseja remover da lista');
       readln(rem);
       while(aux^.prox<>lista^.ini) and (aux^.conteudo <> rem) do
             begin
                  ant:=aux;
                  aux:=aux^.prox;
             end;
       if (aux^.prox = lista^.ini) and (aux^.conteudo <> rem) then
                 begin
                 writeln('O numero digitado nao esta na lista, digite outro numero:');
                 writeln(' ');
                 exibir_lista;
                 writeln(' ');
                 end
       else
           begin
                if (aux = lista^.ini) and (aux^.conteudo = rem) and (aux^.prox <> lista^.ini) then
                      begin
                           ant:=aux;
                           while(ant^.prox <> lista^.ini) do
                                 begin
                                      ant:=ant^.prox;
                                 end;
                                 ant^.prox:=aux^.prox;
                                 lista^.ini:=aux^.prox;
                                 dispose(aux);
                      end
                else
                    if (aux^.prox = lista^.ini) and (aux^.conteudo = rem) and (aux^.prox <> aux) then
                          begin
                               ant^.prox:=lista^.ini;
                               dispose(aux);
                          end
                else
                    if (ant^.conteudo < rem) and (aux^.prox^.conteudo > rem) then
                          begin
                               ant^.prox:=aux^.prox;
                               dispose(aux);
                          end
                else
                   //if (aux = lista^.ini) and (aux^.prox = aux) and (aux^.conteudo = rem) then
                         begin
                              lista^.ini:=nil;
                              dispose(aux)
                         end;
                         writeln(' ');
                  if (lista^.ini = nil) then
                        begin
                             Writeln ('Lista Vazia, tecle enter para sair:');
                        end
                  else
                     exibir_lista;
           end;

until (lista^.ini = nil);
readln;
end.

