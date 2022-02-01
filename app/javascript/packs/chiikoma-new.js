import Vue from 'vue'
import ChiikomaNew from '../chiikoma-new.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-chiikoma-new'
  const chiikomaNew = document.querySelector(selector)
  if (chiikomaNew) {
    new Vue({
      render: h => h(ChiikomaNew)
    }).$mount(selector)
  }
})
