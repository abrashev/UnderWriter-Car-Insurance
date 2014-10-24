# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
BREAKDOWNCOVER_ID = '#quotation_breakdowncover'
WINDSCREENREPAIR_ID = '#quotation_windscreenrepair_t'
WINDSCREENREPAIR1_ID = '#quotation_windscreenrepair_f'
$(document).on "ready", ->
 bindAll = ->
 $(BREAKDOWNCOVER_ID).change (event) ->
 #if $(this).val '0'
 #alert('gpppd')
 $(WINDSCREENREPAIR_ID).attr('checked','checked')
 $(WINDSCREENREPAIR1_ID).attr('checked','')
 
 bindAll()