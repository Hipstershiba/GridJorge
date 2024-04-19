class Xadrez {
    PGraphics monitor;
    float origem_x,
          origem_y,
          largura,
          altura,
          numero_de_colunas,
          numero_de_linhas,
          contador_de_quadros_da_animacao,
          contador_de_iteracoes,
          lado_do_quadrado,
          raio,
          velocidade_da_animacao,
          correcao_de_x,
          correcao_de_y;

    Xadrez(float _origem_x, float _origem_y, float _largura, float _altura, float _lado_do_quadrado) {
        origem_x = _origem_x;
        origem_y = _origem_y;
        largura = _largura;
        altura = _altura;
        lado_do_quadrado = _lado_do_quadrado;
        numero_de_colunas = largura / lado_do_quadrado;
        numero_de_linhas = altura / lado_do_quadrado + 1;
        raio = sqrt(pow(lado_do_quadrado, 2) / 2);
        velocidade_da_animacao = 2;
        contador_de_quadros_da_animacao = 0;
        contador_de_iteracoes = 0;
        correcao_de_x = 0;
        correcao_de_y = 0;

        monitor = createGraphics(int(largura), int(altura));
    }

    void altera_iteracao_inicial(float iteracao) {
        contador_de_iteracoes = iteracao;
    }

    float inverte_rotacao() {
        if (contador_de_iteracoes % 6 == 0) {
            return 1;
        } else if (contador_de_iteracoes % 6 == 1) {
            return -1;
        } else if (contador_de_iteracoes % 6 == 2) {
            return -1;
        } else {
            return 1;
        }
    }
    void altera_correcao_de_x(float deslocamento) {
        correcao_de_x = deslocamento;
    }

    void altera_correcao_de_y(float deslocamento) {
        correcao_de_y = deslocamento;
    }

    void desenha_xadrez() {
        monitor.beginDraw();
        monitor.noStroke();
        monitor.fill(atualiza_cor_do_fundo(contador_de_iteracoes));
        monitor.rect(0, 0, largura, altura);
        monitor.fill(atualiza_cor_do_quadrado(contador_de_iteracoes));
        for(int coluna = 0; coluna < numero_de_colunas; coluna++) {
            for(int linha = 0; linha < numero_de_linhas; linha++) {
            desenha_quadrado(coordenada_x_do_quadrado(coluna), coordenada_y_do_quadrado(linha), deslocamento_de_x(linha, paridade_da_iteracao(contador_de_iteracoes)));
            }
        }
        monitor.endDraw();
    }

    void display_xadrez() {
        image(monitor, origem_x, origem_y);
    }

    float coordenada_x_do_quadrado(int coluna) {
        return (coluna * (lado_do_quadrado * 2)) + correcao_de_x;
        // return (coluna * (lado_do_quadrado * 2)) + origem_x;
    }

    float coordenada_y_do_quadrado(int linha) {
        return (linha * lado_do_quadrado) + correcao_de_y;
        // return (linha * lado_do_quadrado) + origem_y;
    }

    float deslocamento_de_x(int linha, String paridade_da_iteracao) {
        if ((linha % 2 == 0 && paridade_da_iteracao == "par") || (linha % 2 != 0 && paridade_da_iteracao == "impar")) {
            return 0;
        } else {
            return lado_do_quadrado;
        }
    }

    void desenha_quadrado(float x, float y, float deslocamento) {
        int angulo = 45;
        monitor.beginShape();
        for (int vertice = 0; vertice < 4; vertice++) {
            monitor.vertex(x + deslocamento + raio * cos(radians(angulo + variacao_angular())), y + raio * sin(radians(angulo + variacao_angular())));
            angulo += 90;
        }
        monitor.endShape(CLOSE);
    }

    float variacao_angular() {
        // return 90 * pow(sin(radians(contador_de_quadros_da_animacao / 2)), 2);
        return (90 * pow(sin(radians(contador_de_quadros_da_animacao / 2)), 2)) * inverte_rotacao();
    }

    void atualiza_contador_de_quadros_da_animacao(float velocidade_da_animacao) {
        contador_de_quadros_da_animacao += velocidade_da_animacao;
        if (contador_de_quadros_da_animacao > 180) {
            contador_de_quadros_da_animacao = 0;
        }
    }

    String paridade_da_iteracao(float contador_de_iteracoes) {
        if (contador_de_iteracoes % 2 == 0) {
            return "par";
        } else {
            return "impar";
        }
    }

    int atualiza_cor_do_fundo(float iteracao) {
        if (iteracao % 2 == 0) {
            return 255;
        } else {
            return 30;
        }
    }

    int atualiza_cor_do_quadrado(float iteracao) {
        if (iteracao % 2 == 0) {
            return 30;
        } else {
            return 255;
        }
    }
}