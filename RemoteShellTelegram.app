# # #
Access = 'ID'# 'Any' - access to your terminal for anyone, 'ID' - access only for 1 ID
ID = ''# Your telegram ID(for access setting 'ID')
Token_Of_Bot = ''# Token bot
# # 1
RST_build = '1.0.3'
import os, random, telebot
# # 2
if Access == 'Any':Access = 1
if Access == 'ID':Access = 0
tk = telebot.TeleBot(Token_Of_Bot)
for i in range(8):
    unique_identifier = ''
    for i in range(8):unique_identifier += random.choice('+-/*!&$#?=@<>abcdefghijklnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890')
# 1
print('Please login at sudo')
os.system('sudo clear')
# 2
print(f'Your unique code: {unique_identifier}')
@tk.message_handler(commands=['start'])
def Command_Start(message):
    id = message.chat.id
    tk.send_message(id, f'Unique identifier:{unique_identifier}, client is online')
@tk.message_handler(func=lambda message: True)
def handler(message):
    id = message.chat.id
    command = message.text
    if Access == 0 and ID == str(id):
        if command.find('as su') != 1:su = True
        else:su = False
        if command.find('su') != -1 or command.find('su -') != -1 or command.find('fish') != -1 or command.find('python3') != -1 or command.find('exit') != -1:
            tk.send_message(id, 'RST_Host: This command dont allowed to run')
            dr = False
        else:dr = True
        if dr == True:
            if su == True:
                if str(os.system(f'sudo {command}')) == '32512':tk.send_message(id, 'RST_Host: Command dont run correctly')
                else:tk.send_message(id, 'RST_Host: Command succefull completed')
            else:
                if str(os.system(command)) == '32512':tk.send_message(id, 'RST_Host: Command dont run correctly')
                else:tk.send_message(id, 'RST_Host: Command succefull completed')
    if Access == 1:
        if command.find('as su') != 1:su = True
        else:su = False
        if command.find('su') != -1 or command.find('su -') != -1 or command.find('fish') != -1 or command.find('python3') != -1 or command.find('exit') != -1:
            tk.send_message(id, 'RST_Host: This command dont allowed to run')
            dr = True
        else:dr = False
        if dr == True:
            if su == True:
                if str(os.system(f'sudo {command}')) == '32512':tk.send_message(id, 'RST_Host: Command dont run correctly')
                else:tk.send_message(id, 'RST_Host: Command succefull completed')
            else:
                if str(os.system(command)) == '32512':tk.send_message(id, 'RST_Host: Command dont run correctly')
                else:tk.send_message(id, 'RST_Host: Command succefull completed')
tk.polling()