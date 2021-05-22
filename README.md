<h1 style="text-align: center;">Desbravadores Subterraneo</h1>
<p style="text-align: center;">Para acompanhamento no desenvolvimento do projeto para a disciplina de TÓPICOS ESPECIAIS
    EM PROGRAMAÇÃO (TEP).</p>
<p style="text-align: center;">Publicação: <a href="https://danielsonalencar.itch.io/desbravadores-do-subterrneo">https://danielsonalencar.itch.io/desbravadores-do-subterrneo</a></p>

<hr>

<h2>:film_strip: Resumo da história do jogo</h2>

<h3>Tipo de jogo</h3>

Trata-se do desenvolvimento de um jogo de aventura em 2D, pixel art é o tipo de art que vai guiar o desenvolvimento do
jogo.

<h3>Resumo da história do jogo</h3>

O jogo se passa em um futuro não muito distante, onde as pessoas conseguiram destruir a superfície do planeta por meio
da poluição, agora a única forma de sobrevivência para os humanos é morar no subterrâneo, pois as viagens espaciais
ainda uma é ideia para um futuro distante.

<h3>Personagem principal</h3>

O personagem principal é o {nome_do_personagem}, que possui o objetivo de desbravar cavernas subterrânas que foram
encontradas, o nosso personaegm deverá ser corajoso para enfrentar inimigos e tornar as cavernas um local de uma
possível moradia para as pessoas que estão sem local para sobreviver nesse novo momento do mundo.

<h3>Ambientação</h3>

A ambientação ocorre em um meio subterrâneo encontrado, porém esse meio parece já ter sido explorado anteriormente, pois
possui um ampla área para moradia e possui também condições para as pessoas sobreviverem, de fato o local já possui a
presença de seres, não se sabe se são humanos ou animais pre históricos, acontece que esse meio subterrâneo deverá ser
vasculhado e transformado em um abrigo.

<h3>Inimigos</h3>

Os inigos são serem desconhecidos para as pessoas do mundo, há dois tipos princiais de inimigos, são eles:

1. Inimigos terrestres
2. Inimigos voadores

<h3>Níveis</h3>

O jogo será divido em níveis, ao todo serão {numero_de_níveis} níveis para serem superados durante a gameplay.


<h1>Observações de desenvolvimento</h1>

<h3>Criação dos mapas</h3>

Para que o mapa possa ser adicionado ao game será necessário a criação de arquivos formatados especificamente para a Godot.

A criação dos arquivos é feita pela própria Godot, onde a engine oferece uma opção para a criaçã de Sprites selecionando uma parte específica de uma imagem, dessa forna sendo necessário a criação de apenas um arquivo contendo todos os objetos que serão utilizados no mapa.

A engine oferece também a colocação de colisões nos objetos criados, não sendo obrigatório a colocação das colisões, mas em objetos cujo papel será de servir de base para o player, as colisões são importantes.

Para a criação dos mapas, devemos observar que há um arquivo chamado *.tres.

<h3>Comandos de entrada</h3>

Os comandos de entrada se referem a como o jogador irá interagir com o jogo, como a proposta do jogo é que o mesmo sejá jogável em computadores por meio do teclado e gamepad, se faz necessário que dois tipos de comandos sejam interpretado apenas como uma ação no jogo, por exemplo, no teclado se a tecla **"W"** for precionada o player deve pular, da mesma forma se a tecla **"A"** for precionada (Em gamepads baseados no controle de Xbox, no controle de playstation seria a tecla **"X"**) o player também deve executar a ação de pular, podemos perceber que há dois tipos de entradas diferentes em periféricos diferentes que devem executar uma mesma ação no jogo.

A Godot oferece uma funcionalidade que pode ser utilizada para facilitar essa configuração, nas configurações de projetos podemos definir essas configurações de forma simples, diferentemente se formos definir essas configurações de forma manual. Basicamente a Godot oferece a opção de criar um label e nesse label definir teclas pré configuradas pela Godot, observe o exemplo abaixo para mais detalhes.

**label:** jump <br>
**ações**:
    1. Gamepad (Xbox A, Playstation X)
    2. Computador (W, Space)

Agora para que esse label seja utilizado basta informar no código fonte que se a label **jump** for precionada o player deve executar a ação de pular.
