%Limpieza de pantalla
clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%% TIEMPO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tf=105;             % Tiempo de simulación en segundos (s)
ts=0.1;            % Tiempo de muestreo en segundos (s)
t=0:ts:tf;         % Vector de tiempo
N= length(t);      % Muestras


%%%%%%%%%%%%%%%%%%% CONDICIONES INICIALES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inicializamos las variables que se van a emplear
x1= zeros (1, N+1);       % Posición (X) en el centro del eje que une las ruedas en metros (m)
y1= zeros (1, N+1);       % Posición (Y) en el centro del eje que une las ruedas en metros (m)
phi= zeros (1, N+1);      % Orientación del robot en radiaanes (rad)

%Damos valores a nuestro punto inicial de posición y orientación
x1(1)=-27.5;  %Posición inicial eje x
y1(1)=-12.5;  %Posición inicial eje y
phi(1)=0; %Orientación inicial del robot 

%%%%%%%%%%%%%%%%%%%%% PUNTO DE CONTROL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inicializamos el punto de control 
hx= zeros (1, N+1);       % Posición en el eje (X) del punto de control en metros (m)
hy= zeros (1, N+1);       % Posición en el eje (Y) del punto de control en metros (m)

%Igualamos el punto de control con las proyecciones X1 y Y1 por su
%coincidencia
hx(1)= x1(1);       % Posición del punto de control en el eje (X) metros (m)
hy(1)= y1(1);       % Posición del punto de control en el eje (Y) metros (m)

%%%%%%%%%%%%%%%%%%%%%% VELOCIDADES DE REFERENCIA %%%%%%%%%%%%%%%%%%%%%%%%%%
%Tramo 1 (v=0 m/s, w=pi/6 rad/s) Giro 1
%Tramo 2 (v=3 m/s, w=0 rad/s) Linea 1
%Tramo 3 (v=0 m/s, w=pi/6 rad/s) Giro 2
%Tramo 4 (v=4.5 m/s, w=0 rad/s) Linea 2
%Tramo 5 (v=0 m/s, w=0 rad/s) Giro 3
%Tramo 6 (v=2.4 m/s, w=0 rad/s) Linea 3
%Tramo 7 (v=0 m/s, w=pi/6 rad/s) Giro 4
%Tramo 8 (v=3.8 m/s, w=0 rad/s) Linea 4
%Tramo 9 (v=0 m/s, w=pi/6 rad/s) Giro 5
%Tramo 10 (v=3 m/s, w=0 rad/s) Linea 5
%Tramo 11 (v=0 m/s, w=pi/6 rad/s) Giro 6
%Tramo 12 (v=4.5 m/s, w=0 rad/s) Linea 6
%Tramo 13 (v=0 m/s, w=0 rad/s) Giro 7
%Tramo 14 (v=2.4 m/s, w=0 rad/s) Linea 7
%Tramo 15 (v=0 m/s, w=pi/6 rad/s) Giro 8 
%Tramo 16 (v=0 m/s, w=0 rad/s) Linea 8
%Tramo 17 (v=0 m/s, w=0 rad/s) Giro 9
%Tramo 18 (v=0 m/s, w=0 rad/s) Linea 9
%Tramo 19 (v=0 m/s, w=0 rad/s) Giro 10
%Tramo 20 (v=0 m/s, w=0 rad/s) Linea 10
%Tramo 21 (v=0 m/s, w=0 rad/s) Giro 11
%Tramo 22 (v=0 m/s, w=0 rad/s) Linea 11
%Tramo 23 (v=0 m/s, w=0 rad/s) Giro 12
%Tramo 24 (v=0 m/s, w=0 rad/s) Linea 12
%Tramo 25 (v=0 m/s, w=0 rad/s) Giro 13
    %Giro 1           %Linea 1    %Giro 2           %Linea 2        %Giro 3         %%%Linea 3        %Giro 4          %Linea 4         %Giro 5              %Linea 5       %Giro 6               %Linea 6        %Giro 7           %Linea 7        %Giro 8           %Linea 8         %Giro 9              %Linea 9       %Giro 10              %Linea 10       %Giro 11          %Linea 11       %Giro 12           %Linea 12         %Giro 13            %Linea 13      %Giro 14              %Linea 14       %Giro 15           %Linea 15      %Giro 16           %Linea 16       %Giro 17             %Linea 17        %Giro 18           %Linea 18       %Giro 19             %Linea 19       %Giro 20           %Linea 20         %Giro 21             %Linea 21         %Giro 22              %Linea 22         %Giro 23            %Linea 23     %Giro 24                %Linea 24      %Giro 25           %Linea 25       %Giro 26              %Linea 26     %Giro 27                 %Linea 27      %Giro 28              %Linea 28      %Giro 29          %Linea 29       %Giro 30            %Linea 30       %Giro 31        %Linea 31       %Giro 32         %Linea 32         %Giro 33           %Linea 33       %Giro 34          %Linea 34         %Giro 35          %Linea 35         %Giro 36            %Linea 36        %Giro 37        %Linea 37         %Giro 38         %Linea 38    %Giro 39          %Linea 39    %Giro 40          %Linea 40       %Giro 41             %Linea 41     %Giro 42           %Linea 42      %Giro 43          %Linea 43      %Giro 44           %Linea 44       %Giro 45        %Linea 45       %Giro 46             %Linea 46       %Giro 47        %Linea 47         %Giro 48         %Linea 48       %Giro 49          %Linea 49          %Giro 50           %Linea 50        %Giro 51            %Linea 51         %Giro 52        %Linea 52         %Giro 53                      
