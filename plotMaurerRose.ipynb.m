function plotMaurerRose(n, d, points)
  % Функция для построения кривой Моритца (Maurer Rose)
  % n - параметр n
  % d - параметр d
  % points - количество точек для построения

  % Генерация углов в градусах
  theta = linspace(0, 360, points);

  % Преобразование градусов в радианы
  k = deg2rad(theta);

  % Вычисление координат
  r = sin(n * k);
  x = r .* cos(k * d);
  y = r .* sin(k * d);

  % Построение графика
  figure;
  plot(x, y, 'b', 'LineWidth', 0.75);
  title(['Maurer Rose (Maurer Curve) with n=', num2str(n), ' and d=', num2str(d)]);
  xlabel('x');
  ylabel('y');
  axis equal;
  grid on;
end

% Пример вызова функции
plotMaurerRose(15, 37, 3600);
