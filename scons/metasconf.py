# vi: syntax=python:et:ts=4
from SCons.Script import *
import sys

def init_metasconf(env, module_names):
    syspath_bak = sys.path
    sys.path = ['scons']
    modules = [__import__(mod_name) for mod_name in module_names]
    sys.path = syspath_bak
    config_checks = {}
    for module in modules:
        try:
            config_checks.update(module.config_checks)
        except Exception as e:
            print("Module {} doesn't provide config_checks?".format(module.__name__))
            raise
    return config_checks
