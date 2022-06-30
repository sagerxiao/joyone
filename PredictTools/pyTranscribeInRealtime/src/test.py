# -*- coding: utf-8 -*-
"""
# @Licensed : (C) Copyright for free 
# @Time     : 2022/6/27 - 17:23
# @Author   : Harrison Yao
# @FILE     : test.py
# @Version  : 
# @Function : 

# @Requirements:
    
"""
import pyaudio
import websockets
import asyncio
import speech_recognition as sr

dic = ('afrikaans', 'af', 'albanian', 'sq',
       'amharic', 'am', 'arabic', 'ar',
       'armenian', 'hy', 'azerbaijani', 'az',
       'basque', 'eu', 'belarusian', 'be',
       'bengali', 'bn', 'bosnian', 'bs', 'bulgarian',
       'bg', 'catalan', 'ca', 'cebuano',
       'ceb', 'chichewa', 'ny', 'chinese (simplified)',
       'zh-cn', 'chinese (traditional)',
       'zh-tw', 'corsican', 'co', 'croatian', 'hr',
       'czech', 'cs', 'danish', 'da', 'dutch',
       'nl', 'english', 'en', 'esperanto', 'eo',
       'estonian', 'et', 'filipino', 'tl', 'finnish',
       'fi', 'french', 'fr', 'frisian', 'fy', 'galician',
       'gl', 'georgian', 'ka', 'german',
       'de', 'greek', 'el', 'gujarati', 'gu',
       'haitian creole', 'ht', 'hausa', 'ha',
       'hawaiian', 'haw', 'hebrew', 'he', 'hindi',
       'hi', 'hmong', 'hmn', 'hungarian',
       'hu', 'icelandic', 'is', 'igbo', 'ig', 'indonesian',
       'id', 'irish', 'ga', 'italian',
       'it', 'japanese', 'ja', 'javanese', 'jw',
       'kannada', 'kn', 'kazakh', 'kk', 'khmer',
       'km', 'korean', 'ko', 'kurdish (kurmanji)',
       'ku', 'kyrgyz', 'ky', 'lao', 'lo',
       'latin', 'la', 'latvian', 'lv', 'lithuanian',
       'lt', 'luxembourgish', 'lb',
       'macedonian', 'mk', 'malagasy', 'mg', 'malay',
       'ms', 'malayalam', 'ml', 'maltese',
       'mt', 'maori', 'mi', 'marathi', 'mr', 'mongolian',
       'mn', 'myanmar (burmese)', 'my',
       'nepali', 'ne', 'norwegian', 'no', 'odia', 'or',
       'pashto', 'ps', 'persian', 'fa',
       'polish', 'pl', 'portuguese', 'pt', 'punjabi',
       'pa', 'romanian', 'ro', 'russian',
       'ru', 'samoan', 'sm', 'scots gaelic', 'gd',
       'serbian', 'sr', 'sesotho', 'st',
       'shona', 'sn', 'sindhi', 'sd', 'sinhala', 'si',
       'slovak', 'sk', 'slovenian', 'sl',
       'somali', 'so', 'spanish', 'es', 'sundanese',
       'su', 'swahili', 'sw', 'swedish',
       'sv', 'tajik', 'tg', 'tamil', 'ta', 'telugu',
       'te', 'thai', 'th', 'turkish',
       'tr', 'ukrainian', 'uk', 'urdu', 'ur', 'uyghur',
       'ug', 'uzbek', 'uz',
       'vietnamese', 'vi', 'welsh', 'cy', 'xhosa', 'xh',
       'yiddish', 'yi', 'yoruba',
       'yo', 'zulu', 'zu')

FRAMES_PER_BUFFER = 3200
FORMAT = pyaudio.paInt16
CHANNELS = 1 #1
RATE = 16000
p = pyaudio.PyAudio()

# starts recording
stream = p.open(
    format=FORMAT,
    channels=CHANNELS,
    rate=RATE,
    input=True,
    frames_per_buffer=FRAMES_PER_BUFFER
)

async def send_receive():
    r = sr.Recognizer()

    async def send():
        while True:
            try:
            #     data = stream.read(FRAMES_PER_BUFFER)
            #     data = base64.b64encode(data).decode("utf-8")
            #     json_data = json.dumps({"audio_data": str(data)})
            #     await _ws.send(json_data)
            # except websockets.exceptions.ConnectionClosedError as e:
            #     print(e)
            #     assert e.code == 4008
            #     break
            # except Exception as e:
            #     assert False, "Not a websocket 4008 error"
            # await asyncio.sleep(0.01)

            try:
                print("Recognizing.....")
                audio = stream.read(FRAMES_PER_BUFFER)
                query = r.recognize_google(audio, language='en-in')
                print(f"The User said {query}\n")
            except Exception as e:
                print("say that again please.....")
                return "None"
            return query


        return True

    async def receive():
        while True:
            try:
                result_str = await _ws.recv()
                print(json.loads(result_str)['text'])
            except websockets.exceptions.ConnectionClosedError as e:
                print(e)
                assert e.code == 4008
                break
            except Exception as e:
                assert False, "Not a websocket 4008 error"

    send_result, receive_result = await asyncio.gather(send(), receive())

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    while True:
        asyncio.run(send_receive())