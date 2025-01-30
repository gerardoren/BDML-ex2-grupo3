# Write here a short conclusion of the exercise. That is, answer in less than 
Durante la clase, aprendimos que es fundamental identificar aquellas observaciones que tienen un mayor impacto en las estimaciones de los coeficientes, utilizando la métrica de leverage. Las observaciones con altos niveles de leverage (hi) pueden ser potencialmente influyentes en el modelo.

También se graficaron tanto el leverage como los residuos de las observaciones. El leverage mide cuán influyente es cada observación en los coeficientes del modelo de regresión, mientras que los residuos reflejan las diferencias entre los valores observados y los predichos por el modelo. Al observar los gráficos, notamos que algunas observaciones tienen valores de leverage considerablemente más altos que el resto, lo que sugiere que estas podrían tener un impacto significativo en el ajuste del modelo. Al comparar leverage con los residuos, se destacan ciertas observaciones, lo que indica que podrían ser puntos influyentes. 

Finalmente, calculamos el modelo2 después de eliminar las observaciones con un leverage superior a 3.

Se vieron 3 estrategias para la detección de valores atípicos en variables.
Strategy 1: Tukey’s Fences
Strategy 2: Quantiles
Strategy 3: Standard Deviation

Por último se vio el residuo estudentizado es una medida que se utiliza para clasificar las observaciones atípicas en modelos lineales y se corrio el modelo 3. La eliminación de estas observaciones mejora de alguna manera el rendimiento del modelo porque nos acercamos más a la predicción
