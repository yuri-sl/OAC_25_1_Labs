import matplotlib.pyplot as plt
import numpy as np

# Valores de n de 10 a 100 (de 10 em 10)
n_values = np.arange(10, 110, 10)

# Equações baseadas nos coeficientes medidos
# Melhor caso: T(n) = 4.6 * (n - 1)
to = 0.23 * (n_values - 1)

# Pior caso: T(n) = 17.56 * n * (n - 1)
ti = 0.878* n_values * (n_values - 1)

# Plotando os gráficos
plt.figure(figsize=(10, 6))
plt.plot(n_values, to, label='Melhor Caso (to)', marker='o', color='blue')
plt.plot(n_values, ti, label='Pior Caso (ti)', marker='s', color='red')

# Estética do gráfico
plt.title('Tempo de Execução vs Tamanho do Vetor (n)')
plt.xlabel('n (Número de elementos do vetor)')
plt.ylabel('Tempo de execução (us)')
plt.grid(True)
plt.legend()
plt.tight_layout()

# Mostrar o gráfico
plt.show()
