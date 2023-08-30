Algoritmo "semnome"

Var
i,j,cont :  inteiro
jogo : vetor[1..3,1..3] de caractere
//------------------------------------------------------------
  procedimento preencherMatriz()
  inicio
      para i de 1 ate 3 faca
          para j de 1 ate 3 faca
               cont <- cont+1
               jogo[i,j] <- NumpCarac(cont)
          fimpara
     fimpara
  fimprocedimento
//-------------------------------------------------------------
 procedimento velha()
 inicio
      escreval ("===================")
      escreval (" JOGO DA VELHA ")
      escreval ("+-----+-----+-----+")
      para i de 1 ate 3 faca
           para j de 1 ate 3 faca
                escreva ("| ")
                escreva (jogo[i,j]:4)
           fimpara
           escreva ("|")
           escreval ()
           escreval ("+-----+-----+-----+")
      fimpara
      escreval ("===================")
 fimprocedimento
 //-----------------------------------------------------------
 procedimento jogar()
 var
 //DECLARACAO DAS VARIAVEIS
 x,a : caractere
 op,l,par,v : inteiro
 venceu : logico
 inicio
 x <- "X" //VARIAVEL QUE ARMAZENA  X OU O
 par <-1  //x é numero par e O é numero impar(para controle)
 venceu <- falso   //LIMITE DO LOOP REPITA
 v <- 0            // O loop deve acontecer 9 vezes sem vencedor
                   // para dar velha (segundo limite do loop)

 repita
    escreval("Digite um numero para ",x," :")
    leia(op)
    se (op>0) e (op<10) entao//n° digitado tem que ser entre 1 e 9
          se (op>0) e (op<4)entao //se n° digita estiver na 1° linha
             l <- 1 //cariavel linha
 //se o que estiver na linha 1 e coluna op(op sera 1,2 ou 3)
 //ja tiver um x ou o mostre mensagem
             se(jogo[l,op] = "X") ou (jogo[l,op] = "O")entao
                  escreval("Esse numero já foi digitado!")
 //ela linha precisa ser colocada para que a funcao limpatela la embaixo
 // nao engula o escreval anterior
                  escreva("Digite enter para continuar")
                  leia(a)
             senao  //se nao foi digitado ainda
                  jogo[l,op] <- x    //preenchemos com x
                venceu <- verificarGanhador()//verifica se ha vencedor
 //o incremento significa que + uma jogada ocorreu
 //esse v precisa atingir 9 para o jogo acabar em velha
                v <- v + 1
                se(venceu = falso)entao //caso nao venceu apos verificar
                  se(par % 2 <> 0) entao  //se for impar é a vez do O
                     x <- "O"
                  senao
                     x <- "X" //se for par é a vez do x
                  fimse
                  par <- par + 1 //oincrementa pra mudar o jogador x/O
                fimse
             fimse
          senao
               se(op>3) e (op<7) entao
                   l<- 2
                   se(jogo[l,op-3] = "X") ou (jogo[l,op-3] = "O")entao
                        escreval("Esse numero já foi digitado!")
                        escreva("Digite enter para continuar")
                        leia(a)
                   senao
                      jogo[l,op-3] <- x
                      venceu <- verificarGanhador()
                      v <- v + 1
                    se(venceu = falso) entao
                       se(par % 2 <> 0) entao
                           x <- "O"
                       senao
                           x <- "X"
                       fimse
                       par <- par + 1
                    fimse
               fimse
               senao
                   L<- 3
                   se(jogo[l,op-6] = "X") ou (jogo[l,op-6] = "O")entao
                        escreval("Esse numero já foi digitado!")
                        escreva("Digite enter para continuar")
                        leia(a)
                   senao
                      jogo[l,op-6] <- x
                      venceu <- verificarGanhador()
                       v <- v + 1
                      se(venceu =  falso) entao
                         se(par % 2 <> 0) entao
                              x <- "O"
                         senao
                              x <- "X"
                         fimse
                         par <- par + 1
                      fimse
                   fimse
               fimse

          fimse
           limpatela
             velha()
    senao
      escreval("Opção invalida")
    fimse
ate(venceu = verdadeiro) ou (v = 9)

se(venceu = verdadeiro)entao
    escreval("O jogador ",x, " VENCEU!!!")
senao
  escreval("DEU VElHA!!!")
fimse
fimprocedimento
//----------------------------------------------------------
     funcao verificarGanhador() : logico
     var
     tem : logico
     inicio
     tem <- falso
     para i de 1 ate 3 faca   //verificar horizontal
          se ((jogo[i,1] = jogo[i,2]) e (jogo[i,2] = jogo[i,3])) entao
                 tem <- verdadeiro
          fimse
     fimpara
     para i de 1 ate 3 faca   //verificar vertical
          se (jogo[1,i] = jogo[2,i]) e (jogo[2,i] = jogo[3,i]) entao
                 tem <- verdadeiro
          fimse
     fimpara
     se (jogo[1,1] = jogo[2,2]) e (jogo[2,2] = jogo[3,3]) entao
                 tem <- verdadeiro
     fimse
     se (jogo[1,3] = jogo[2,2]) e(jogo[2,2] = jogo[3,1])entao
             tem <- verdadeiro
     fimse
     retorne tem
     fimfuncao

//-----------------------------------------------------------
Inicio
  preencherMatriz()
  velha()
  jogar()

Fimalgoritmo