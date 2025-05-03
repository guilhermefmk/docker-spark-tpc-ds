# Escopo de Queries TPC-DS para TCC com SparkMeasure

Para um TCC focado em benchmarks com SparkMeasure, uma seleção estratégica de queries é essencial. Recomendo usar estas 10 queries TPC-DS que cobrem diferentes aspectos de processamento analítico:

## Queries Recomendadas e Justificativas

\subsubsection{Detalhamento dos Padrões de Consulta}

As 10 queries TPC-DS selecionadas representam diferentes perfis de utilização de recursos computacionais:

\begin{enumerate}
    \item \textbf{Query 3} \\ 
    \textit{Padrão}: Agregação com filtros complexos. \\ 
    \textit{Características}: Uso moderado de CPU com operações reduzidas de shuffle e uso eficiente de memória. \\ 
    \textit{Justificativa}: Selecionada por apresentar equilíbrio entre processamento e I/O, ideal para avaliar técnicas de filtragem de dados sem excessivo consumo de recursos.

    \item \textbf{Query 19} \\ 
    \textit{Padrão}: Análise de desempenho de vendas por marca. \\ 
    \textit{Características}: Uso moderado de CPU com volume considerável de shuffle e utilização significativa de memória. \\ 
    \textit{Justificativa}: Representa consultas com múltiplas junções que se beneficiam da reordenação, com consumo de memória proporcional à complexidade das junções.

    \item \textbf{Query 27} \\ 
    \textit{Padrão}: Segmentação de clientes com filtragem demográfica. \\ 
    \textit{Características}: Alto throughput com operações substanciais de shuffle e uso considerável de CPU. \\ 
    \textit{Justificativa}: Combina alto throughput com operações substanciais de shuffle, ideal para avaliação do particionamento adaptativo em dados segmentados.

    \item \textbf{Query 42} \\ 
    \textit{Padrão}: Análise de vendas por categoria e ano. \\ 
    \textit{Características}: Uso mínimo de CPU, baixo volume de shuffle e consumo reduzido de memória. \\ 
    \textit{Justificativa}: Representa o caso base ideal com excelente eficiência de recursos, servindo como baseline para comparação com queries mais complexas.

    \item \textbf{Query 43} \\ 
    \textit{Padrão}: Análise de impacto promocional nas vendas. \\ 
    \textit{Características}: Baixo consumo de memória e throughput reduzido com processamento moderado. \\ 
    \textit{Justificativa}: Demonstra comportamento distinto de I/O, com estrutura de filtragem complexa que se beneficia de otimizações de predicados.

    \item \textbf{Query 52} \\ 
    \textit{Padrão}: Análise de comportamento de devolução de produtos. \\ 
    \textit{Características}: Uso moderado de CPU com memória significativa e bom throughput de dados. \\ 
    \textit{Justificativa}: Representa consultas com operações de agregação após junções, apresentando uso considerável de memória apesar do processamento moderado.

    \item \textbf{Query 55} \\ 
    \textit{Padrão}: Análise de vendas por região geográfica. \\ 
    \textit{Características}: Perfil similar à Q52, com bom throughput e uso considerável de memória. \\ 
    \textit{Justificativa}: Avalia otimizações em consultas com distribuição potencialmente desigual de dados entre partições geográficas.

    \item \textbf{Query 67} \\ 
    \textit{Padrão}: Análise de tendências com funções de janelamento. \\ 
    \textit{Características}: Consumo extremamente elevado de CPU, operações massivas de shuffle e alto uso de memória, com throughput muito reduzido. \\ 
    \textit{Justificativa}: Representa o caso extremo de processamento analítico com operações de janelamento, permitindo avaliar o impacto das otimizações em cenários críticos de alta complexidade.

    \item \textbf{Query 73} \\ 
    \textit{Padrão}: Análise de padrões de compra por cliente. \\ 
    \textit{Características}: Alto consumo de memória e CPU com operações significativas de shuffle e throughput reduzido. \\ 
    \textit{Justificativa}: Selecionada pelo padrão distintivo entre dados lidos e escritos durante shuffle, ideal para testar otimizações em dimensões geográficas e temporais.

    \item \textbf{Query 98} \\ 
    \textit{Padrão}: Análise de receita por categoria de produto. \\ 
    \textit{Características}: O maior consumo de memória entre todas as queries com alta utilização de CPU e operações consideráveis de shuffle. \\ 
    \textit{Justificativa}: Representa consultas que combinam operações de agregação e janelamento com demanda extrema de memória, críticas para avaliação de técnicas de gerenciamento de recursos.
\end{enumerate}

Este conjunto diversificado de queries foi selecionado para representar diferentes perfis de utilização de recursos computacionais, desde consultas leves e eficientes (Q42) até operações intensivas com funções analíticas avançadas (Q67, Q98), permitindo uma avaliação abrangente das técnicas de otimização do Spark SQL em cenários variados.

## Benefícios desta seleção:

- **Cobertura de padrões**: Varia entre junções complexas, agregações e subconsultas
- **Diversidade de recursos**: Algumas queries são limitadas por CPU, outras por I/O ou memória
- **Potencial de otimização**: Todas têm potencial para mostrar diferenças significativas com e sem CBO
- **Complexidade variada**: Inclui queries simples e complexas para análise comparativa
- **Relevância acadêmica**: Frequentemente citadas em pesquisas sobre otimização de consultas

Esta seleção permitirá uma análise abrangente sem a sobrecarga de executar o benchmark completo.



**Configurações de otimizações personalizadas testadas:**
1. [Descreva sua configuração personalizada 1]
2. [Descreva sua configuração personalizada 2]
3. [...]

q3,q19,q27,q42,q43,q52,q55,q67,q73,q98