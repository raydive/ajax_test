# -*- coding:utf-8 -*-

from pyramid.config import Configurator


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    config = Configurator(settings=settings)
    config.add_static_view('static', 'ajax_test:static', cache_max_age=3600)
    config.add_route('home', '/')
    config.add_route('ajax', '/ajax')
    config.scan('ajax_test')
    return config.make_wsgi_app()
