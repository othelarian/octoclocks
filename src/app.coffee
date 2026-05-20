lst =
  depb: 1779379560
  #depb: 1779286209
  arrn: 1779387900
  depr: 1779427860
  arrl: 1779442200

togDay = yes
timer = null

on2 = (v) -> if v < 10 then "0#{v}" else "#{v}"

update = ->
  dte = new Date()
  dte.setMilliseconds(0)
  dte = dte.getTime() / 1000
  for tm, v of lst
    elt = document.getElementById tm
    if v < dte
      elt.classList.add 'done'
      elt.innerText = 'DONE'
      delete lst[tm]
    else
      j = h = m = ''
      diff = v - dte
      rj =
        if togDay and diff > 86400
          tj = Math.floor(diff/86400)
          j = "#{tj}j "
          diff - (tj*86400)
        else diff
      rh =
        if rj > 3600
          th = Math.floor(rj/3600)
          h = "#{on2(th)}:"
          rj - (th*3600)
        else rj
      rm =
        if rh > 60
          tm = Math.floor(rh/60)
          m = "#{on2(tm)}:"
          rh - (tm*60)
        else rj
      elt.innerText = "#{j}#{h}#{m}#{on2(rm)}"
  timer = setTimeout update, (1000 - (new Date().getMilliseconds()))

window.toggleDay = ->
  clearTimeout timer
  togDay = not togDay
  update()

window.init = ->
  update()

