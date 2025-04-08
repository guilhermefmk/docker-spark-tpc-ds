metricas_relevantes = [
    # Métricas de tempo de execução
    "elapsedTime",  # Tempo total de execução em ms
    "executorRunTime",  # Tempo total gasto pelos executores
    "executorCpuTime",  # Tempo de CPU utilizado pelos executores
    "jvmGCTime",  # Tempo gasto em coleta de lixo
    # Eficiência de recursos e gargalos
    "shuffleFetchWaitTime",  # Tempo esperando por dados de shuffle
    "shuffleWriteTime",  # Tempo gasto escrevendo dados de shuffle
    # Utilização de memória e spill
    "peakExecutionMemory",  # Pico de memória utilizada
    "diskBytesSpilled",  # Dados despejados em disco quando memória insuficiente
    "memoryBytesSpilled",  # Dados despejados em memória
    # Métricas de shuffle
    "shuffleTotalBytesRead",  # Bytes totais lidos durante shuffle
    "shuffleBytesWritten",  # Bytes escritos durante shuffle
    "shuffleRecordsRead",  # Registros lidos durante shuffle
    "shuffleRecordsWritten",  # Registros escritos durante shuffle
    # Métricas de entrada/saída
    "recordsRead",  # Registros lidos
    "bytesRead",  # Bytes lidos
    "recordsWritten",  # Registros escritos
    "bytesWritten",  # Bytes escritos
    # Paralelismo
    "numStages",  # Número de estágios
    "numTasks",  # Número de tarefas
    "avg_active_tasks",  # Média de tarefas ativas (paralelismo)
]