v = [0*ones(1,10)    3*ones(1,10) 0*ones(1,10)      5*ones(1,10)    0*ones(1,10)    2.4*ones(1,10)  0*ones(1,10)       5.2*ones(1,10)   0*ones(1,10)         4*ones(1,10)   0*ones(1,10)          2*ones(1,10)    0*ones(1,10)      4.8*ones(1,10)  0*ones(1,10)      5*ones(1,10)     0*ones(1,10)         4*ones(1,10)   0*ones(1,10)          2*ones(1,10)    0*ones(1,10)      6*ones(1,10)    0*ones(1,10)       2.4*ones(1,10)    0*ones(1,10)        1.2*ones(1,10) 0*ones(1,10)          1*ones(1,10)    0*ones(1,10)       .6*ones(1,10)  0*ones(1,10)       4*ones(1,10)    0*ones(1,10)         6*ones(1,10)     0*ones(1,10)       1.5*ones(1,10)  0*ones(1,10)         3.8*ones(1,10)  0*ones(1,10)        4.4*ones(1,10)   0*ones(1,10)         4.5*ones(1,10)    0*ones(1,10)          4*ones(1,10)      0*ones(1,10)        5*ones(1,10)  0*ones(1,10)            3.4*ones(1,10) 0*ones(1,10)       8*ones(1,10)    0*ones(1,10)          4*ones(1,10)  0*ones(1,10)             4*ones(1,10)   0*ones(1,10)          3.6*ones(1,10) 0*ones(1,10)      2.2*ones(1,10)  0*ones(1,10)        6.2*ones(1,10)  0*ones(1,10)    3*ones(1,10)    0*ones(1,10)     1*ones(1,10)      0*ones(1,10)       1*ones(1,10)    0*ones(1,10)      5.8*ones(1,10)    0*ones(1,10)      2*ones(1,10)      0*ones(1,10)        4*ones(1,10)     0*ones(1,10)    4*ones(1,10)      0*ones(1,10)     1*ones(1,10) 0*ones(1,10)      6*ones(1,10) 0*ones(1,10)      5*ones(1,10)    0*ones(1,10)         5*ones(1,10)  0*ones(1,10)       8*ones(1,10)   0*ones(1,10)      .5*ones(1,10)  0*ones(1,10)       3*ones(1,10)    0*ones(1,10)    4.5*ones(1,10)  0*ones(1,10)         8*ones(1,10)    0*ones(1,10)    2*ones(1,10)      0*ones(1,10)     2*ones(1,10)    0*ones(1,10)      8*ones(1,10)       0*ones(1,10)       5*ones(1,10)     0*ones(1,10)        4*ones(1,10)      0*ones(1,10)    3.6*ones(1,10)    0*ones(1,10)        0*ones(1,21)]; % Velocidad lineal de referencia (m/s)
w = [pi/6*ones(1,10) 0*ones(1,10) pi/7*ones(1,10)   0*ones(1,10)    0*ones(1,10)    0*ones(1,10)    pi/12*ones(1,10)   0*ones(1,10)     -17/32*pi*ones(1,10) 0*ones(1,10)   -pi/44*ones(1,10)     0*ones(1,10)    -pi/38*ones(1,10) 0*ones(1,10)    pi/12*ones(1,10)  0*ones(1,10)     3.5/32*pi*ones(1,10) 0*ones(1,10)   2.8/6*pi*ones(1,10)   0*ones(1,10)    1.5/8*ones(1,10)  0*ones(1,10)    -5/6*pi*ones(1,10) 0*ones(1,10)      3/6*pi*ones(1,10)   0*ones(1,10)   -2/8*pi*ones(1,10)    0*ones(1,10)    4/10*pi*ones(1,10) 0*ones(1,10)   4/25*pi*ones(1,10) 0*ones(1,10)    -18/20*pi*ones(1,10) 0*ones(1,10)     1/12*pi*ones(1,10) 0*ones(1,10)    4.6/8*pi*ones(1,10)  0*ones(1,10)    2/40*pi*ones(1,10)  0*ones(1,10)     3/40*pi*ones(1,10)   0*ones(1,10)      1/30*pi*ones(1,10)    0*ones(1,10)      2/30*pi*ones(1,10)  0*ones(1,10)  -14/20*pi*ones(1,10)    0*ones(1,10)   5/24*pi*ones(1,10) 0*ones(1,10)    8/40*pi*ones(1,10)    0*ones(1,10)  -16/20*pi*ones(1,10)     0*ones(1,10)   2/80*pi*ones(1,10)    0*ones(1,10)   pi/20*ones(1,10)  0*ones(1,10)    -1/3*pi*ones(1,10)  0*ones(1,10)    pi/6*ones(1,10) 0*ones(1,10)    pi/10*ones(1,10) 0*ones(1,10)      -pi/16*ones(1,10)  0*ones(1,10)    1/7*pi*ones(1,10) 0*ones(1,10)      -pi/7*ones(1,10)  0*ones(1,10)      -pi/10*ones(1,10)   0*ones(1,10)     0*ones(1,10)    0*ones(1,10)      pi/6*ones(1,10)  0*ones(1,10) pi/20*ones(1,10)   0*ones(1,10) pi/16*ones(1,10)  0*ones(1,10)    -5*pi/6*ones(1,10)  0*ones(1,10)  pi/25*ones(1,10)   0*ones(1,10)   pi/4*ones(1,10)   0*ones(1,10)   pi/12*ones(1,10)   0*ones(1,10)    pi/4*ones(1,10) 0*ones(1,10)   -19/32*pi*ones(1,10)  0*ones(1,10)    pi/4*ones(1,10) 0*ones(1,10)      pi/3*ones(1,10)  0*ones(1,10)    -pi/60*ones(1,10) 0*ones(1,10)       -3/6*pi*ones(1,10) 0*ones(1,10)     -2/16*pi*ones(1,10) 0*ones(1,10)      pi/4*ones(1,10) 0*ones(1,10)      11/6*pi*ones(1,10)  0*ones(1,21)]; % Velocidad angular de referencia (rad/s)


