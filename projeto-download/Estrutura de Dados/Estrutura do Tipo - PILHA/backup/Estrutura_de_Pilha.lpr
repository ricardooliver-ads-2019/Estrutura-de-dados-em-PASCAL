program Estrutura_de_Pilha;
Uses crt;
Type
  Tnodo = ^nodo;
  nodo = Record
    Conteudo : integer;
    Prox     : Tnodo;
  end;
Var
  Pilha, Aux : Tnodo;
  i, Num : integer;
  Remover: char;


  Procedure Exibir_Pilha;
  Begin
    Aux:=Pilha;
     while Aux <> nil do
      begin
       Write(Aux^.Conteudo,' ');
       Aux:=Aux^.prox;
      end;
  end;
begin          // Inserindo na Pilha
Pilha:=nil;
for i:=1 to 5 do
 Begin
  New(Aux);
  writeln('Digite um numero');
  readln(Aux^.conteudo);
  if Pilha = Nil then
   begin
    Aux^.prox:=Nil;
    Pilha:=Aux;
   end
 else
  begin
   Aux^.prox:=Pilha;
   Pilha:=Aux;
  end;
  Exibir_Pilha;
end;        //-------------------------------
ClrScr;     //Pesquisando Numero Na Pilha
writeln('Digite um numero para pesquisar na Pilha');
Readln(Num);
Aux:=Pilha;
while (Aux <> nil)  and  (Aux^.conteudo <> Num)do
 begin
  Aux:=Aux^.prox;
 end;
 if Aux = nil then
  begin
   writeln('O numero digitado nao esta na Pilha');
   Exibir_Pilha;
   writeln;
  end
  else
    begin
     writeln('O numero digitado esta na Pilha');
      Exibir_Pilha;
     writeln;
    end; //----------------------------------
Aux:=Pilha; //Removendo da Pilha
Repeat
     Writeln('Se Voce deseja Remover um Numero da Pilha Tecle [S] se nao Digite [N]');
     Readln(Remover);
      if (Pilha <> nil) and (Remover <> 'n') then
       begin
        Pilha:=Pilha^.prox;
         Dispose(Aux);
         if Pilha = nil then
          begin
          writeln('Pilha Esta Vazia');
          break;
          end;
        Exibir_Pilha;
       end;
until(Remover = 'n');
Exibir_Pilha;

Readln;
end.

