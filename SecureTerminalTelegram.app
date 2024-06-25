import os, telebot, random
chars = '+-/*!&$#?=@<>abcdefghijklnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'
for i in range(8):
    identifier = ''
    for i in range(8):identifier += random.choices(chars)
creator_id = 'ACCESS ID'# Enter your ID
os.system('sudo clear')
tk = telebot.TeleBot('BOT TOKEN')# Enter Telegram bot token
@tk.message_handler(commands=['start'])# If user start bot
def start(message):
    id = message.chat.id
    tk.send_message(id, f'Unique identifier is {identifier}')
@tk.message_handler(func=lambda message: True)
def handle_message(message):
    id = message.from_user.id
    text = message.text
    if text.find('su') != -1 or text.find('su -') != -1 or text.find('exit') != -1 or text.find('python3') != -1 or text.find('fish') != -1:# If user write su or su - or exit or python3 or fish command dont get runned
        tk.send_message(id, 'Terminal: not allowed')
        fn = True
    else:fn = False
    if text.find('as su') != -1 and str(id) == creator_id and fn == False:# If user want run command at sudo(type "as su")
        su = True
        result = os.system(f'sudo {text}')
        if int(result) == 32512:tk.send_message(id, 'Terminal: command was failed of running')
        else:tk.send_message(id, 'Terminal: command succeful completed')
    else:su = False
    if su == False and str(id) == creator_id and fn == False:
        result = os.system(text)
        if int(result) == 32512:tk.send_message(id, 'Terminal: command was failed of running')
        else:tk.send_message(id, 'Terminal: command succeful completed')
tk.polling()