%%%%%%%%%%%%%%%%%%%%%%%%% BUCLE DE SIMULACION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for k=1:N 
    
    %Aplico la integral a la velocidad angular para obtener el angulo "phi" de la orientación
    phi(k+1)=phi(k)+w(k)*ts; % Integral numérica (método de Euler)
           
   %%%%%%%%%%%%%%%%%%%%% MODELO CINEMATICO %%%%%%%%%%%%%%%%%%%%%%%%%
    
    xp1=v(k)*cos(phi(k)); 
    yp1=v(k)*sin(phi(k));
 
    %Aplico la integral a la velocidad lineal para obtener las cordenadas
    %"x1" y "y1" de la posición
    x1(k+1)=x1(k)+ ts*xp1; % Integral numérica (método de Euler)
    y1(k+1)=y1(k)+ ts*yp1; % Integral numérica (método de Euler)

    % Posicion del robot con respecto al punto de control
    hx(k+1)=x1(k+1); 
    hy(k+1)=y1(k+1);

end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SIMULACION VIRTUAL 3D %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a) Configuracion de escena

scene=figure;  % Crear figura (Escena)
set(scene,'Color','white'); % Color del fondo de la escena
set(gca,'FontWeight','bold') ;% Negrilla en los ejes y etiquetas
sizeScreen=get(0,'ScreenSize'); % Retorna el tamaño de la pantalla del computador
set(scene,'position',sizeScreen); % Configurar tamaño de la figura
camlight('headlight'); % Luz para la escena
axis equal; % Establece la relación de aspecto para que las unidades de datos sean las mismas en todas las direcciones.
grid on; % Mostrar líneas de cuadrícula en los ejes
box on; % Mostrar contorno de ejes
xlabel('x(m)'); ylabel('y(m)'); zlabel('z(m)'); % Etiqueta de los ejes

view([-0.1 35]); % Orientacion de la figura
axis([-30 30 -25 20 0 1]); % Ingresar limites minimos y maximos en los ejes x y z [minX maxX minY maxY minZ maxZ]

% b) Graficar robots en la posicion inicial
scale = 4;
MobileRobot;
H1=MobilePlot(x1(1),y1(1),phi(1),scale);hold on;

% c) Graficar Trayectorias
H2=plot3(hx(1),hy(1),0,'r','lineWidth',2);

% d) Bucle de simulacion de movimiento del robot

step=10; % pasos para simulacion

for k=1:step:N

    delete(H1);    
    delete(H2);
    
    H1=MobilePlot(x1(k),y1(k),phi(k),scale);
    H2=plot3(hx(1:k),hy(1:k),zeros(1,k),'r','lineWidth',2);
    
    pause(ts);

end

