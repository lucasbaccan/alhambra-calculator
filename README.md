# Alhambra Calculator

<p align="center">
  <img src="https://github.com/lucasbaccan/alhambra-calculator/assets/2676484/cefd5819-2477-42f2-b3db-fbee7d6df48d" alt="Alhambra Calculator" />
</p>

Este projeto é uma calculadora de pontos para o jogo de tabuleiro **Alhambra**.

## Motivação

Gostei muito do jogo, mas não curti muito realizar os cálculos dos pontos ao final dos turnos A, B e Final.  
Estava começando a estudar Flutter, e para por em prática os conhecimentos, resolvi criar este aplicativo.
No final, acabei exportando o projeto como um site (já que o flutter permite), que está disponível em [lucasbaccan.com.br/alhambra](https://lucasbaccan.com.br/alhambra).


## Como usar

Está é a tela inicial do aplicativo.

<p align="center" >
  <img src="https://github.com/lucasbaccan/alhambra-calculator/assets/2676484/97b14306-65ed-4663-80f4-ce0db37912fb" alt="Tela inicial" height="510px"/>
</p>

### Menu superior
No menu superior temos 3 opções:
  - Menus a esquerda:
    - **Menu lateral**: Abre o menu lateral, onde é possível acessar as configurações do número de jogadores e alternar entre modo claro e escuro.
  - Menus a direita:
    - **Reiniciar**: Reinicia o jogo, limpando todos os dados.
    - **Expandir/Recolher**: Botão para expandir ou recolher a caixa de cada jogador que contem os peças e suas quantidades.

### Selecionando as peças

Abaixo do menu superior, temos o menu de seleção de peças. Nele temos as 7 cores de peças do jogo, e ao clicar em uma delas, ela é selecionada para que no momento de edição das peças dos jogadores, seja possível adicionar ou remover a quantidade de peças selecionadas.

Dentro de cada cor tem o número de peças disponíveis que não foram compradas pelos jogadores.

### Menu inferior

No menu inferior temos 4 opções:
  - **Rodada 1**: Abre o menu de edição das peças dos jogadores para a rodada 1.
  - **Rodada 2**: Abre o menu de edição das peças dos jogadores para a rodada 2.
  - **Rodada Final**: Abre o menu de edição das peças dos jogadores para a rodada final.
  - **Total**: Abre o placar final da partida.

### Selecionando o número de jogadores

Utilize o menu lateral para selecionar o número de jogadores. Ao abrir o menu, você verá uma lista com todas as cores dos jogadores.

Utilize o botão de *ativar/desativar* para incluir ou excluir um jogador da partida.

Os jogadores são ordenados de acordo com a ordem em que foram selecionados. Então se deseja personalizar a ordem dos jogadores, basta desativar todos e ativar na ordem desejada.

**Obs:** Ao desativar um jogador, todos os dados dele são perdidos.

**Obs2:** Não precisa salvar as configurações, elas são salvas automaticamente.

<p align="center" >
  <img src="https://github.com/lucasbaccan/alhambra-calculator/assets/2676484/d4c3a6ed-fcf6-4284-a444-34bc5f8d8af0" alt="Seleção de jogadores" height="510px"/>
</p>

### Contabilizando os pontos

Os pontos do jogo são contabilizados em 3 etapas: A, B e Final, de acordo com a tabela abaixo:

<p align="center" >
  <img src="https://github.com/lucasbaccan/alhambra-calculator/assets/2676484/66fccbf9-9fca-49f5-bc5a-d8aea9ce6df2" alt="Seleção de jogadores" />
</p>

Mas nós não queremos fazer contas, então vamos utilizar o aplicativo para isso.

#### Etapa A

Imagine que o jogador **Azul** chegou no final da etapa A com as seguintes peças:
| Peça | Quantidade |
| ---- | ---------- |
| Azul | 1          |
| Vermelho | 3          |
| Marrom | 2          |
| Branco | 0          |
| Verde | 1          |
| Roxo | 0          |

Para realizarmos esse cálculo, siga os passos abaixo:
- Clique no botão **Rodada 1** no menu inferior. (Caso não tenha feito isso ainda)
- Clique no botão **Azul** no menu de seleção de peças.
- Procure o jogador **Azul** na lista de jogadores e clique no botão **+** que está abaixo de **Construções** para adicionar uma peça azul. Essa ação deve ser feita 1 vez.
- Clique no botão **Vermelho** no menu de seleção de peças.
- Procure o jogador **Azul** na lista de jogadores e clique no botão **+** que está abaixo de **Construções** para adicionar uma peça vermelha. Essa ação deve ser feita 3 vezes.
- Clique no botão **Marrom** no menu de seleção de peças.
- Procure o jogador **Azul** na lista de jogadores e clique no botão **+** que está abaixo de **Construções** para adicionar uma peça marrom. Essa ação deve ser feita 2 vezes.
- Clique no botão **Verde** no menu de seleção de peças.
- Procure o jogador **Azul** na lista de jogadores e clique no botão **+** que está abaixo de **Construções** para adicionar uma peça verde. Essa ação deve ser feita 1 vez.

Se tudo saiu como esperado, o jogador **Azul** deve estar com 11 pontos na etapa A.

Para somar os pontos de muralha, basta clicar no botão **+** que está abaixo de **Muralha**.

#### Etapa B

Da mesma forma que a etapa A, vamos contabilizar os pontos da etapa B.

#### Etapa Final

Da mesma forma que a etapa A, vamos contabilizar os pontos da etapa Final.

#### Placar final

Para visualizar o placar final, basta clicar no botão **Total** no menu inferior.

<p align="center" >
  <img src="https://github.com/lucasbaccan/alhambra-calculator/assets/2676484/974e795a-da53-44a4-ab1a-d1aec215cf45" alt="Seleção de jogadores" height="510px"/>
</p>

## Bons jogos!

Espero que esse aplicativo ajude a tornar suas partidas de Alhambra mais divertidas e menos cansativas.
