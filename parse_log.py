import re
from datetime import datetime

# Ваш лог
log_data = """
2023-09-17 19:47:56 | /dev/pts/0 | '/home/user/Documents/pp' | 0 | 'cd ../pp/'
2023-09-17 19:48:03 | /dev/pts/0 | '/home/user/Documents/pp' | 0 | 'cd ../pp/'
2023-09-17 19:48:05 | /dev/pts/0 | '/home/user/Documents/pp' | 0 | 'cd ../pp/'
2023-09-17 19:49:33 | /dev/pts/3 | '/home/user/dot-files-2024' | 0 | 'git status '
2023-09-17 19:49:40 | /dev/pts/3 | '/home/user/dot-files-2024' | 0 | 'git add -u'
2023-09-17 19:49:45 | /dev/pts/3 | '/home/user/dot-files-2024' | 5 | 'gitk --all'
"""

# Создаем регулярное выражение для парсинга
pattern = re.compile(r'(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}) \| (.+?) \| (.+?) \| (\d+) \| \'(.+?)\'')

# Создаем функцию для разбора строки лога
def parse_log_line(line):
    match = pattern.match(line)
    if match:
        timestamp_str, terminal, directory, exit_code_str, command = match.groups()
        timestamp = datetime.strptime(timestamp_str, '%Y-%m-%d %H:%M:%S')
        exit_code = int(exit_code_str)
        return {
            'timestamp': timestamp,
            'terminal': terminal.strip(),
            'directory': directory.strip(),
            'exit_code': exit_code,
            'command': command.strip()
        }
    else:
        return None

# Разбираем лог построчно
log_lines = log_data.strip().split('\n')
parsed_logs = [parse_log_line(line) for line in log_lines]

# Выводим результат
for log_entry in parsed_logs:
    if log_entry:
        print(log_entry)
