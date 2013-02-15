# -*- coding:utf-8 -*-

from pyramid.view import view_config
import model

@view_config(route_name='home', renderer='home.mak')
def home_view(request):
    """
    home_view : ルート呼び出し時のview
    """

    return {}

@view_config(route_name='ajax', renderer='json')
def ajax_view(request):
    """
    :param request:
    ajax_view : json呼び出し時のview
    """
    try:
        data = model.searchDict[request.params['send_data']]
        return { 'send_data' : data }
    except KeyError as e:
        return { 'send_data' : str(e) }