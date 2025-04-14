# Escopo de Queries TPC-DS para TCC com SparkMeasure

Para um TCC focado em benchmarks com SparkMeasure, uma seleção estratégica de queries é essencial. Recomendo usar estas 10 queries TPC-DS que cobrem diferentes aspectos de processamento analítico:

## Queries Recomendadas e Justificativas

1. **Query 3** - Agregação com filtros de data
   - Justificativa: Avalia filtros seletivos e agregações simples, bom para testar otimizações de predicado

2. **Query 19** - Junção complexa de múltiplas tabelas
   - Justificativa: Teste robusto para otimização de ordenação de junções pelo CBO

3. **Query 27** - Agregação com múltiplos GROUP BY
   - Justificativa: Avalia operações de agregação complexas e otimizações de memória

4. **Query 42** - Query relativamente simples com esquema em estrela
   - Justificativa: Bom baseline para comparar com queries mais complexas

5. **Query 43** - Junções com subconsulta correlacionada
   - Justificativa: Testa otimizações de subconsultas e planos de execução

6. **Query 52** - Grande agregação com cláusulas HAVING
   - Justificativa: Alta demanda de shuffle, útil para testar gerenciamento de memória

7. **Query 55** - Junções complexas com subconsultas
   - Justificativa: Útil para demonstrar transformações de plano com CBO ativado

8. **Query 67** - Análise temporal com várias agregações
   - Justificativa: Testa particionamento e janelamento de dados

9. **Query 73** - Subconsultas complexas e várias junções
   - Justificativa: Alto potencial de otimização pelo CBO, ideal para pesquisa

10. **Query 98** - Grande agregação com expressões complexas
    - Justificativa: Testa tanto CPU quanto operações de shuffle/IO

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