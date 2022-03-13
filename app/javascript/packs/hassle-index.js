import Vue from 'vue'
import HassleIndex from '../hassle-index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-hassle-index'
  const hassleIndex = document.querySelector(selector)
  if (hassleIndex) {
    new Vue({
      render: h => h(HassleIndex)
    }).$mount(selector)
  }
})

window.onload = function () {
  const cookieArray = []
  if (document.cookie !== '') {
    const tmp = document.cookie.split('; ')
    for (let i = 0; i < tmp.length; i++) {
      const data = tmp[i].split('=')
      cookieArray[data[0]] = decodeURIComponent(data[1])
    }
  }

  const modalBrowse = cookieArray.modalBrowse
  const modal = document.getElementById('js_modal')

  if (!modalBrowse) {
    modal.classList.add('is_active')
    document.cookie = 'modalBrowse=allready; max-age=1'
  }

  const modalClose = document.getElementsByClassName('js_modal_close')
  for (let i = 0; i < modalClose.length; i++) {
    modalClose[i].onclick = function () {
      modal.classList.remove('is_active')
    }
  }
}
