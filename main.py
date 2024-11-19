import schedule
import time
from data_export import exportar_dados

# Agendamento da tarefa de exportação
schedule.every(0.5).minutes.do(exportar_dados)

# Função que mantém o agendamento rodando
def agendar_tarefas():
    while True:
        schedule.run_pending()
        time.sleep(0.5)

if __name__ == "__main__":
    agendar_tarefas()
