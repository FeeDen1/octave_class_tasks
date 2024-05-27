function plot_torus()
    % Define the parameter ranges for u and v
    u = linspace(0, 2 * pi, 100);
    v = linspace(0, 2 * pi, 100);
    [U, V] = meshgrid(u, v);

    % Define the parametric equations for the torus
    X = (3 + cos(V)) .* cos(U);
    Y = (3 + cos(V)) .* sin(U);
    Z = sin(V);

    % Create a 3D plot
    figure;
    surf(X, Y, Z, 'EdgeColor', 'none');
    colormap('parula'); % Change to 'parula' colormap for better color combination
    colorbar;

    % Set axis labels and title
    title('3D Parametric Plot of a Torus', 'FontSize', 15);
    xlabel('X axis', 'FontSize', 12);
    ylabel('Y axis', 'FontSize', 12);
    zlabel('Z axis', 'FontSize', 12);

    % Adjust view and lighting for better visualization
    view(3);
    lighting phong;
    camlight right;
    shading interp;
    end;

plot_torus()
