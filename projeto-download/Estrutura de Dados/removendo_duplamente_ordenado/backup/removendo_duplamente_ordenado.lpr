program removendo_duplamente_ordenado;
uses crt;
type
  Tnodo = ^nodo;
  nodo = record
    conteudo:integer;
    prox : Tnodo;
    ant :Tnodo;
  end;
  var
    lista, aux, ult,atual,ant : Tnodo;
    i,num,rem: integer;
    achou: boolean;
 procedure exibir_lista;
  begin
  aux:=lista;
  while (aux <> nil) do
    begin
       write(aux^.conteudo,' ');
       aux:=aux^.prox;
     end;
  end;
begin
  lista :=nil;
  for i:= 1 to 5 do
     begin
       WriteLn('Digite um numero:');
       readln(num);
       new(aux);
       aux^.conteudo:=num;
       aux^.prox:=nil;
       if (lista = nil) then
          begin
            aux^.ant:=nil;
            lista :=aux
          end
       else
          begin
          atual:=lista;
          while (atual <> nil) and (atual^.conteudo < num) do
          begin
            ant:=atual;
            atual:=atual^.prox;
          end;
          if ( atual = nil) then
            begin
             aux^.ant:=ant;
             ant^.prox:=aux;
           end
          else
           if (atual = lista) and (atual^.conteudo > num) then
             begin
             aux^.ant:=nil;
             aux^.prox:=atual;
             atual^.ant:=aux;
             lista:=aux;
           end
          else
          begin
            aux^.prox:=atual;
            aux^.ant:=ant;
            atual^.ant:=aux;
            ant^.prox:=aux;
          end;
         exibir_lista;

end;

     end;
  repeat
    writeln(' ');
    aux:=lista;
    achou:=false;
    writeln('Digite um numero que deseja remover ou 0 para sair:');
    readln(rem);
    while (aux^.conteudo <> rem) and (aux^.prox <> nil) do
    begin

           ant:=aux;
           aux:=aux^.prox;


    end;

    if(aux^.prox = nil) and (aux^.conteudo <> rem) then
      writeln('O numero nao esta na lista')
    else
      if (aux = lista) and (aux^.prox <> nil) then
        begin                       {remove no inicio}
             lista:=aux^.prox;
             lista^.ant:=nil;
             dispose(aux);
        end
     else
       if (aux^.prox = nil) and (aux^.ant <> nil) then
         begin                      {remove o final}
              ant^.prox:=nil;
              dispose(aux);
         end
     else
       if ( aux^.conteudo = rem) and  (aux^.prox <> nil) and (aux^.ant <> nil) then
      begin
         aux^.prox^.ant:=ant;     {remove no meio}
         ant^.prox:=aux^.prox;
         dispose(aux);
      end
       else
        if (lista^.ant = nil) and (lista^.prox = nil) then
         begin
           lista:=nil;                {remove o ultimo nodo}
           dispose(aux);

         end;

       if (lista <> nil) then
         exibir_lista
       else
         writeln('Lista vazia:');


     until(rem = 0) or (lista = nil);

   readln;
 end.

