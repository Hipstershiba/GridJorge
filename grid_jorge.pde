Xadrez monitor_1;
Xadrez monitor_2;
Xadrez monitor_3;
Xadrez monitor_4;

// float numero_de_colunas,
//       numero_de_linhas,
//       contador_de_quadros_da_animacao,
//       contador_de_iteracoes,
//       lado_do_quadrado,
//       raio,
//       velocidade_da_animacao;

void setup() {
  fullScreen();  
  noStroke();
  // lado_do_quadrado = 50;
  // numero_de_colunas = width / (lado_do_quadrado * 2);
  // numero_de_linhas = numero_de_colunas;
  // raio = sqrt(pow(lado_do_quadrado, 2) / 2);
  // velocidade_da_animacao = 2;
  // contador_de_quadros_da_animacao = 0;
  // contador_de_iteracoes = 0;
  monitor_1 = new Xadrez(481, 0, 400, 640, 100);
  monitor_1.altera_iteracao_inicial(0);

  monitor_2 = new Xadrez(928, 66, 640, 400, 100);
  monitor_2.altera_iteracao_inicial(2);
  monitor_2.altera_correcao_de_x(-81);

  monitor_3 = new Xadrez(351, 572, 640, 360, 100);
  monitor_3.altera_iteracao_inicial(2);
  monitor_3.altera_correcao_de_x(-70);
  monitor_3.altera_correcao_de_y(28);

  monitor_4 = new Xadrez(1047, 440, 400, 640, 100);
  monitor_4.altera_iteracao_inicial(0);
  monitor_4.altera_correcao_de_y(26);
}

void draw(){
  mapMonitor();
  // background(atualiza_cor_do_fundo(contador_de_iteracoes));
  // fill(atualiza_cor_do_quadrado(contador_de_iteracoes));

  //monitor_1
  monitor_1.desenha_xadrez();
  monitor_1.display_xadrez();
  monitor_1.atualiza_contador_de_quadros_da_animacao(monitor_1.velocidade_da_animacao);

  if(monitor_1.variacao_angular() % 90 == 0 && monitor_1.variacao_angular() != 0){
    monitor_1.contador_de_iteracoes++;
  }

  if(monitor_1.contador_de_iteracoes == 0){
    // noLoop();
  }

  // monitor_2
  monitor_2.desenha_xadrez();
  monitor_2.display_xadrez();
  monitor_2.atualiza_contador_de_quadros_da_animacao(monitor_2.velocidade_da_animacao);

  if(monitor_2.variacao_angular() % 90 == 0 && monitor_2.variacao_angular() != 0){
    monitor_2.contador_de_iteracoes++;
  }

  if(monitor_2.contador_de_iteracoes == 4){
    // noLoop();
  }

  // monitor_3
  monitor_3.desenha_xadrez();
  monitor_3.display_xadrez();
  monitor_3.atualiza_contador_de_quadros_da_animacao(monitor_3.velocidade_da_animacao);

  if(monitor_3.variacao_angular() % 90 == 0 && monitor_3.variacao_angular() != 0){
    monitor_3.contador_de_iteracoes++;
  }

  if(monitor_3.contador_de_iteracoes == 4){
    // noLoop();
  }

  // monitor_4
  monitor_4.desenha_xadrez();
  monitor_4.display_xadrez();
  monitor_4.atualiza_contador_de_quadros_da_animacao(monitor_4.velocidade_da_animacao);

  if(monitor_4.variacao_angular() % 90 == 0 && monitor_4.variacao_angular() != 0){
    monitor_4.contador_de_iteracoes++;
  }

  if(monitor_4.contador_de_iteracoes == 4){
    // noLoop();
  }
}

// float correcao_de_posicionamento() {
//   return (lado_do_quadrado / 2) - (width / 2);
// }

