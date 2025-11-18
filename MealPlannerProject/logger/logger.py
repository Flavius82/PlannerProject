import logging
import sys


logger = logging.getLogger()

formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
formatter2 = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')

stream_handler = logging.StreamHandler(sys.stdout)
stream_handler.setFormatter(formatter)

file_handler = logging.FileHandler("info.log")
file_handler.setFormatter(formatter2)

logger.handlers = [stream_handler, file_handler]
logger.setLevel(logging.DEBUG)