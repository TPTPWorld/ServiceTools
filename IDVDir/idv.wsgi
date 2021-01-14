import sys
import os
idvPath = os.path.dirname(os.path.realpath(__file__))

sys.path.insert(0, idvPath)
from app import app as application