// void desenha_xadrez() {
//   push();
//   fill(atualiza_cor_do_quadrado(contador_de_iteracoes));
//   for(int coluna = 0; coluna < numero_de_colunas; coluna++) {
//     for(int linha = 0; linha < numero_de_linhas; linha++) {
//       desenha_quadrado(coordenada_x_do_quadrado(coluna), coordenada_y_do_quadrado(linha), deslocamento_de_x(linha, paridade_da_iteracao(contador_de_iteracoes)));
//     }
//   }
//   pop();
// }

// float coordenada_x_do_quadrado(int coluna) {
//   return (coluna * (lado_do_quadrado * 2)) + correcao_de_posicionamento();
// }

// float coordenada_y_do_quadrado(int linha) {
//   return linha * lado_do_quadrado;
// }

// float deslocamento_de_x(int linha, String paridade_da_iteracao) {
//   if ((linha % 2 == 0 && paridade_da_iteracao == "par") || (linha % 2 != 0 && paridade_da_iteracao == "impar")) {
//     return 0;
//   } else {
//     return lado_do_quadrado;
//   }
// }

// void desenha_quadrado(float x, float y, float deslocamento) {
//   int angulo = 45;
//   beginShape();
//   for (int vertice = 0; vertice < 4; vertice++) {
//     vertex(x + deslocamento + raio * cos(radians(angulo + variacao_angular())), y + raio * sin(radians(angulo + variacao_angular())));
//     angulo += 90;
//   }
//   endShape(CLOSE);
// }

// float variacao_angular() {
//   return 90 * pow(sin(radians(contador_de_quadros_da_animacao / 2)), 2);
// }

// void atualiza_contador_de_quadros_da_animacao(float velocidade_da_animacao) {
//   contador_de_quadros_da_animacao += velocidade_da_animacao;
//   if (contador_de_quadros_da_animacao > 180) {
//     contador_de_quadros_da_animacao = 0;
//   }
// }

// String paridade_da_iteracao(float contador_de_iteracoes) {
//   if (contador_de_iteracoes % 2 == 0) {
//     return "par";
//   } else {
//     return "impar";
//   }
// }

// int atualiza_cor_do_fundo(float iteracao) {
//   if (iteracao % 2 == 0) {
//     return 255;
//   } else {
//     return 30;
//   }
// }

// int atualiza_cor_do_quadrado(float iteracao) {
//   if (iteracao % 2 == 0) {
//     return 30;
//   } else {
//     return 255;
//   }
// }

// mapa dos monitores
void mapMonitor(){
  push();  
  noStroke();
  fill(255,209,0);
  
  // SUPERIOR ESQUERDO
  int mx1 = round(481);
  int my1 = round(0);
  int mw1 = round(400);
  int mh1 = round(640);
  rect(mx1,my1,mw1,mh1);

  // SUPERIOR DIREITO
  int mx2 = round(928);
  int my2 = round(66);
  int mw2 = round(640);
  int mh2 = round(400);
  rect(mx2,my2,mw2,mh2);
  

  // INFERIOR ESQUERDO 
  int mx3 = round(351);
  int my3 = round(572);
  int mw3 = round(640);
  int mh3 = round(360);
  rect(mx3,my3,mw3,mh3); 
  
  fill(255,0,0);
  // INFERIOR DIREITO
  int mx4 = round(1047);
  int my4 = round(440);
  int mw4 = round(400);
  int mh4 = round(640);
  rect(mx4,my4,mw4,mh4);
  
  fill(255,209,0); // cor dos monitores 
  int mbx1 = round(879);
  int mby1 = round(66);
  int mbw1 = round(60);
  int mbh1 = round(400);
  rect(mbx1,mby1,mbw1,mbh1); // borda de cima
  
  int mbx2 = round(989);
  int mby2 = round(572);
  int mbw2 = round(60);
  int mbh2 = round(360);   
  rect(mbx2,mby2,mbw2,mbh2); // borda de baixo
  
  pop();
}