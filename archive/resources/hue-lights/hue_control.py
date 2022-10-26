#!/usr/bin/python3

import argparse
import logging
import requests
from phue import Bridge

## Setup logging
logfile = '/home/jack/.logging/hue_logs.log'
logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
                    filename=logfile, filemode='a', level=logging.INFO)
logger = logging.getLogger(__name__)

def get_args():
    '''
    Get Args and return the light name
    '''
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('light', metavar='N', nargs='+',
                        help='Light Name')
    args = parser.parse_args()
    return args.light[0]

def connect():
    '''
    Connection to bridge
    '''
    logger.info('Connecting to Bridge...')
    b = Bridge(ip)
    b.connect()
    logger.info(f'Bridge Connected')
    return b

ip = ""

try:
    ActionLight = get_args()
    logger.info(f'Received action for light {ActionLight}')

    b = connect()

    light_names = b.get_light_objects('name')

    lightstate = light_names[ActionLight].on # Bool of light state

    logger.info(f'{ActionLight} state is {lightstate}')

    if lightstate == False:
        light_names[ActionLight].on = True
    elif lightstate == True:
        light_names[ActionLight].on = False

except Exception as e:
    logger.error(str(e))
