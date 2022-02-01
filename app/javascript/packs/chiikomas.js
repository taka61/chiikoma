import Vue from 'vue'
import Chiikomas from '../chiikomas.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-chiikomas'
  const chiikomas = document.querySelector(selector)
  if (chiikomas) {
    new Vue({
      render: h => h(Chiikomas)
    }).$mount(selector)
  }
})
