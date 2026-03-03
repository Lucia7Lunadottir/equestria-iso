#!/bin/bash
# EG Character Terminal — добавляет имя персонажа перед выводом команд
# Добавь source ~/.local/share/konsole/ИМЯ.bashrc в ~/.bashrc
# Этот файл подключается автоматически через профиль

# ── Настройки персонажа ────────────────────────────────
# Эта переменная меняется в каждом профиле
EG_CHARACTER="${EG_CHARACTER:-Sci-Twi}"
EG_CHARACTER_COLOR="${EG_CHARACTER_COLOR:-135}"  # 135 = фиолетовый

# ── Функция обёртки команды ────────────────────────────
eg_run() {
    # Запускаем команду и добавляем имя персонажа перед выводом
    local cmd="$*"
    local output
    local exit_code

    output=$(eval "$cmd" 2>&1)
    exit_code=$?

    if [ -n "$output" ]; then
        echo -e "\e[38;5;${EG_CHARACTER_COLOR}m[${EG_CHARACTER}]\e[0m $output" | sed '2,$s/^/              /'
    fi

    return $exit_code
}

# ── Перехватчик команд через DEBUG trap ────────────────
eg_preexec() {
    EG_LAST_CMD="$BASH_COMMAND"
}

eg_postexec() {
    local exit_code=$?
    # Не показываем персонажа для пустых команд и самого cd
    if [ -n "$EG_LAST_CMD" ] && [ "$EG_LAST_CMD" != "$PROMPT_COMMAND" ]; then
        : # персонаж уже показан через PS1
    fi
    return $exit_code
}

# ── PS1 с именем персонажа ─────────────────────────────
# Формат: [Sci-Twi] lucia@PGOS ~/projects $
PS1='\[\e[38;5;'${EG_CHARACTER_COLOR}'m\]['"${EG_CHARACTER}"']\[\e[0m\] \[\e[1;37m\]\u@\h\[\e[0m\] \[\e[38;5;244m\]\w\[\e[0m\] \$ '

# ── Алиас для интерактивного режима ───────────────────
# Пишешь: twi ls -la
# Она отвечает: [Sci-Twi] вывод команды
twi()   { EG_CHARACTER="Sci-Twi"      EG_CHARACTER_COLOR=135 eg_run "$@"; }
sunset(){ EG_CHARACTER="Sunset"        EG_CHARACTER_COLOR=214 eg_run "$@"; }
dash()  { EG_CHARACTER="Rainbow Dash"  EG_CHARACTER_COLOR=39  eg_run "$@"; }
rare()  { EG_CHARACTER="Rarity"        EG_CHARACTER_COLOR=189 eg_run "$@"; }
pinkie(){ EG_CHARACTER="Pinkie Pie"    EG_CHARACTER_COLOR=205 eg_run "$@"; }
aj()    { EG_CHARACTER="Applejack"     EG_CHARACTER_COLOR=136 eg_run "$@"; }
flutter(){ EG_CHARACTER="Fluttershy"   EG_CHARACTER_COLOR=228 eg_run "$@"; }
