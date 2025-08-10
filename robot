#include <stdio.h>
#include <stdlib.h>
#include <conio.h> // Para _kbhit() y _getch()
#include <time.h>

#define WIDTH 20
#define HEIGHT 1

int main() {
    int robot_pos = WIDTH / 2;
    int score = 0;
    int obstacle_pos = rand() % WIDTH;
    int piece_pos = rand() % WIDTH;
    int game_over = 0;

    srand(time(NULL));

    while (!game_over) {
        // Mostrar la línea
        for (int i = 0; i < WIDTH; i++) {
            if (i == robot_pos)
                printf("R");
            else if (i == obstacle_pos)
                printf("X");
            else if (i == piece_pos)
                printf("P");
            else
                printf("-");
        }
        printf("\nPuntuación: %d\n", score);

        // Entrada del usuario
        if (_kbhit()) {
            char ch = _getch();
            if (ch == 'a' && robot_pos > 0)
                robot_pos--;
            else if (ch == 'd' && robot_pos < WIDTH - 1)
                robot_pos++;
        }

        // Actualizar obstáculos y piezas
        // Aquí puedes moverlos o regenerarlos aleatoriamente
        // Para simplificar, los dejamos estáticos en este ejemplo

        // Comprobar colisiones
        if (robot_pos == obstacle_pos) {
            printf("¡Choque! Fin del juego.\n");
            game_over = 1;
        } else if (robot_pos == piece_pos) {
            score++;
            // Generar nueva pieza
            piece_pos = rand() % WIDTH;
        }

        // Pequeña pausa
        _sleep(200);
        system("cls"); // Para limpiar la pantalla en Windows
    }

    return 0;
}
