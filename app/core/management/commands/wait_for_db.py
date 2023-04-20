'''custom command to wait for databasse server ready'''

from psycopg2 import OperationalError as Psycopg2Error

from django.db.utils import OperationalError

from django.core.management.base import BaseCommand

from time import sleep

class Command(BaseCommand):
    '''Command to wait for database ready'''

    def handle(self, *args, **kargs):
        '''Command handler.'''
        pass