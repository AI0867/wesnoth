# vi: syntax=python:et:ts=4
from SCons.Script import *

def init_metasconf(env, modules):
    modules = map(__import__, modules)
    config_checks = {}
    for module in modules:
        try:
            config_checks.update(module.config_checks)
        except Exception as e:
            print("Module {} doesn't provide config_checks?".format(module.__name__))
            raise
    return config_checks
