function newton_pool(f,f_prime)
    % Установка размера изображения
    img_size = 300;

    % Границы, в которых будет строиться фрактал
    x_min = -2;
    x_max = 2;
    y_min = -2;
    y_max = 2;

    % Количество итераций
    max_iter = 20;

    % Создание изображения
    img = zeros(img_size, img_size, 3);
    % Начальные приближения корней
    roots = [1, -0.5 + 0.866j, -0.5 - 0.866j];

    % Цвета для каждого корня (новые цвета)
    colors = [0.2, 0.6, 0.8; 0.4, 0.8, 0.4; 0.8, 0.4, 0.8];

    % Шаг по оси x и y
    step_x = (x_max - x_min) / img_size;
    step_y = (y_max - y_min) / img_size;

    % Цикл по пикселям изображения
    for i = 1:img_size
        for j = 1:img_size
            x = x_min + (i - 1) * step_x;
            y = y_min + (j - 1) * step_y;
            z = x + y * 1j;

            % Итерация метода Ньютона
            for k = 1:max_iter
                z = z - f(z) / f_prime(z);

                % Проверка на сходимость к корню
                for l = 1:length(roots)
                    if abs(z - roots(l)) < 0.01
                        img(j, i, :) = colors(l, :);
                        break;
                    end
                end
            end
        end
    end

    % Отображение изображения
    imshow(img);
end

f = @(z) z^3 - 1;
f_prime = @(z) 3*z^2;

% Вызов функции для создания бассейна Ньютона
newton_pool(f, f_prime);
